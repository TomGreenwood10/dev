# Dev - setup tools for data engineering development environment
This repo contains random setup tools / scripts that I use to create and 
configure my development environment for data engineering.

## How to use
The best way to use the contents of this repo is to download the required file
directly and treat these as one-off tools as they can be used in isolation.
Cloning the repo is only necessray for development of new tools and scripts.

Download a file with:
```
curl -fLo ./<name-of-file> https://raw.githubusercontent.com/TomGreenwood10/dev/master/<repo-file-path>
```

## Tools
### neovim-install.sh
Script which will install [Neovim](https://neovim.io) with custom configuration
and language conletion support for python, bash and scala.

*Note: The python3 interpreter that is already on your system will be used but
the script will install scala, java, scala build tool (sbt), coursier and some
other dependancies*

*Note: The script requires user interaction so is not fully automated. This is 
as a result of the `cs setup` command which is coursier's scala environment
setup. It will ask the user to proceed or not on dependancy installations such
as java.*

To run the script:
```
./neovim-install.sh
```

The script utilises other files in the neovim-resources directory but **you do 
not need to download the neovim-resources directory** as the script will fetch
the files directly from github.

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
altogether if you like.

## Tests
The contents in this directory have not been thoroughly tested - please inspect
before using and use at your own risk.

I have used the vagrant files to deploy VMs from a mac, using virtualbox. The
neovim installation has been used on Ubuntu 20.04 (set up via the vagrant 
files).
