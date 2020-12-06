#!/bin/sh
# Terragrunt init script
# ref: https://medium.com/@anton.babenko/atlantis-terragrunt-689b1aa2bf89
export TERRAGRUNT_TFPATH=/usr/local/bin/tf/versions/0.13.5/terraform

# terraform version should return single string, but terragrunt outputs a bit more
if [[ "$1" == "version" ]]; then
  echo "Terraform v0.13.5"
  exit 0
fi
