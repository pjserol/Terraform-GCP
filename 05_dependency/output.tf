output "name_pet" {
  value = random_pet.pet_res.id
}

output "type_pet" {
  value = var.animal_type
}
