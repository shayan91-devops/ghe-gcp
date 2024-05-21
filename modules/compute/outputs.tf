output "nginx_autoscaler_name" {
  value = google_compute_instance_group_manager.nginx_core_autoscaler.name
}
