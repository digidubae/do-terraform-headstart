terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }

  cloud {
    organization = "alkait"

    workspaces {
      name = "example-workspace"
    }
  }
}
