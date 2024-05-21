# Define Backend Services
resource "google_compute_backend_service" "nginx_backend" {
  name             = var.nginx_backend_name
  protocol         = "HTTP"
  timeout_sec      = 30
  port_name        = "http"
  backend {
    group = google_compute_instance_group_manager.nginx_core_autoscaler.instance_group
  }
}

resource "google_compute_backend_service" "github_backend" {
  name             = var.github_backend_name
  protocol         = "TCP"
  timeout_sec      = 30
  port_name        = "ssh"
  backend {
    group = google_compute_instance_group_manager.github_core.instance_group
  }
}

# Define URL Map and Path Matchers
resource "google_compute_url_map" "lb_map" {
  name            = var.url_map_name
  default_service = google_compute_backend_service.nginx_backend.self_link

  host_rule {
    hosts        = ["*"]
    path_matcher = google_compute_path_matcher.default_path_matcher.name
  }
}

resource "google_compute_path_matcher" "default_path_matcher" {
  name            = var.path_matcher_name
  default_service = google_compute_backend_service.nginx_backend.self_link

  path_rule {
    paths   = ["/*"]
    service = google_compute_backend_service.nginx_backend.self_link
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
