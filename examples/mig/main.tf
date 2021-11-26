module "mig" {
  source = "../.."
  ns     = var.ns

  network                 = var.network
  subnetwork              = var.subnetwork
  preemptible             = var.preemptible
  target_size             = var.target_size
  metadata_startup_script = file("${path.module}/script/startup_script.sh")
}
