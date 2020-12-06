# Atlantis CI
GitOps for Terraform deployments. This project does not have out of the box support for `Terragrunt` and `SOPS` so we need to make modifications to the original image.

## The mission
We need CI/CD for `Terraform` and picked `Atlantis` as the automation system for it. The issue with this is that there is no SOPs support. In order to get `SOPS` running we are going to need `Terragrunt` as well. The approach the is to modify the existing Dockerfile to add the required bins.

* [Atlantis](https://github.com/runatlantis/atlantis/releases/tag/v0.15.1)
* Mozilla SOPS - https://github.com/mozilla/sops/releases/tag/v3.6.1
* Terragrunt - https://github.com/gruntwork-io/terragrunt/releases

## How to use
Some of the most common commands for running this system.

```sh
# This will run the container and set the env variable for
# the location of terraform that terragrunt uses
# we use this to trick atlantis into running terragrunt
# you can adjust your terraform version accordingly
➜ docker run -e terragrunt-tfpath=/usr/local/bin/tf/versions/0.13.5/terraform -it atlantis:v10 sh
```