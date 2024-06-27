resource "google_storage_bucket" "gcs_bucket" {
  name          = "bucket-pj-terraform-serv-acc"
  location      = "US"
  storage_class = "STANDARD"
  force_destroy = true

  labels = {
    environment = "dev"
    team        = "devops"
  }

  uniform_bucket_level_access = true

  lifecycle_rule {
    condition {
      age = 30
    }

    # action {
    #   type = "Delete"
    # }

    action {
      type          = "SetStorageClass"
      storage_class = "COLDLINE"
    }
  }

  #   retention_policy {
  #     retention_period = 1209600 # 14 days
  #     is_locked        = true
  #   }
}

resource "google_storage_bucket_object" "gcs_object" {
  name    = "hello-world.txt"
  bucket  = google_storage_bucket.gcs_bucket.name
  content = "Hello, World!"

  metadata = {
    team = "devops"
  }
}

resource "google_storage_bucket_iam_member" "object_viewer_service_account" {
  bucket = google_storage_bucket.gcs_bucket.name
  role   = "roles/storage.objectViewer"
  member = "serviceAccount:service-account-1@terraform-gcp-427512.iam.gserviceaccount.com"
}

# resource "google_storage_bucket_iam_member" "object_viewer" {
#   bucket = google_storage_bucket.gcs_bucket.name
#   role   = "roles/storage.objectViewer"
#   member = "allUsers"
# }
