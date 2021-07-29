terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "3.5.0"
    }
  }
}

provider "google" {
  credentials = file("key.json")

  project = "vast-dock-318508"
  region  = "europe-north1"
  zone    = "europe-north1-a"
}

resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}

resource "google_compute_instance" "vm_instance" {
  name         = "moodle"
  machine_type = "e2-small"
  
  tags = ["http-server", "https-server"]
  
   metadata = {
   ssh-keys = "sergiy:${file("public.key")}"
 }
  boot_disk {
    initialize_params {
      image = "ubuntu-2004-focal-v20210720"
    }
  }
  metadata_startup_script = file("apache2.sh")

  
  network_interface {
    network = google_compute_network.vpc_network.name
    access_config {
    }
  }
}


