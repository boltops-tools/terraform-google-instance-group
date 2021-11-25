module "mig" {
  source = "../.."
  ns     = local.ns

  network                 = local.network
  subnetwork              = local.subnetwork
  metadata_startup_script = file("${path.module}/script/startup_script.sh")
  target_size             = 1
}
