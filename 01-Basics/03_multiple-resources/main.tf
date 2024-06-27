resource "local_file" "cat_res" {
  content  = "This is a cat!"
  filename = "cat.txt"
}

resource "local_file" "dog_res" {
  content  = "This is a dog!"
  filename = "dog.txt"
}
