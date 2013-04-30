# .bashrc

# Source global definitions
[ -e ~/etc/bashrc ] && . ~/etc/bashrc || true

# Add local python stuff to our PATH
export PATH="${PATH}:./.local/bin/"

# Get a powerline prompt
. ${HOME}/.local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh

# Hook in to user specific configs that have been pushed up by different users
[ -e ~/.bashrc.local ] && . ~/.bashrc.local || true
[ -e ~/.aliases.local ] && . ~/.aliases.local || true
