#!/usr/bin/bash

repo=${HOME}/.dotfiles

num=0
linkdir () {
    local source;
    local target;
    local file;
    local subdir;

    source=$1;
    target=$2;

    echo "***************************"
    echo "Going to link contents of $source to $target"

    echo "*** $source: Files"
    # Link any dotfiles in source to target
    for file in $(find $source -maxdepth 1 -type f); do
        echo "ln -sf $file $target"
        ln -sf $file $target
    done;

    echo "*** $source: Dirs"
    for subdir in $(find $source -maxdepth 1 -type d -not -wholename "*.git*" -not -wholename "$source"); do
        echo "***** Examining $subdir"
        echo "----- Looking for existence of $target/$(basename $subdir)";
        if [ ! -e $target/$(basename $subdir) ]; then
            echo "Target didn't already have a $(basename $subdir) so we'll link it"
            echo "ln -sf $subdir $target"
            ln -sf $subdir $target
        elif [ ! -L $target/$(basename $subdir) ]; then
            echo "Found regular directory. Merging contents"
            echo "linkdir $subdir $target/$(basename $subdir)"
            linkdir $subdir $target/$(basename $subdir)
        fi
    done;
}


# cd $repo
# git pull origin master
linkdir $repo/home $HOME









# Commenting out for testing. TODO put this back.
# Update our vim configuration
#sh <( curl https://raw.github.com/TimeIPS/spf13-vim/3.0/bootstrap.sh -L )
