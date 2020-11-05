resource "google_compute_firewall" "firewall_ssh" {
  name        = "default-allow-ssh"
  description = "Allow SSH from anywhere"
  network     = "default"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = "${var.source_ranges}"
  priority      = "65534"
  target_tags   = ["default-ssh-allow"]
}
