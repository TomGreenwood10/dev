#!/bin/bash

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
nvm install node
npm i -g pyright
npm i -g bash-language-server
npm i -g sql-language-server

mkdir -p ~/.config/nvim/autoload
mkdir -p ~/.config/nvim/plugged
mkdir -p ~/.config/nvim/undodir
mkdir -p ~/.config/nvim/plug-config
sudo chmod 777 ~/.config/nvim/*
cp config-files/lsp-config.vim ~/.config/nvim/plug-config/lsp-config.vim
cp config-files/init.vim ~/.config/nvim/init.vim

sudo apt install -y build-essential python3-dev python3-pip
sudo snap install nvim --classic

curl -fLo ~/.config/nvim/autoload/plug.vim \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

nvim -c PlugInstall +qa
