#!/bin/bash
while true; do
    read -p "Do you wish to install this program? (y/n) : " yn
    case $yn in
        [Yy]* ) 
            cp zshrc ~/.zshrc;
            cp vimrc ~/.vimrc;
            cp minimal.zsh-theme ~/.oh-my-zsh/themes/;
            break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
