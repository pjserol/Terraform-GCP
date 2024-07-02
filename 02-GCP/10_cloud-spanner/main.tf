resource "google_spanner_instance" "instance_tf" {
  name         = "instance-tf"
  config       = "regional-us-central1"
  display_name = "Instance created by Terraform"
  num_nodes    = 1
  labels = {
    env = "dev"
  }
}

resource "google_spanner_database" "database_tf" {
  name     = "database-tf"
  instance = google_spanner_instance.instance_tf.name
  ddl = [
    "CREATE TABLE Singers (SingerId INT64, Name STRING(1024)) PRIMARY KEY (SingerId)"
  ]
  deletion_protection = false
}
