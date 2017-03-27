# Customising the shell – Readline

## Main configuration files

There are several main files that are used to configure shell on a system:

* system-wide configuration files `bash.bashrc` (or simply `bashrc`) and `profile`, which can be found in `/etc/` folder (on Windows it's located inside Git installation directory, such as `C:\Program Files\Git\etc`)
* user-specific dotfiles `bashrc` and `.bash_profile` or `.profile`, which are located in the user's home folder.

The exact rules how all those files interact are [somewhat complicated](https://stackoverflow.com/questions/415403/whats-the-difference-between-bashrc-bash-profile-and-environment), so to avoid any surprises and understand in which order they run it can be useful to add logging commands at the start of each file. 

Another file that affects user experience of working with command line is `.inputrc` (and its system-wide `/etc/inputrc` counterpart). This is the configuration file of Readline — a library which provides line-editing and history capabilities for many command-line utilities, including bash.

## Some useful default Readling hotkeys

* `Tab` – autocomplete
* `Ctrl + l` – clear the screen
* `Ctrl + k` – cut forwards to the end of the line
* `Ctrl + u` – cut backwards to the start of the line
* `Alt + d` – cut forwards to the end of the current word
* `Alt + Delete` / `Ctrl + w` – cut backwards to the start of the current word
* `Ctrl + _` – incremental undo for editing commands
* `Ctrl + y` – paste the last deleted snippet (top of the kill ring)
* `Ctrl + t` – transpose characters
* `Alt + t` – transpose words
* `Alt + u` – uppercase the current word
* `Alt + l` – lowercase the current word
* `Alt + c` – capitalise the current word
* `Alt + #` – – comment the current line and start a new one

## Tweaking `.inputrc`

Let's start with the single most important improvement that you can make to your command line experience — enabling incremental history search.

Create `.inputrc` file in your home directory:
```
touch ~/.inputrc
```

Add the following snippet to it:
```
# Up/down arrows to search history
"\e[A": history-search-backward
"\e[B": history-search-forward
```
After you reload the console you will be able to search history incrementally — that is, filtering the commands that you want to see by providing a few of the starting characters of those commands. This makes a *huge* difference to your productivity on command line, as repeating the commands that you use often now takes only several keystrokes. The longer you use console to interact with your system, the better bash history works for you.

You can also use `Ctrl + ← / →` and `Alt + ← / →` to skip words:
```
# Ctrl + left/right arrows to skip words
"\e[1;5C": forward-word
"\e[1;5D": backward-word

# Alt + left/right arrows to skip words
"\e\e[C": forward-word
"\e\e[D": backward-word
```

Ignore case in Tab-completions (on Windows this is the default):
```
set completion-ignore-case on
```

Add some colour to Tab-completions:
```
set colored-stats on
```

Make sure we don't output everything on 1 line:
```
set horizontal-scroll-mode Off
```

Show all possible matches immediately, without having to hit `Tab` twice:
```
set show-all-if-ambiguous on
```