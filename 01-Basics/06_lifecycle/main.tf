resource "local_file" "file_res" {
  content  = "Some content in the file!"
  filename = "animal.txt"

  lifecycle {
    create_before_destroy = true
    # prevent_destroy       = true
    # ignore_changes = [content]
  }
}
