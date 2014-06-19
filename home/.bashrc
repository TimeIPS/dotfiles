# .bashrc

# Source global definitions
[ -e ~/etc/bashrc ] && . ~/etc/bashrc || true

# This needs to be set for tmuxinator and besides, it's just a good idea :)
export EDITOR="/usr/bin/vim"

# Add local python stuff like the powerline executable to our PATH
export PATH="${PATH}:${HOME}/.local/bin/"

# Add ~/bin to path
export PATH="${PATH}:${HOME}/bin/"

# Instead of conflicting with ~/.config we are going to define our own config
# stuff in ~/.my_config
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CONFIG_DIRS="${HOME}/.my_config:/etc/xdg"

# If you're using a 256 color terminal you get an expanded vim config,
# otherwise you get a minimally functional version.
if [[ $TERM == *256* ]]; then
    export VIMINIT="source ~/.vimrc"
else
    export VIMINIT="source ~/.vimrc.warehouse"
fi

# Customize the mysql client prompt
export MYSQL_PS1="mysql > \d > \R:\m:\s > "

# Improve history
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000
HISTTIMEFORMAT="%F %T "

# Source in aliases
. ~/.aliases

# Source in the git prompt util provided in git core
source /usr/share/git-core/contrib/completion/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWCOLORHINTS=true

# Define a function for our PS1 prompt
__timeips_ps1() {
    bold="\["$(tput bold)"\]"
    normal="\["$(tput sgr0)"\]"

    local ps1="  ${bold}${TIMEIPS_CUSTOMER}${normal} >"
    if [ "" != "${TIMEIPS_PORT}" ]; then
        ps1="${ps1} ${TIMEIPS_PORT} >"
    fi
    ps1="${ps1} \w >"

    # Call __git_ps1 with 2 arguments: what to print before the git info and
    # what to print after
    __git_ps1 "${ps1}" " "
}

PROMPT_COMMAND='__timeips_ps1'

# Hook in to user specific configs that have been pushed up by different users
[ -e ~/.bashrc.local ] && . ~/.bashrc.local || true
[ -e ~/.aliases.local ] && . ~/.aliases.local || true
