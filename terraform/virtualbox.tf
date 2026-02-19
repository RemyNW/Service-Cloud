provider "virtualbox" {}

resource "virtualbox_image" "debian" {
  name   = "debian-11"
  url    = "https://app.vagrantup.com/debian/boxes/bullseye64/versions/11.6.0/providers/virtualbox.box"
  sha256 = "c0276a9d49c5b667d2de9e72d24389c71fd6a7f4189b7a517e3bb5b7f9933e01"
}

resource "virtualbox_vm" "debian_vm" {
  name   = "vm-debian-ansible"
  image  = virtualbox_image.debian.id
  cpus   = 1
  memory = 1024

  network_adapter {
    type           = "hostonly"
    host_interface = "vboxnet0" 
  }

  ssh_username = "vagrant"
  ssh_password = "vagrant"
}
