#!/bin/bash
while true; do
    read -p "Do you wish to link dotfiles? WARNING: It will override your existing dotfiles, please check openup this script to see the full list of overrides. (y/n) : " yn
    case $yn in
        [Yy]* ) 
            ln -s -f `pwd`/zshrc ~/.zshrc;
            ln -s -f `pwd`/vimrc ~/.vimrc;
            ln -s -f `pwd`/gitconfig ~/.gitconfig;
            ln -s -f `pwd`/hgrc ~/.hgrc;
            ln -s -f `pwd`/minimal.zsh-theme ~/.oh-my-zsh/themes/;
            break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
