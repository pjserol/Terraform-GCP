terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.35.0"
    }
  }
}

provider "google" {
  # Configuration options
  project = "terraform-gcp-427512"
  region  = "us-central1"
  zone    = "us-central1-a"
}

resource "google_storage_bucket" "gcs_bucket" {
  name     = "bucket-pj-terraform-shell"
  location = "US"
}
