#!/bin/sh

mkdir -p ~/.config/nvim/autoload
mkdir -p ~/.config/nvim/plugged
mkdir -p ~/.config/nvim/undodir
sudo chmod 777 ~/.config/nvim/*

curl -fLo ~/.config/nvim/autoload/plug.vim \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
curl -fLo ~/.config/nvim/init.vim \
    https://raw.githubusercontent.com/tomgreenwood10/dev/master/init.vim

nvim -c PlugInstall +qa

sudo apt install build-essential cmake vim-nox python3-dev
sudo apt install -y mono-complete golang nodejs default-jdk npm

python3 ~/.config/nvim/plugged/YouCompleteMe/install.py --all

