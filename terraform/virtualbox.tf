provider "virtualbox" {}

resource "virtualbox_vm" "debian_vm" {
  name   = "debian-wordpress"
  image  = "https://cloud.debian.org/images/cloud/buster/latest/debian-10-genericcloud-amd64.vdi"

  cpus   = 1
  memory = "1024 mib"

  network_adapter {
    type   = "nat"
    device = "IntelPro1000MTDesktop"
  }

  storage_controller {
    name = "SATA Controller"
  }

  ssh_username = "debian"
  ssh_password = "debian"
}
