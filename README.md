# Dev - setup tools for data engineering development environment
This repo contains random setup tools / scripts that I use to create and 
configure my development environment for data engineering.

## How to use
Pull the repo, then run the installer script. It will ask if you want to
install each software.

### Trouble shooting
* Make sure you run the installer script from inside the dev/ directory.
* Make sure the installer script is exexutable. You may need to run
`chmod +x installer.sh`
* Make sure the individual installers are exexutable (see method above)
The best way to use the contents of this repo is to download the required file
directly and treat these as one-off tools as they can be used in isolation.
Cloning the repo is only necessray for development of new tools and scripts.

## Tools
### neovim
Script which will install [Neovim](https://neovim.io) with custom configuration
and language conletion support for python and bash.


### Vagrant files
The vagrant-files/ directory and subdirectories contain vagrant files for 
deploying ubuntu-20.04 virtual mashines. There is an option with and without
a desktop GUI. To use vagrant see 
[https://www.vagrantup.com](https://www.vagrantup.com) for details. Once it's
installed, dowload the version of the Vagrantfile that you require, place it in
a dedicated directoy and run `vagrant up` to deploy.

*Note: The files will look for the private ssh key ~/.ssh/id_ed25519 on the 
host machine and copy it to the VM for ssh access to github. If change if your
private key has a different name / location or remove these lines (12 - 14) 
altogether if you like.*

## Tests
The contents in this directory have not been thoroughly tested - please inspect
before using and use at your own risk.

I have used the vagrant files to deploy VMs from a mac, using virtualbox. The
neovim installation has been used on Ubuntu 20.04 (set up via the vagrant 
files).
