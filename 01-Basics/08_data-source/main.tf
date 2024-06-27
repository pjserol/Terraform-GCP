data "local_file" "example" {
  filename = "sample.txt"
}

output "name" {
  value = data.local_file.example.content
}
