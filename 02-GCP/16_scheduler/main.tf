resource "google_pubsub_topic" "my_topic" {
  name = "my-topic"

  labels = {
    env = "dev"
  }
}

resource "google_pubsub_subscription" "my_subscription" {
  name  = "my-subscription"
  topic = google_pubsub_topic.my_topic.id

  labels = {
    env = "dev"
  }
}


resource "google_cloud_scheduler_job" "my_job" {
  name = "my-job"

  schedule  = "*/3 * * * *" // every 3 minutes 
  time_zone = "Australia/Sydney"

  pubsub_target {
    topic_name = google_pubsub_topic.my_topic.id
    data       = base64encode("Hello, World from TF!")
  }
}

output "topic_name" {
  value = google_pubsub_topic.my_topic.name
}
