Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/focal64"
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "4096"
  end
  config.vm.provision "file", source: "./kainos-chain.pem", destination: "~/kainos-chain.pem"
  config.vm.provision "shell", inline: "mkdir -p ~/.ssh"
  config.vm.provision "file", source: "~/.ssh/id_ed25519", destination: "~/.ssh/id_ed25519"
  config.vm.provision "file", source: "./nvim-install.sh", destination: "~/nvim-install.sh"
  config.vm.provision "shell", inline: "chmod 777 nvim-install.sh"
  config.vm.provision "shell", inline: <<-SHELL
    echo "provisioning ..."

    # Updates
    apt-get update
    dpkg --configure -a
    apt-get upgrade -y

    # Certificates for kainos man-in-the-middle ZScaler (applications like pycharm won't install without this). The .pem
    # certificate must be downloaded from https://kainossoftwareltd.sharepoint.com/:u:/r/systems/Shared%20Documents/Systems%20-%20Help/Voice%20and%20Networks/ZScaler/kainos-chain.pem?csf=1&web=1&e=ptJkbw
    # and placed in the directory that vagrant up is run from. Also, the timezone defaluts to UTC which is likely to be
    # different from the host clock and this will lead to certificates not being recognised - change to local timezone
    timedatectl set-timezone Europe/London
    mkdir /usr/local/share/ca-certificates/extra
    openssl x509 -in kainos-chain.pem -inform PEM -out kainos-chain.crt
    cp /home/vagrant/kainos-chain.crt /usr/local/share/ca-certificates/extra/kainos-chain.crt
    update-ca-certificates
    systemctl restart snapd

    apt-get install linux-headers-$(uname -r) build-essential dkms
    apt-get install -y virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11

    # Software / apps install
    # Change to vagrant user so installed apps will work with this sign in (note: sudo's are now needed)
    su vagrant

    # tree
    echo "\n\n\ninstalling tree ..."
    sudo apt-get install tree

    # python
    sudo echo "\n\n\ninstalling python ..."
    sudo apt-get install -y python3.9
    sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.9 1
    sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.9 1
    echo "\n\n\ninstalling python-dev ..."
    sudo apt-get install -y python3.9-dev

    sudo shutdown
 SHELL

end

