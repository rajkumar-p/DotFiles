#!/bin/sh

echo "============================"
echo "Setting up Vim configuration"
echo "============================"

echo "1) Checking if ~/.vim folder is already present"
vimdir=~/.vim
if [ -d "$vimdir" ]; then
  echo "  ~/.vim already present. Quiting."
  exit 1
fi
echo "done"

echo "2) Checking if ~/.vimrc is already present"
vimrc=~/.vimrc
if [ -f "$vimrc" ]; then
  echo "  ~/.vimrc already present. Quiting."
  exit 1
fi
echo "done"

echo "3) Linking Dotfiles/vim to ~/.vim"
tolinkvimdir=$PWD/vim
ln -s $tolinkvimdir $vimdir
if [ $? -ne 0 ]; then
  echo "  Error linking Dotfiles/vim to ~/.vim"
  exit 1
fi
echo "done"

echo "4) Linking Dotfiles/vimrc to ~/.vimrc"
tolinkvimrc=$PWD/vimrc
ln -s $tolinkvimrc $vimrc
if [ $? -ne 0 ]; then
  echo "  Error linking Dotfiles/vimrc to ~/.vimrc"
  exit 1
fi
echo "done"

echo "================================="
echo "Done setting up Vim configuration"
echo "================================="
