resource "google_artifact_registry_repository" "my_repo" {
  repository_id = "my-repository"
  description   = "My Docker repository"
  format        = "DOCKER"

  labels = {
    environment = "dev"
  }
}

data "google_iam_policy" "my_repo_policy" {
  binding {
    role = "roles/artifactregistry.reader"
    members = [
      "serviceAccount:service-account-1@terraform-gcp-427512.iam.gserviceaccount.com"
    ]
  }
}

resource "google_artifact_registry_repository_iam_policy" "my_repo_policy" {
  repository  = google_artifact_registry_repository.my_repo.repository_id
  policy_data = data.google_iam_policy.my_repo_policy.policy_data
}
