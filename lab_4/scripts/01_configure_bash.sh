#!/bin/bash
set -euf -o pipefail

echo "Setting up proper autocompletion and incremental history search"
cat << EOL >> /etc/inputrc
# Up/down arrows to search history
"\e[A": history-search-backward
"\e[B": history-search-forward

set completion-ignore-case on
set colored-stats on

# Make sure we don't output everything on the 1 line
set horizontal-scroll-mode Off

# none, visible or audible
set bell-style visible

set visible-stats off
set mark-directories on

set show-all-if-ambiguous on

# Ctrl + ←/→ to skip words
"\e[1;5C": forward-word
"\e[1;5D": backward-word

# Alt + ←/→ to skip words
"\e\e[C": forward-word
"\e\e[D": backward-word
EOL

echo "Modifying command prompt"
cat << EOL >> /etc/bash.bashrc
# ignore duplicates
export HISTCONTROL=ignoreboth:erasedups

# unlimited bash history
export HISTFILESIZE=
export HISTSIZE=
EOL

echo "Done setting up bash"
