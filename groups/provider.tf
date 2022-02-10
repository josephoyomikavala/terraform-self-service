terraform {
  cloud {
    organization = "Kevala"
    workspaces {
      name = "group-self-service"
    }
  }

  required_providers {
    google = {
      version = "~> 4.8.0"
      source  = "hashicorp/google"
    }

  }
}

provider "google" {

}

