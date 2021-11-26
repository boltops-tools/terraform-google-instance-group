# Terraform Google Managed Instance Group Module

[![BoltOps Badge](https://img.boltops.com/boltops/badges/boltops-badge.png)](https://www.boltops.com)

Simple example with [google_compute_instance_group](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance_group)

## Add to Terrafile

```ruby
mod "instance-group", source: "boltops-tools/terraform-google-instance-group"
```

## Import Example

    terraspace bundle example instance-group mig

## Deploy

    terraspace up mig

## Clean Up

    terraspace down mig
