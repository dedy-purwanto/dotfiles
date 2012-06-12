#!/usr/bin/env bash
ln -f .bashrc ~/
ln -f .vimrc ~/
ln -f .tmux.conf ~/
ln -f .gitconfig ~/
ln -f .hgrc ~/
ln -f .Xmodmap ~/

sh gnome-terminal-colors-solarized/set_dark.sh
ln -f ls-colors-solarized/dircolors ~/.dircolors
