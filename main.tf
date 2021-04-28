# Here is where we tell terraform which providers we want to use

terraform {
  required_providers {
    cloudflare = {
      source = "cloudflare/cloudflare"
      version = "~> 2.0"
    }
  }
}

provider "cloudflare" { 
  email   = var.cloudflare_email
  api_token = var.cloudflare_api_token
}

provider "random" {
  version = "~> 2.2"
}

# The version of terraform this works with.
terraform {
  required_version = ">= 0.12"
}
