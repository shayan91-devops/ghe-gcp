
# output "github_autoscaler_name" {
#   value = google_compute_autoscaler.github_core_autoscaler.name
# }

output "nginx_instance_self_link" {
  value = google_compute_instance.nginx_core.self_link
}


output "github_instance_group" {
  value = google_compute_instance_group_manager.github_core.instance_group
}

