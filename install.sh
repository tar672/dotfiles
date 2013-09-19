#!/bin/bash


cd ~

#git clone https://

cd .dotfiles

for file in *
do
  mv "$file" "../.$file"
done

source ~/.bashrc
