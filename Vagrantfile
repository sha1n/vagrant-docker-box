# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

#
# VM Configuration Constants
#
DOCKER_PORT     	= 2375
CONTAINER_NODE_PORT	= 3000
FW_NODE_PORT		= 3000
IP              	= "192.168.50.2"
MEMORY          	= "4096"
CPUS            	= 4


Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
	
	# Base on CoreOS VM, which includes docker 1.2.0
  	config.vm.box = "yungsang/coreos-alpha"

	# Sync host dir -> vm dir
	#config.vm.synced_folder ".", "/ws"

	# Forward Docker server port
	config.vm.network "forwarded_port", guest: 2375, host: DOCKER_PORT
	# Forward other ports
	#config.vm.network "forwarded_port", guest: CONTAINER_NODE_PORT, host: FW_NODE_PORT

	# Set an IP address to access the VM from your host
	# To connect to the docker daemon add the following line to your shell profile: 
	#
	# 	export DOCKER_HOST=tcp://<IP>:<DOCKER_PORT>
	#
	config.vm.network :private_network, ip: IP

	config.vm.provider :virtualbox do |vb|
		vb.name = "docker-host-vm"
		vb.cpus = CPUS
		vb.customize ['modifyvm', :id, '--memory', MEMORY]
		vb.customize ['modifyvm', :id, '--natdnshostresolver1', 'on']
		vb.customize ['modifyvm', :id, '--natdnsproxy1', 'on']
	end

end
