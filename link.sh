#!/usr/bin/env bash
ln -f .bashrc ~/
ln -f .vimrc ~/
ln -f .tmux.conf ~/
ln -f .gitconfig ~/
ln -f .hgrc ~/
ln -f .Xmodmap ~/
ln -f .Xresources ~/
ln -f .zshrc ~/

ln -f ls-colors-solarized/dircolors ~/.dircolors
ln -f urxvt-tabbedex/tabbedex ~/.urxvt/
sh gnome-terminal-colors-solarized/set_dark.sh
