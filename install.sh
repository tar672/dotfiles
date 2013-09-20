#!/bin/bash

if [ -d ~/.dotfiles ]; then
  cd ~/.dotfiles
  git pull -q origin master
else
  git clone --recursive -q https://github.com/tar672/dotfiles.git ~/.dotfiles
fi

cd ~/.dotfiles/dotfiles

if [ ! -d ~/.dotfiles/old ]; then
  mkdir ~/.dotfiles/old
fi
for file in *
do
  if [ -d $file ] || [ -f $file ]; then
    echo "$file Moved to ~/.dotfiles/old/$file"
    mv -f ~/.$file ../old/
  fi
done

for file in *
do
  ln -s -f ~/.dotfiles/dotfiles/$file ~/.$file
done

source ~/.bashrc
