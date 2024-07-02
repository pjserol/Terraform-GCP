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
  project     = var.project_id
  region      = "us-central1"
  zone        = "us-central1-a"
  credentials = file("/Users/pjserol/DEVTOOLS/gcp-keys/terraform-gcp-427512-78f56f090289.json")
}
