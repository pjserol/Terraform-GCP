# Big Table
resource "google_bigtable_instance" "bigtable_instance" {
  name         = "bigtable-instance"
  display_name = "Bigtable Instance"
  cluster {
    cluster_id   = "bigtable-cluster"
    num_nodes    = 1
    storage_type = "SSD"
  }

  deletion_protection = false

  labels = {
    env = "dev"
  }
}

resource "google_bigtable_table" "bt_table" {
  instance_name = google_bigtable_instance.bigtable_instance.name
  name          = "bt-table"

  column_family {
    family = "personal_info"
  }

  column_family {
    family = "employment_info"
  }
}




