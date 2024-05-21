terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.25.0"
    }
  }
}
# provider "google" {
#   project     = var.project_id
#   region      = var.region
# }

# terraform {
#   backend "gcs" {
#     bucket  = "github-ent-tf-state"
#     prefix  = "terraform/state/stable"
#   }
# }



# terraform {
#   required_version = ">= 0.12"
#   required_providers {
#     google = {
#       source  = "hashicorp/google"
#       version = "~> 3.0"
#     }
#   }
# }
