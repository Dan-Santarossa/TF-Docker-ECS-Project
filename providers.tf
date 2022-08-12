terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.10.17"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
}

provider "docker" {}

provider "aws" {
  region = "us-east-1"
}