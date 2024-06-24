resource "random_integer" "rint" {
  min = 1
  max = 100
}

output "name1" {
  value = random_integer.rint.result
}

resource "random_string" "rstring" {
  length  = 8
  special = false
}

output "name2" {
  value = random_string.rstring.result
}
 
