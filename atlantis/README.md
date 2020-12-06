# Atlantis CI
GitOps for Terraform deployments. This project does not have out of the box support for `Terragrunt` and `SOPS` so we need to make modifications to the original image.

## The mission
We need CI/CD for `Terraform` and picked `Atlantis` as the automation system for it. The issue with this is that there is no SOPs support. In order to get `SOPS` running we are going to need `Terragrunt` as well. The approach the is to modify the existing Dockerfile to add the required bins.

* [Atlantis](https://github.com/runatlantis/atlantis/releases/tag/v0.15.1)
* Mozilla SOPS - https://github.com/mozilla/sops/releases/tag/v3.6.1
* Terragrunt - https://github.com/gruntwork-io/terragrunt/releases

## Before use
Adjust the terraform version to the version you use inside of the `terragrunt.sh` file. This will redirect `Terragrunt` to the correct version of `Terraform`. If you look at this script notice it also tricks `Atlantis` into thinking you haven't done anything weird by sending back an expect string for version.

## How to use
Some of the most common commands for running this system. If you are going to be using this build in `minikube` check the section below it first, if not ignore it. Just know this image is local and if you need to work with it else where you need to push it to the appropriate image registry. 

```sh
# Build the image - adjust the version accordinly
docker build -t atlantis:v1 .
# This will run the container and set the env variable for
# the location of terraform that terragrunt uses
# we use this to trick atlantis into running terragrunt
# you can adjust your terraform version accordingly
docker run -e terragrunt-tfpath=/usr/local/bin/tf/versions/0.13.5/terraform -it atlantis:v1 sh
```

## Minikube Notes
If you are running minikube you need to switch over to the minikube docker registry instead of your local one. To do this run the following command after the minikube start one.
```sh
eval $(minikube -p minikube docker-env)
docker images # you should see different images now than your local - rerun the build commands
docker build -t atlantis:v1 .
```
