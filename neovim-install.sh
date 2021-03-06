#!/bin/bash

# Debugging: exit when any command fails, and print error message
set -e
trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG
trap 'echo "\"${last_command}\" command failed with exit code $?."' EXIT

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
curl -fLo ~/.config/nvim/plug-config/lsp-config.vim \
    https://raw.githubusercontent.com/TomGreenwood10/dev/master/resources/neovim/lsp-config.vim
curl -fLo ~/.config/nvim/init.vim \
    https://raw.githubusercontent.com/TomGreenwood10/dev/master/resources/neovim/init.vim

# Install utils and neovim
sudo apt install -y build-essential python3-dev python3-pip
pip install pynvim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage --appimage-extract
sudo mv squashfs-root /
sudo ln -s /squashfs-root/AppRun /usr/bin/nvim

# Install plugins
curl -fLo ~/.config/nvim/autoload/plug.vim \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

nvim -c PlugInstall +qa

# =============================================================================
# Removed scala install as it's buggy and interfears with pip install pyspark
# Left here for future reference / modification
# -----------------------------------------------------------------------------
# 
# # Install scala support (installs coursier which in-turn installs sbt, java, 
# # scala etc.):
# 
# # Install coursier launcher (cs)
# curl -fLo cs https://git.io/coursier-cli-"$(uname | tr LD ld)"
# chmod +x cs
# ./cs install cs
# rm cs
# export PATH="$PATH:/home/vagrant/.local/share/coursier/bin"
# 
# # Add path to bashrc to work on future shells
# echo '' >> ~/.bashrc
# echo '# Path to coursier (cs) executable directory' >> ~/.bashrc
# echo 'export PATH="$PATH:/home/vagrant/.local/share/coursier/bin"' >> ~/.bashrc
# echo '' >> ~/.bashrc
# 
# # Install other tools with cs (this prompts user for multiple inputs)
# cs setup
# cs install metals
# ============================================================================
