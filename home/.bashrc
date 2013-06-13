# .bashrc

# Source global definitions
[ -e ~/etc/bashrc ] && . ~/etc/bashrc || true

# This needs to be set for tmuxinator and besides, it's just a good idea :)
export EDITOR="/usr/bin/vim"

# Add local python stuff like the powerline executable to our PATH
export PATH="${PATH}:${HOME}/.local/bin/"

# Instead of conflicting with ~/.config we are going to define our own config
# stuff in ~/.my_config
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CONFIG_DIRS="${HOME}/.my_config:/etc/xdg"

if [ ! -z "$SSH_TTY" ]; then
    export TERM="xterm-256color"
    # Get a powerline prompt
    . ${HOME}/.local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh
    export VIMINIT="source ~/.vimrc"
else
    export TERM="xterm"
    export PS1="\u \w $ "
    export VIMINIT="source ~/.vimrc.warehouse"
fi

# Customize the mysql client prompt
export MYSQL_PS1="mysql  \d  \R:\m:\s  "

# Improve history
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000
HISTTIMEFORMAT="%F %T "

# Source in aliases
. ~/.aliases

# Hook in to user specific configs that have been pushed up by different users
[ -e ~/.bashrc.local ] && . ~/.bashrc.local || true
[ -e ~/.aliases.local ] && . ~/.aliases.local || true
