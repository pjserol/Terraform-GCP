resource "google_bigquery_dataset" "dataset_tf" {
  dataset_id    = "my_dataset"
  friendly_name = "My Dataset"
  description   = "This is my dataset"

}

resource "google_bigquery_table" "table_tf" {
  dataset_id = google_bigquery_dataset.dataset_tf.dataset_id
  table_id   = "my_table"

  # deletion_protection = false

  schema = <<EOF
[
  {
    "name": "full_name",
    "type": "STRING",
    "mode": "REQUIRED"
  },
  {
    "name": "age",
    "type": "INTEGER"
  },
  {
    "name": "city",
    "type": "STRING"
  }
]
EOF
}

/*
  INSERT INTO `terraform-gcp-427512.my_dataset.my_table` (full_name, age, city)
  VALUES
    ('Alice Johnson', 30, 'New York'),
    ('Bob Smith', 25, 'Los Angeles'),
    ('Charlie Brown', 35, 'Chicago');

  SELECT * FROM `terraform-gcp-427512.my_dataset.my_table`;
*/
