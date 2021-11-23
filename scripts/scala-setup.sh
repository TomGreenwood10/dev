#!/bin/bash

# Script will install scala dev tools (coursier, sbt)
# Note: kept as seperate script as it requires user interaction
# Note: nvim-install.sh adds the scala language server to nvim (metals)

# Install coursier launcher (cs)
curl -fLo cs https://git/io/coursier-cli-"$(uname | tr LD ld)"
chmod +x cs
./cs install cs
rm cs
export PATH="$PATH:/home/vagrant/.local/share/coursier/bin"

# Add path to bashrc to work on future shells
echo '' >> ~/.bashrc
echo '# Path to coursier (cs) executable directory' >> ~/.bashrc
echo 'export PATH="$PATH:/home/vagrant/.local/share/coursier/bin"' >> ~/.bashrc
echo '' >> ~/.bashrc

# Install other tools with cs (this prompts user for multiple inputs)
cs setup

