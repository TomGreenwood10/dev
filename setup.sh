#!/bin/bash
#
# Installs required tools and configurations to environment

echo Setting up environment ...

# Asking user what to install (common / small thing will always be installed)
read -p "Enter git username: " git_username
read -p "Enter git email: " git_email
read -p "Add ZScaler certificate? (y/n): " zscaler_cert
read -p "Install and configure neovim? (y/n): " neovim
read -p "Install desktop GUI? (y/n): " desktop

# Main installation script
sudo apt update
sudo apt upgrade

git config --global user.name "$git_username"
git config --global user.email "$git_email"

source scripts/misc-install.sh
if [ "$zscaler_cert" == "y" ]; then source scripts/certification-setup.sh; fi
if [ "$neovim" == "y" ]; then source scripts/nvim-install.sh
