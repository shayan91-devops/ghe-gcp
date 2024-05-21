locals {
  ssh_key = file("~/.ssh/id_ed25519.pub")
}

# Nginx instance creation
resource "google_compute_instance" "nginx_core" {
  name         = "nginx-core"
  machine_type = var.nginx_machine_type
  zone         = var.nginx_zone

  boot_disk {
    initialize_params {
      image = var.nginx_image
      size = 50 # size of boot disk
    }
  }

  network_interface {
    network = module.vpc.vpc_self_link
  }

  tags = ["nginx"]

   # Add SSH key to instance metadata without username
  metadata = {
    "ssh-keys" = local.ssh_key
  }

}

# Github instance creation
resource "google_compute_instance" "github_core" {
  name         = "github-core"
  machine_type = var.github_machine_type
  zone         = var.github_zone

  boot_disk {
    initialize_params {
      image = var.github_image
      size = 500 # size of boot disk
    }
  }

  network_interface {
    network = module.vpc.vpc_self_link
  }

  tags = ["github"]

  # Additional external disk
  attached_disk {
    source      = google_compute_disk.github_core_external_disk.id
    device_name = "external-disk"
  }

  # Add SSH key to instance metadata without username
  metadata = {
    "ssh-keys" = local.ssh_key
  }

}

# Create the external disk for github_core
resource "google_compute_disk" "github_core_external_disk" {
  name  = "github-core-external-disk"
  type  = "pd-standard" # standard type for the external disk
  zone  = var.github_zone
  size  = 1536 # size in GB for 1.5TB
}

# Create Instance Template for github_core
resource "google_compute_instance_template" "github_core_template" {
  name         = "github-core-template"
  machine_type = var.github_machine_type

  disk {
    auto_delete = true
    boot        = true
    source = var.github_image
    disk_size_gb = 500
  }

disk {
    auto_delete = false
    source      = google_compute_disk.github_core_external_disk.id
  }
  network_interface {
    network = module.vpc.vpc_self_link
  }

  tags = ["github"]

  # Add SSH key to instance metadata without username
  metadata = {
    "ssh-keys" = local.ssh_key
  }

}

# Instance Group Manager
resource "google_compute_instance_group_manager" "github_core" {
  name                = "github-core-manager"
  base_instance_name  = "github-core"
  zone                = var.github_zone
  target_size         = 1
  version {
    instance_template = google_compute_instance_template.github_core_template.self_link
  }
}

# Autoscaler for the Github Core Instance Group
resource "google_compute_autoscaler" "github_core_autoscaler" {
  name   = "github-core-autoscaler"
  zone   = var.github_zone
  target = google_compute_instance_group_manager.github_core.self_link

  autoscaling_policy {
    min_replicas = 1
    max_replicas = 3

    cpu_utilization {
      target = 0.6
    }
  }
}

