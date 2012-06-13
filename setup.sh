#!/usr/bin/env bash
mkdir ~/.vim/
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

mkdir ~/.urxvt/

git submodule init
git submodule update

./link.sh
