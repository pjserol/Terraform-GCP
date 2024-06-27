resource "google_service_account" "my_service_account" {
  account_id   = "terraform-serv-acc"
  display_name = "Terraform Service Account"
}

resource "google_service_account_key" "my_service_account_key" {
  service_account_id = google_service_account.my_service_account.name
}

resource "google_project_iam_member" "service_account_project_role" {
  project = var.project_id
  role    = "roles/editor"
  member  = "serviceAccount:${google_service_account.my_service_account.email}"
}

output "service_account_email" {
  value = google_service_account.my_service_account.email
}

resource "google_storage_bucket" "gcs_bucket" {
  name          = "bucket-test-terraform-serv-acc"
  location      = "US"
  storage_class = "STANDARD"
}

resource "google_storage_bucket_object" "gcs_object" {
  name    = "hello-world.txt"
  bucket  = google_storage_bucket.gcs_bucket.name
  content = "Hello, World!"
}

resource "google_storage_bucket_iam_member" "object_viewer_service_account" {
  bucket = google_storage_bucket.gcs_bucket.name
  role   = "roles/storage.objectViewer"
  member = "serviceAccount:${google_service_account.my_service_account.email}"
}


