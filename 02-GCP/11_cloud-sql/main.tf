resource "google_sql_database_instance" "instance_mysql" {
  name             = "instance-mysql"
  database_version = "MYSQL_5_7"
  region           = "us-central1"

  settings {
    tier = "db-f1-micro"
  }

  deletion_protection = false
}

resource "google_sql_user" "user_mysql" {
  name     = "user-mysql"
  instance = google_sql_database_instance.instance_mysql.name
  password = "pwd123" # In prod use a secret management tool
}

resource "google_sql_database" "database_mysql" {
  name     = "database-mysql"
  instance = google_sql_database_instance.instance_mysql.name
}

output "host" {
  value = google_sql_database_instance.instance_mysql.ip_address
}

output "connection_name" {
  value = google_sql_database_instance.instance_mysql.connection_name
}

output "public_ip_address" {
  value = google_sql_database_instance.instance_mysql.public_ip_address
}



