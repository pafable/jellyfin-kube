terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "3.0.1"
    }
  }

  required_version = ">= 1.14.4"
}

provider "kubernetes" {
  config_path    = var.config_path
  config_context = var.config_context
}