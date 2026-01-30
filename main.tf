terraform {
  backend remote {
    hostname     = "app.terraform.io"
    organization = "secret_mission"
    workspaces {
      name = "Terra-Nova"
    }
  }

  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

# Simple example: random pet name (e.g. "happy-marlin")
resource "random_pet" "server" {
  length = 2
}

# Write it to a file so you can see the result
resource "local_file" "greeting" {
  filename = "${path.module}/hello.txt"
  content  = "Terraform says hello from ${random_pet.server.id}!"
}
