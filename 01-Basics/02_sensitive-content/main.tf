resource "local_sensitive_file" "sensitive_res" {
    content  = "This is a secret message!"
    filename = "sensitive.txt"
    file_permission = "0600"
}