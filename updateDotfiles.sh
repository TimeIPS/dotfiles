#!/usr/bin/bash

repo=${HOME}/.dotfiles

linkdir () {
    local source;
    local target;
    local file;
    local subdir;

    source=$1;
    target=$2;

    # Link any dotfiles in source to target
    for file in $(find $source -maxdepth 1 -type f); do
        ln -sf $file $target
    done;

    for subdir in $(find $source -maxdepth 1 -type d -not -wholename "*.git*" -not -wholename "$source"); do
        if [ ! -e $target/$(basename $subdir) ]; then
            ln -sf $subdir $target
        elif [ ! -L $target/$(basename $subdir) ]; then
            linkdir $subdir $target/$(basename $subdir)
        fi
    done;
}

# Update our dotfiles
cd $repo
git pull origin master

# Start linking our config files into $HOME
linkdir $repo/home $HOME

# Update our vim configuration
bash <( curl https://raw.githubusercontent.com/TimeIPS/spf13-vim/3.0/bootstrap.sh -L )
