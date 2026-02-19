provider "google" {
  credentials = file("credentials.json")
  project     = var.project_id
  region      = var.region
  zone        = var.zone
}

resource "google_compute_network" "vpc_network" {
  name = "custom-vpc"
}

resource "google_compute_instance" "vm_instance" {
  name         = "vm-e2-micro"
  machine_type = "e2-micro"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    network = google_compute_network.vpc_network.name
    access_config {}
  }

  tags = ["http-server"]
}
