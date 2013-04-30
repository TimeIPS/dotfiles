#!/usr/bin/bash

repo=${HOME}/.dotfiles
cd $repo
git pull origin master

for file in $(find ${repo} -name ".*" -type f -exec basename {} \;); do
    ln -sf ${repo}/${file} ${HOME}/${file}
done;

sh <( curl https://raw.github.com/TimeIPS/spf13-vim/3.0/bootstrap.sh -L )
