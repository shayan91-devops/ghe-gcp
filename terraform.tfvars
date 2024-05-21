# GCP credentials
GOOGLE_APPLICATION_CREDENTIALS = "<path_to_your_service_account_key>.json"
GOOGLE_PROJECT                  = "<your_project_id>"
GOOGLE_REGION                   = "<your_region>"

# VPC variables
vpc_name = "my-vpc"
vpc_cidr = "172.31.0.0./16"
region = "us-central1"
project_id = "my-project"

#compute variables
nginx_machine_type = "n1-standard-1"
nginx_image = "ubuntu-os-cloud/ubuntu-2004-lts"
github_image = "n1-standard-1"
github_machine_type = "ubuntu-os-cloud/ubuntu-2004-lts"

# load balancer variables
nginx_backend_name           = "nginx-backend"
github_backend_name          = "github-backend"
url_map_name                 = "lb-url-map"
path_matcher_name            = "lb-path-matcher"
lb_proxy_name                = "lb-proxy"
github_proxy_name            = "github-proxy"
http_lb_name                 = "http-lb"
https_lb_name                = "https-lb"
custom_https_lb_name         = "custom-https-lb"
github_ssh_lb_name           = "github-ssh-lb"


