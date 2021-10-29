Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/focal64"
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "4096"
  end
  config.vm.provision "file", source: "./kainos-chain.pem", destination: "~/kainos-chain.pem"
  config.vm.provision "file", source: "./nvim-linux64.tar.gz", destination: "~/nvim-linux64.tar.gz"
  config.vm.provision "shell", inline: "mkdir -p ~/.ssh"
  config.vm.provision "file", source: "~/.ssh/id_ed25519", destination: "~/.ssh/id_ed25519"
  config.vm.provision "file", source: "./nvim-install.sh", destination: "~/nvim-install.sh"
  config.vm.provision "shell", inline: "chmod 777 nvim-install.sh"
  config.vm.provision "shell", path: "certification-setup.sh"
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

