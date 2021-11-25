resource "google_compute_instance_template" "this" {
  name_prefix  = "${var.ns}-"
  machine_type = var.machine_type
  tags         = var.vm_tags

  network_interface {
    network    = var.network
    subnetwork = var.subnetwork
    # The dynamic block conditionally creates the External IP address https://github.com/hashicorp/terraform/issues/21717
    dynamic "access_config" {
      for_each = var.has_external_ip ? [{}] : []
      content {}
    }
    network_ip    = var.network_ip
  }

  disk {
    source_image = var.source_image # TODO: set with var or latest image
    disk_type    = var.disk_type
    disk_size_gb = var.disk_size_gb
  }

  service_account {
    email  = var.service_account_email
    scopes = var.service_account_scopes
  }

  metadata_startup_script = var.metadata_startup_script

  scheduling {
    preemptible       = var.preemptible
    automatic_restart = var.automatic_restart
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "google_compute_instance_group_manager" "this" {
  name = "${var.ns}-${var.manager_name}"

  base_instance_name = var.base_instance_name != null ? var.base_instance_name : var.ns
  target_size        = var.target_size
  zone               = var.zone

  version {
    instance_template = google_compute_instance_template.this.id
  }


  update_policy {
    type                  = "PROACTIVE"
    minimal_action        = "REPLACE"
    max_surge_percent     = 20
    max_unavailable_fixed = 2
    min_ready_sec         = 50
  }
}
