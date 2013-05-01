# .bashrc

# Source global definitions
[ -e ~/etc/bashrc ] && . ~/etc/bashrc || true

export EDITOR="/usr/bin/vim"

# Add local python stuff to our PATH
export PATH="${PATH}:${HOME}/.local/bin/"

# Set TERM so tmux is pretty
export TERM="xterm-256color"

# Get a powerline prompt
. ${HOME}/.local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh

# Source in aliases
. ~/.aliases

# Hook in to user specific configs that have been pushed up by different users
[ -e ~/.bashrc.local ] && . ~/.bashrc.local || true
[ -e ~/.aliases.local ] && . ~/.aliases.local || true
