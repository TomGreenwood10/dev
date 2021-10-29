Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/focal64"
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "4096"
  end

  # File transfers ------------------------------------------------------------

  # Certificate
  config.vm.provision "file", source: "./kainos-chain.pem", destination: "~/kainos-chain.pem"

  # nvim v 0.5 zipped file (installs with package managers give 0.4.x version 
  # at time of writing)
  config.vm.provision "file", source: "./nvim-linux64.tar.gz", destination: "~/nvim-linux64.tar.gz"

  # Github ssh (so don't need to add a newe key to github every time)
  config.vm.provision "shell", inline: "mkdir -p ~/.ssh"
  config.vm.provision "file", source: "~/.ssh/id_ed25519", destination: "~/.ssh/id_ed25519"
  
  # Software installation scripts
  config.vm.provision "file", source: "./misc-install.sh", destination: "~/misc-install.sh"
  config.vm.provision "file", source: "./nvim-install.sh", destination: "~/nvim-install.sh"
  config.vm.provision "file", source: "./certification-setup.sh", destination: "~/certification-setup.sh"


  # Scripts -------------------------------------------------------------------
  config.vm.provision "shell", inline: <<-SHELL
    echo "provisioning ..."

    # Updates
    apt-get update
    dpkg --configure -a
    apt-get upgrade -y

    apt-get install linux-headers-$(uname -r) build-essential dkms
    apt-get install -y virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11

    sudo reboot
 SHELL

end

