
resource "google_storage_bucket" "func_bucket" {
  name     = "func_bucket"
  location = "US"
}

data "archive_file" "source" {
  type        = "zip"
  source_dir  = "code"
  output_path = "/tmp/function.zip"
}

resource "google_storage_bucket_object" "func_object" {
  name   = "func.${md5(data.archive_file.source.output_path)}.zip"
  bucket = google_storage_bucket.func_bucket.name
  source = data.archive_file.source.output_path

  depends_on = [data.archive_file.source]
}

# Golang cloud function
resource "google_cloudfunctions_function" "hello_go_function" {
  name        = "hello-go-function"
  description = "Hello Golang function"
  runtime     = "go120"

  available_memory_mb = 128
  timeout             = 60

  source_archive_bucket = google_storage_bucket.func_bucket.name
  source_archive_object = google_storage_bucket_object.func_object.name

  entry_point  = "HelloGo"
  trigger_http = true

  environment_variables = {
    PROJECT_ID   = var.project_id
    LOGGING_NAME = "hello-go-function"
  }

  lifecycle {

  }
}

# Allow access
resource "google_cloudfunctions_function_iam_member" "hello_go_function" {
  region         = var.region
  cloud_function = google_cloudfunctions_function.hello_go_function.name
  role           = "roles/cloudfunctions.invoker"
  member         = "allUsers"
}

output "function_url" {
  value = google_cloudfunctions_function.hello_go_function.https_trigger_url
}
