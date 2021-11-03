Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/focal64"
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "4096"
  end

  # File transfers ------------------------------------------------------------

  # Certificate
  config.vm.provision "file", source: "./kainos-chain.pem", destination: "~/kainos-chain.pem"

  # Github ssh (so don't need to add a newe key to github every time)
  config.vm.provision "shell", inline: "mkdir -p ~/.ssh"
  config.vm.provision "file", source: "~/.ssh/id_ed25519", destination: "~/.ssh/id_ed25519"
  
  # Clone setup repo (decided to use script once in the VM to complete setup
  # and install software as it gives more control
  git clone git@github.com:TomGreenwood10/dev.git

  # Updates
  config.vm.provision "shell", inline: "apt-get update"
  config.vm.provision "shell", inline: "dpkg --configure -a"
  config.vm.provision "shell", inline: "apt-get upgrade -y"

  # Utils install (will always want these straigt away)
  config.vm.provision "shell", inline: "apt-get install -y linux-headers-$(uname -r)"
  config.vm.provision "shell", inline: "apt-get install -y build-essential"
  config.vm.provision "shell", inline: "apt-get install -y dkms"
  config.vm.provision "shell", inline: "apt-get install -y virtualbox-guest-dkms"
  config.vm.provision "shell", inline: "apt-get install -y virtualbox-guest-utils"
  config.vm.provision "shell", inline: "apt-get install -y virtualbox-guest-x11"

  config.vm.provision "shell", inline: "sudo reboot"

end

