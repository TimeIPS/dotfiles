#!/usr/bin/bash

repo=${HOME}/.dotfiles
cd $repo
git pull origin master

for file in $(find ${repo} -name ".*" -type f); do
    ln -sf ${repo}/${file} ${HOME}/${file}
done;

bash <( curl git://github.com/TimeIPS/dotfiles.git -L )
