osx-vagrant-docker
==================

This repo provides a basic setup for running a docker server on Mac OS X using vagrant+virtualbox.

Setup
=====
To set up the environment run 'setup.bash' from a bash shell. The script will install Vagrant and Oracle VirtualBox on your Mac if they are not already installed.
After installation, it will bring up the vm with docker running in it.
To work with docker do the following:

1. Install docker client (brew install docker)
2. Add 'export DOCKER_HOST=tcp://192.168.50.2:2375' to your shell profile
