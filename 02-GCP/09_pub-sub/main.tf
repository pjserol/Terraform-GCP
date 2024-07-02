resource "google_pubsub_schema" "my_schema" {
  name       = "my-schema"
  type       = "AVRO"
  definition = <<EOF
    {
      "type": "record",
      "name": "User",
      "fields": [
        {
          "name": "full_name",
          "type": "string"
        }
      ]
    }
    EOF
}

resource "google_pubsub_topic" "my_topic" {
  name = "my-topic"

  schema_settings {
    schema   = "projects/${var.project_id}/schemas/${google_pubsub_schema.my_schema.name}"
    encoding = "JSON"
  }
}

resource "google_pubsub_subscription" "my_subscription" {
  name  = "my-subscription"
  topic = google_pubsub_topic.my_topic.name
}
