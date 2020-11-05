resource "google_compute_instance" "db" {
  metadata {
    ssh-keys = "${var.user_ssh}:${file(var.public_key_path)}"
  }

  name         = "reddit-db"
  machine_type = "${var.machine_type}"
  zone         = "${var.zone}"
  tags         = ["reddit-db"]
  tags         = ["default-ssh-allow"]

  boot_disk {
    initialize_params {
      image = "${var.focal_image}"
    }
  }

  network_interface {
    network       = "default"
    access_config = {}
  }
}

resource "google_compute_firewall" "firewall_mongo" {
  name    = "allow-mongo-default"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["27017"]
  }

  source_tags = ["reddit-app"]
  target_tags = ["reddit-db"]
}
