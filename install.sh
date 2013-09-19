#!/bin/bash

if [ -d ~/.dotfiles ]; then
  cd ~/.dotfiles
  git pull origin
else
  git clone https://github.com/tar672/dotfiles.git ~/.dotfiles
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
	cat $file
  if [ -d $file ]; then
		ln -s -f $file ~/.$file
  else
    cp -f $file ~/.$file
  fi
done

source ~/.bashrc
