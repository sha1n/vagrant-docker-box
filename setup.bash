#!/bin/bash


echo "Installing required applications..."

if [ `command -v vagrant| wc -l` != "1" ]; then
    echo "Downloading Vagrant 1.6.3..."
    curl -L https://dl.bintray.com/mitchellh/vagrant/vagrant_1.6.3.dmg > ~/Downloads/vagrant_1.6.3.dmg
    hdiutil mount ~/Downloads/vagrant_1.6.3.dmg
    sudo installer -pkg /Volumes/Vagrant/Vagrant.pkg -target /
else
    echo "Vagrant already installed - skipping"
fi

if [ `command -v virtualbox | wc -l` != "1" ]; then
    echo "Downloading virtualbox 4.3.14..."
    curl -L http://download.virtualbox.org/virtualbox/4.3.14/VirtualBox-4.3.14-95030-OSX.dmg > ~/Downloads/VirtualBox-4.3.14-95030-OSX.dmg
    hdiutil mount ~/Downloads/VirtualBox-4.3.14-95030-OSX.dmg
    sudo installer -pkg /Volumes/VirtualBox/VirtualBox.pkg -target /
else
    echo "Virtualbox already installed - skipping"
fi


echo ""
echo "Bringing up docker virtual machine..."
vagrant up

echo "To be able to connect to the docker daemon, add 'export DOCKER_HOST=tcp://192.168.50.2:2375' to your shell profile"

