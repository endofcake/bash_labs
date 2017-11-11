# Customising the shell – bash profile

## Tweaking `.bash_profile`

The exact sequence in which bash configuration files are loaded is [somewhat complicated](https://stackoverflow.com/questions/415403/whats-the-difference-between-bashrc-bash-profile-and-environment) and depends on the system and whether the shell is interactive or not. The best way to understand it would be to add a simple logging statement on top of each file:
```
echo "Loading system bash.bashrc..."
```

For most cases this is not necessary and it's enough to just add everything you need into user profile.

Create it if it doesn't exist already:
```
touch .bash_profile
```

This file accepts regular bash commands, so can do *a lot* of things.

Some ideas:
* create an alias for a frequently used command:
```
alias vs="devenv.exe -edit $*"
```
This will open a file in Visual Studio (assuming that `devenv.exe` is in the `PATH`).

* start shell in a specific folder:
```
cd /c/dev/
```

* configure history for better experience with incremental search:
```
# ignore duplicates
export HISTCONTROL=ignoreboth:erasedups

# unlimited bash history
export HISTFILESIZE=
export HISTSIZE=
```

* you can even read some secrets from a secret store, decrypt them and store in environment variables for the duration of the interactive session.

### Add extra tab-completion sources

This is a little bit more involved, but can make day-to-day work much easier if configured correctly.

* clone `bash-it` – the community Bash framework.
```
git clone https://github.com/Bash-it/bash-it.git
```

* take a look at available completions and source the ones that you want in your `.bash_profile` (assuming you cloned it in `/c/dev/public/`):
```
source /c/dev/public/bash-it/completion/available/docker.completion.bash
source /c/dev/public/bash-it/completion/available/docker-compose.completion.bash
source /c/Dev/public/bash-it/completion/available/npm.completion.bash
source /c/Dev/public/bash-it/completion/available/terraform.completion.bash
```

* if you want to add AWS CLI completions, you can add them too:
```
source /c/dev/public/bash-it/completion/available/awscli.completion.bash
```

**NB**: To make this work correctly on Windows, you will have to install AWS CLI using `pip` (that is you first have to install Python), **not** using the default `exe` installer.

### Bonus points

Customise command prompt to look like `cmder` :grinning::
```
PS1='\[\033]0;${PWD//[^[:ascii:]]/?}\007\]' # set window title

# non-printable characters must be enclosed inside \[ and \]
PS1="$PS1"'\[\033[1;32m\]'            # set colour to green
PS1="$PS1"'\w'                        # current working directory

# display git branch
if test -z "$WINELOADERNOEXEC"
then
    GIT_EXEC_PATH="$(git --exec-path 2>/dev/null)"
    COMPLETION_PATH="${GIT_EXEC_PATH%/libexec/git-core}"
    COMPLETION_PATH="${COMPLETION_PATH%/lib/git-core}"
    COMPLETION_PATH="$COMPLETION_PATH/share/git/completion"
    if test -f "$COMPLETION_PATH/git-prompt.sh"
    then
        . "$COMPLETION_PATH/git-completion.bash"
        . "$COMPLETION_PATH/git-prompt.sh"
        PS1="$PS1"'\[\033[1;34m\]'  # set colour to blue
        PS1="$PS1"'`__git_ps1`'   # bash function
    fi
fi

PS1="$PS1"'\n'                        # new line
PS1="$PS1"'\[\033[1;33m\]'            # set colour to yellow
PS1="$PS1"'λ: '                       # λ: + space
PS1="$PS1"'\[\033[0m\]'               # reset colour
```

Read more about [tweaking the Bash prompt](http://tldp.org/HOWTO/Bash-Prompt-HOWTO/index.html), if you're interested.
