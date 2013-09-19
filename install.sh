#!/bin/bash

if [ -d ~/.dotfiles ]; then
  cd ~/.dotfiles
  git pull -q origin
else
  git clone --recursive -q https://github.com/tar672/dotfiles.git ~/.dotfiles
fi

cd ~/.dotfiles/dotfiles

git checkout -b not-a-dev-branch
mkdir ~/.dotfiles/old
for file in *
do
  echo "Overwrote $file"
  mv -f ~/.$file ../old/
done
echo "old files are saved in ~/.dotfiles/.old"

for file in *
do
	ln -s ~/.dotfiles/dotfiles/$file ~/.$file
done

source ~/.bashrc
