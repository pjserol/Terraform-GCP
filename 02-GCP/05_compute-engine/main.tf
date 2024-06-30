resource "google_compute_instance" "vm_instance" {
  name         = "vm-instance"
  machine_type = "f1-micro"
  zone         = "us-central1-a"

  allow_stopping_for_update = true

  network_interface {
    network    = "custom-vpc"
    subnetwork = "sub-sg"
    access_config {
      // Ephemeral IP
    }
  }

  boot_disk {
    initialize_params {
      image = "debian-10-buster-v20240611"
      size  = 10
    }

    auto_delete = true
  }

  labels = {
    "env" = "test"
  }

  # scheduling {
  #   preemptible       = true
  #   automatic_restart = false
  # }

  service_account {
    email  = "service-account-1@terraform-gcp-427512.iam.gserviceaccount.com"
    scopes = ["cloud-platform"]
  }

  lifecycle {
    ignore_changes = [attached_disk]
  }
}

# Allow ssh
resource "google_compute_firewall" "allow_ssh" {
  name    = "allow-ssh"
  network = "custom-vpc"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"] # Allow SSH from anywhere. For security, restrict to specific IP ranges if possible.
  priority      = 1000
}

resource "google_compute_disk" "disk1" {
  name = "disk-1"
  type = "pd-standard"
  zone = "us-central1-a"
  size = 10
}

resource "google_compute_attached_disk" "disk_attach" {
  disk     = google_compute_disk.disk1.id
  instance = google_compute_instance.vm_instance.id
}
