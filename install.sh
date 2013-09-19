#!/bin/bash


cd ~

git clone https://github.com/tar672/dotfiles.git .dotfiles

cd .dotfiles

for file in *
do
	if [ -f "$file" ]; then
		echo "Overwrote $file"
		mv "../$file" ./.old
  fi
done
echo "old files are saved in ~/.dotfiles/.old

for file in *
do
  cp "$file" "../.$file"
done

source ~/.bashrc
