terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.25.0"
    }
  }
}
provider "google" {
  credentials = file(var.GOOGLE_APPLICATION_CREDENTIALS)
  project     = var.GOOGLE_PROJECT
  region      = var.GOOGLE_REGION
}

variable "GOOGLE_APPLICATION_CREDENTIALS" {}
variable "GOOGLE_PROJECT" {}
variable "GOOGLE_REGION" {}