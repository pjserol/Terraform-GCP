resource "google_redis_instance" "tf_redis" {
  name               = "tf-redis"
  display_name       = "Terraform Redis Instance"
  tier               = "BASIC"
  memory_size_gb     = 1
  authorized_network = "default"
  redis_version      = "REDIS_7_0"
}

output "host" {
  value = google_redis_instance.tf_redis.host
}

output "port" {
  value = google_redis_instance.tf_redis.port
}
