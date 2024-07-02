resource "google_cloud_run_service" "cloud_run_service" {
  name     = "cloud-run-service"
  location = var.region

  template {
    spec {
      containers {
        image = "us-docker.pkg.dev/cloudrun/container/hello"
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}

# Allow public access
resource "google_cloud_run_service_iam_member" "cloud_run_service_iam_member" {
  service  = google_cloud_run_service.cloud_run_service.name
  location = var.region
  role     = "roles/run.invoker"
  member   = "allUsers"
}

# Output the URL
output "url" {
  value = google_cloud_run_service.cloud_run_service.status[0].url
}
