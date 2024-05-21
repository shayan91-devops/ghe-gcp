# Define Backend Services
resource "google_compute_backend_service" "nginx_backend" {
  name             = var.nginx_backend_name
  protocol         = "HTTP"
  timeout_sec      = 30
  port_name        = "http"
  backend {
    group = module.compute.nginx_instance_self_link

  }
}

module "vpc" {
  source = "../vpc"
}

module "compute" {
  source = "../compute"
  vpc_self_link = var.vpc_self_link
}

resource "google_compute_backend_service" "github_backend" {
  name             = var.github_backend_name
  protocol         = "TCP"
  timeout_sec      = 30
  port_name        = "ssh"
  backend {
    group = module.compute.github_instance_group
  }
}

# Define URL Map with Path Matchers
resource "google_compute_url_map" "lb_map" {
  name            = var.url_map_name
  default_service = google_compute_backend_service.nginx_backend.self_link

  host_rule {
    hosts        = ["*"]
    path_matcher = "default"
  }

  path_matcher {
    name            = "default"
    default_service = google_compute_backend_service.nginx_backend.self_link

    path_rule {
      paths   = ["/*"]
      service = google_compute_backend_service.nginx_backend.self_link
    }
  }
}

# Define Target HTTP Proxy
resource "google_compute_target_http_proxy" "lb_proxy" {
  name    = var.lb_proxy_name
  url_map = google_compute_url_map.lb_map.self_link
}

# Define Target TCP Proxy for GitHub
resource "google_compute_target_tcp_proxy" "github_proxy" {
  name            = var.github_proxy_name
  backend_service = google_compute_backend_service.github_backend.self_link
}

# Define Global Forwarding Rules
resource "google_compute_global_forwarding_rule" "http_lb" {
  name       = var.http_lb_name
  target     = google_compute_target_http_proxy.lb_proxy.self_link
  port_range = "80"
}

resource "google_compute_global_forwarding_rule" "https_lb" {
  name       = var.https_lb_name
  target     = google_compute_target_http_proxy.lb_proxy.self_link
  port_range = "443"
}

resource "google_compute_global_forwarding_rule" "custom_https_lb" {
  name       = var.custom_https_lb_name
  target     = google_compute_target_http_proxy.lb_proxy.self_link
  port_range = "8443"
}

resource "google_compute_global_forwarding_rule" "github_ssh_lb" {
  name       = var.github_ssh_lb_name
  target     = google_compute_target_tcp_proxy.github_proxy.self_link
  port_range = "22,122"
}
