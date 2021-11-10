#!/bin/bash

# Download nodejs and install language servers
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
nvm install node
npm i -g pyright
npm i -g bash-language-server

# Create condif directories and files
mkdir -p ~/.config/nvim/{autoload,plugged,undodir,plug-config}
sudo chmod 777 ~/.config/nvim/*
cp config-files/lsp-config.vim ~/.config/nvim/plug-config/lsp-config.vim
cp config-files/init.vim ~/.config/nvim/init.vim

# Install utils and neovim
sudo apt install -y build-essential python3-dev python3-pip
sudo snap install nvim --classic

# Install plugins
curl -fLo ~/.config/nvim/autoload/plug.vim \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

nvim -c PlugInstall +qa
