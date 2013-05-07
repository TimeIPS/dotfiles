# .bashrc

# Source global definitions
[ -e ~/etc/bashrc ] && . ~/etc/bashrc || true

# This needs to be set for tmuxinator and besides, it's just a good idea :)
export EDITOR="/usr/bin/vim"

# Set TERM so tmux is pretty
export TERM="xterm-256color"

# Add local python stuff like the powerline executable to our PATH
export PATH="${PATH}:${HOME}/.local/bin/"

# Instead of conflicting with ~/.config we are going to define our own config
# stuff in ~/.my_config
export POWERLINE_CONFIG_HOME="${HOME}/.my_config"

# Get a powerline prompt
. ${HOME}/.local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh

# Customize the mysql client prompt
export MYSQL_PS1="mysql  \d  \R:\m:\s  "

# Source in aliases
. ~/.aliases

# Hook in to user specific configs that have been pushed up by different users
[ -e ~/.bashrc.local ] && . ~/.bashrc.local || true
[ -e ~/.aliases.local ] && . ~/.aliases.local || true
