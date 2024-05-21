module "vpc" {
  source = "./modules/vpc"
  vpc_name= var.vpc_name
  vpc_cidr= var.vpc_cidr
}

module "compute" {
  source = "./modules/compute"
  nginx_machine_type = var.nginx_machine_type
  nginx_image = var.nginx_image
  github_machine_type = var.github_machine_type
  github_image = var.github_image
}

module "loadbalancer" {
  source = "./modules/loadbalancer"
   ngithub_backend_name = var.nginx_backend_name
   github_backend_name     = var.github_backend_name
   url_map_name            = var.url_map_name
   path_matcher_name       = var.path_matcher_name
   lb_proxy_name           = var.lb_proxy_name
   github_proxy_name       = var.github_proxy_name
   http_lb_name            = var.http_lb_name
   https_lb_name           = var.https_lb_name
   custom_https_lb_name    = var.custom_https_lb_name
   github_ssh_lb_name      = var.github_ssh_lb_name
}

module "firewall" {
  source = "./modules/firewall"
}