#!/bin/sh

echo "Setting up Vim"

# Create .vim directory
mkdir ~/.vim/

# Copy all under vim/ to ~/.vim
cp -r vim/* ~/.vim/

# Link vimrc to ~/.vimrc
ln -s vimrc ~/.vimrc

echo "Done setting up Vim"
