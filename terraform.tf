terraform {
  required_version = ">= 1.6.0"
  required_providers {
    http = {
      source  = "hashicorp/http"
      version = ">= 3.4.1, < 4.0.0"
    }
  }
}
