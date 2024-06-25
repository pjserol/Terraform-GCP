resource "local_file" "file_res" {
  content = <<-EOF
    The name of the animal is: ${random_pet.pet_res.id}
    The type of the animal is: ${var.animal_type}
  EOF

  filename   = "animal.txt"
  depends_on = [random_pet.pet_res] /* explicit dependency */
}

resource "random_pet" "pet_res" {
  length = 3
}
