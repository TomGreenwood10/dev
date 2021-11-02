#!/bin/bash

# Certificates for kainos man-in-the-middle ZScaler (applications like pycharm
# won't install without this). The .pem certificate must be downloaded from 
# https://kainossoftwareltd.sharepoint.com/:u:/r/systems/Shared%20Documents/Systems%20-%20Help/Voice%20and%20Networks/ZScaler/kainos-chain.pem?csf=1&web=1&e=ptJkbw
# and placed in the directory that vagrant up is run from. Also, the timezone 
# defaluts to UTC which is likely to be different from the host clock and this 
# will lead to certificates not being recognised - change to local timezone

echo Provisioning certificates ...

# Change timezone so that it will match laptop clock
timedatectl set-timezone Europe/London 

# Make crt and put it in certificates directory
mkdir /usr/local/share/ca-certificates/extra
openssl x509 -in kainos-chain.pem -inform PEM -out kainos-chain.crt
cp /home/vagrant/kainos-chain.crt /usr/local/share/ca-certificates/extra/kainos-chain.crt

# Update certificates and restart snapd
update-ca-certificates
systemctl restart snapd
