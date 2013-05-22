# .bash_profile

if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

[ -e .bash_profile.local ] && source .bash_profile.local
