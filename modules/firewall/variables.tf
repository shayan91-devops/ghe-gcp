variable "network" {
  description = "The name of the network to apply the firewall rule to."
  default     = "default"
}

variable "vpc_self_link" {
  type = string
}