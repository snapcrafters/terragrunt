# terragrunt.hcl

generate "main" {
  path      = "main.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.4"
    }
  }
}

variable "message" {
  type    = string
  default = "Hello! Terragrunt successfully invoked Terraform."
}

resource "local_file" "test_output" {
  content  = var.message
  filename = "$${path.module}/success.txt"
}
EOF
}

inputs = {
  message = "Hello from your Spread test! Terragrunt and Terraform are communicating perfectly."
}
