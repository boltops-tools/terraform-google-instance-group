variable ns {
  type        = string
  description = "Namespace prefix to name resources for uniqueness"
  default      = "demo-app"
}

variable network {
  description = "Name of the network to deploy instances to."
  default     = "default"
}

variable subnetwork {
  description = "The subnetwork to deploy to"
  default     = "default"
}
