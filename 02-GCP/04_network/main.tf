resource "google_compute_network" "auto_vpc" {
  name                    = "auto-vpc"
  description             = "Auto VPC with default subnets in all regions."
  auto_create_subnetworks = true
}

resource "google_compute_network" "custom_vpc" {
  name                    = "custom-vpc"
  description             = "Custom VPC with no subnets."
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "sub_sg" {
  name                     = "sub-sg"
  network                  = google_compute_network.custom_vpc.id
  ip_cidr_range            = "10.1.0.0/24"
  region                   = "us-central1"
  private_ip_google_access = true
}

resource "google_compute_firewall" "allow_icmp" {
  name    = "allow-icmp"
  network = google_compute_network.custom_vpc.id

  allow {
    protocol = "icmp"
  }

  source_ranges = ["58.107.114.52/32"]
  priority      = 455
}

output "name_auto_vpc" {
  value = google_compute_network.auto_vpc.id
}

output "name_custom_vpc" {
  value = google_compute_network.custom_vpc.id
}
