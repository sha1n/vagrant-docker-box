# -*- mode: ruby -*-
# vi: set ft=ruby :


VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  	config.vm.box = "box-cutter/ubuntu1404-docker"

	# Update docker to version 1.1.1
	config.vm.provision :shell, :inline => "apt-get update -qq; apt-get install -y -o Dpkg::Options::='--force-confdef' -o Dpkg::Options::='--force-confold' lxc-docker-1.1.1"

	# Expose docker TCP port 2375 on all interfaces
	config.vm.provision :shell, :inline => "echo 'export DOCKER_OPTS=\"-H unix:///var/run/docker.sock -H tcp://0.0.0.0:2375\"' >> /etc/default/docker"
	config.vm.provision :shell, :inline => "sudo reboot"
	config.vm.synced_folder ".", "/app", create: true

	config.ssh.forward_agent = true
	config.vm.network "forwarded_port", guest: 2375, host: 2375

	config.vm.provider :virtualbox do |vb|
		vb.customize ['modifyvm', :id, '--memory', ENV['VM_MEMORY'] || 1024]
		vb.customize ['modifyvm', :id, '--natdnshostresolver1', 'on']
		vb.customize ['modifyvm', :id, '--natdnsproxy1', 'on']
	end

end
