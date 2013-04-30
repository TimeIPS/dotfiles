# .bashrc

# Source global definitions
[ -e ~/etc/bashrc ] && . ~/etc/bashrc || true

# Hook in to user specific configs that have been pushed up by different users
[ -e ~/.bashrc.local ] && . ~/.bashrc.local || true
[ -e ~/.aliases.local ] && . ~/.aliases.local || true
