# Terraform Google Managed Instance Group Module

[![BoltOps Badge](https://img.boltops.com/boltops/badges/boltops-badge.png)](https://www.boltops.com)

Simple example with [google_compute_instance_group](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance_group)

## Add to Terrafile

```ruby
mod "instance_group", source: "boltops-tools/terraform-google-instance-group"
```

## Deploy

    terraspace up vm

## Clean Up

    terraspace down vm
