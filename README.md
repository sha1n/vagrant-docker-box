# vagrant-docker-box
This repo provides a basic setup for running a docker daemon on a hosted VM using vagrant + virtualbox.

## How To Setup
```
# install required tools
brew install vagrant
brew install --cask virtualbox
brew install docker

# start the vm
vagrant up

# export the daemon address (you may want to add it to your shell profile)
export DOCKER_HOST=tcp://192.168.50.2:2375
```

## Customizing the VM
Create a file named `.vm_config.json` in the `Vagrantfile` directory and edit to your preferences.

```json
{
  "cpus": 8,
  "memory": 10240,
  "disksize": "82GB",
  "ip": "192.168.10.101",
  "docker_port": 2375
}
```