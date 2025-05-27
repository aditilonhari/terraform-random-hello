variable "hellos" {
  type = object({
    hello        = string
    second_hello = string
  })
  description = "list of hellos"
  default = {
    hello = "aditi"
    second_hello = "test"
  }
}

variable "some_key" {
  type        = string
  description = "this is a some key"
  default = "this is a test key"
}

resource "random_pet" "server" {
  keepers = {
    hello      = var.hellos.hello
    secret_key = var.some_key
  }
}

resource "random_pet" "number_2" {
  keepers = {
    hello = var.hellos.second_hello
  }
}

output "pet" {
  value       = random_pet.server.id
  description = "first random pet ID"
}

output "list_of_pets" {
  value       = [random_pet.server.id, random_pet.number_2.id]
  description = "list of random pet IDs"
}

output "quoted_some_key" {
  value       = "\"${var.some_key}\""
  description = "escaped quoted value of some_key"
}