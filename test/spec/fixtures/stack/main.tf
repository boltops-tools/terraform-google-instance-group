resource "random_pet" "this" {
  length = 2
}

module "ig" {
  source = "../../modules/instance_group"
  ns     = "ig-test-${random_pet.this.id}"
}
