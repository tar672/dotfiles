#!/bin/bash

if [ -d ~/.dotfiles ]; then
  cd ~/.dotfiles
  git pull -q origin
else
  git clone --recursive -q https://github.com/tar672/dotfiles.git ~/.dotfiles
fi

cd ~/.dotfiles/dotfiles
for file in *
do
	if [ -f ~/.$file ]; then
		echo "Overwrote $file"
		mv ~/.$file ../.old
  fi
done
echo "old files are saved in ~/.dotfiles/.old"

for file in *
do
	ln -s -f ~/.dotfiles/dotfiles/$file ~/.$file
done

source ~/.bashrc
