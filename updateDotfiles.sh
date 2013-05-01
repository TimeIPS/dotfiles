#!/usr/bin/bash

repo=${HOME}/.dotfiles
cd $repo
git pull origin master

for file in $(find . -maxdepth 1 -name ".*" -not -name ".git" -not -name "." -exec basename {} \;); do
    ln -sf ${repo}/${file} ${HOME}/
done;

# Commenting out for testing. TODO put this back.
#sh <( curl https://raw.github.com/TimeIPS/spf13-vim/3.0/bootstrap.sh -L )
