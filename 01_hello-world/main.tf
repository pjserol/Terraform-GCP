resource "local_file" "hello_res" {
  content  = var.content
  filename = var.filename
}
