#!/bin/sh

sudo apt-get install -y python3-dev

sudo apt-get install -y neovim

mkdir -p ~/.config/nvim/autoload
mkdir -p ~/.config/nvim/plugged
mkdir -p ~/.config/nvim/undodir
sudo chmod 777 ~/.config/nvim/*

curl -fLo ~/.config/nvim/autoload/plug.vim \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
curl -fLo ~/.config/nvim/init.vim \
    https://raw.githubusercontent.com/tomgreenwood10/dev/master/init.vim

nvim -c PlugInstall +qa
sudo apt-get install -y cmake
python3 ~/.config/nvim/plugged/YouCompleteMe/install.py --clangd-completer

