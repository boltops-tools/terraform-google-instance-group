variable "ns" {
  type        = string
  description = "Namespace prefix to name resources for uniqueness"
  default      = "ns"
}

variable network {
  description = "Name of the network to deploy instances to."
  default     = "default"
}

variable subnetwork {
  description = "The subnetwork to deploy to"
  default     = "default"
}

variable metadata_startup_script {
  description = "Content of startup-script metadata passed to the instance template."
  default     = ""
}

variable access_config {
  description = "The access config block for th e instances. Set to [] to remove external IP."
  type        = list

  default = [
    {},
  ]
}

variable has_external_ip {
  type        = bool
  default     = true
}

variable metadata {
  description = "Map of metadata values to pass to instances."
  type        = map
  default     = {}
}

variable network_ip {
  description = "Set the network IP of the instance in the template. Useful for instance groups of size 1."
  default     = ""
}

variable machine_type {
  description = "Machine type for the VMs in the instance group."
  default     = "f1-micro"
}

variable source_image {
  description = "Image used for compute VMs."
  default     = "projects/debian-cloud/global/images/family/debian-9"
}

variable vm_tags {
  description = "Tag added to instances for firewall and networking."
  type        = list
  default     = []
}

variable service_account_email {
  description = "The email of the service account for the instance template."
  default     = "default"
}

variable service_account_scopes {
  description = "List of scopes for the instance template service account"
  type        = list

  default = [
    "https://www.googleapis.com/auth/compute",
    "https://www.googleapis.com/auth/logging.write",
    "https://www.googleapis.com/auth/monitoring.write",
    "https://www.googleapis.com/auth/devstorage.full_control",
  ]
}

variable disk_type {
  description = "The GCE disk type. Can be either pd-ssd, local-ssd, or pd-standard."
  default     = "pd-ssd"
}

variable disk_size_gb {
  description = "The size of the image in gigabytes. If not specified, it will inherit the size of its base image."
  default     = 0
}

variable preemptible {
  description = "Use preemptible instances - lower price but short-lived instances. See https://cloud.google.com/compute/docs/instances/preemptible for more details"
  default     = false
}

variable automatic_restart {
  description = "Automatically restart the instance if terminated by GCP - Set to false if using preemptible instances"
  default     = false
}

# google_compute_instance_group_manager
variable manager_name {
  description = "Instance group manager name. required. The name of the instance group manager. Must be 1-63 characters long and comply with RFC1035. Supported characters include lowercase letters, numbers, and hyphens"
  default     = "ig" # instance group
}

variable base_instance_name {
  description = "The base instance name to use for instances in this group"
  type        = string
  default     = null
}

variable target_size {
  description = "The target number of running instances for this managed instance group. This value should always be explicitly set unless this resource is attached to an autoscaler, in which case it should never be set."
  type        = number
  default     = 1
}

variable zone {
  description = "Zone for managed instance groups."
  default     = "us-central1-a"
}

# google_compute_firewall
variable http_health_check {
  description = "Enable or disable the http health check for auto healing."
  default     = true
}

variable service_port {
  description = "Port the service is listening on."
  default     = 80
}
