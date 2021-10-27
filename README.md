# vagrant-docker-box
This repo provides a basic setup for running a docker daemon on a hosted VM using vagrant + virtualbox.

**:warning: &nbsp; Doesn't work out of the box on macOS Big Sur with VBox v6.1.28. Symptoms are similar to the ones reported in this _rejected_ [bug report](https://www.virtualbox.org/ticket/20626)), so some adjustments are required obviously&nbsp;:warning:**


## How To Setup on macOS
Tested on an intel-based macbook pro running `macOS Big Sur 11.6` and `VirtualBox 6.1.26 r145957 (Qt5.6.3)`
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
