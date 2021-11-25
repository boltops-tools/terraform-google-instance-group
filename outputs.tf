output instance_template_id {
  value = google_compute_instance_template.this.id
}

output instance_group {
  value = google_compute_instance_group_manager.this.instance_group
}
