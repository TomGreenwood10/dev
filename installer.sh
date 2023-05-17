#!/bin/bash
	
# Script to install various softwares chosen by users (add to over time)

# # Debugging: exit when any command fails, and print error message
# set -e
# trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG
# trap 'echo "\"${last_command}\" command failed with exit code $?."' EXIT

# Add installer script paths to the below hashmap
declare -A installers
installers["neovim"]=./installers/neovim.sh
installers["docker"]=./installers/docker.sh
installers["awscli"]=./installers/awscli.sh
installers["terraform"]=./installers/terraform.sh
installers["java"]=./installers/java.sh

softwares_all=("neovim" "docker" "awscli" "terraform", "java")
softwares_install=()


# Functions
collect_preferences () {
  for software in ${softwares_all[@]}; do
    echo "Install $software? [y/n]"
    read choice
    if [ $choice = "y" ]; then
      softwares_install+=($software)
    fi
  done
}


install_preferences () {
  for software in ${softwares_install[@]}; do
    echo "Installing $software..."
    ${installers[$software]}
  done
}


# Main script
collect_preferences
install_preferences

