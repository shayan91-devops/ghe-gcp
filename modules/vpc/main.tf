# Create a VPC
resource "google_compute_network" "vpc" {
  name                    = var.vpc_name
  auto_create_subnetworks = false
  routing_mode            = "GLOBAL"
}

# Create a subnet within the VPC
resource "google_compute_subnetwork" "subnet" {
  name          = var.subnet_name
  region        = var.region
  network       = google_compute_network.vpc.self_link
  ip_cidr_range = var.subnet_cidr
}

# Allow ICMP and SSH traffic to instances in the subnet
resource "google_compute_firewall" "allow-icmp-ssh" {
  name    = "allow-icmp-ssh"
  network = google_compute_network.vpc.self_link

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
}

# Allow HTTP and HTTPS traffic to instances in the subnet
resource "google_compute_firewall" "allow-http-https" {
  name    = "allow-http-https"
  network = google_compute_network.vpc.self_link

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  source_ranges = ["0.0.0.0/0"]
}

