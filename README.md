# Demo Repos
This is a demo for how my stack works. Three different repos represent three different layers required to go to production at scale. The stack splits resources into the Infrastructure layer, dependencies into the ISO Layers, and scaling / deployment / ingress / certs into the Service layer.

[Senpai Stack](https://devops.miami/my-stack/)

## ISO Layer
This layer is responsible for maintain Dockerfiles for Helm charts. We split the ISO Layer from things like Infrastructor and Services so we can version our dependencies without being tied down by the other layers. `Docker` is the primary tool used for manipulating the `ISO Layer` and `Jenkins Pipelines` are normally used to automate the builds and push to cloud environment we are working on. This layer is only used for custom projects and image changes to meet requirements. Once you build and push you can change your `helm` chart to reference your private registry.

## Use
This layer can be used with `Docker` and `Docker-compose` usually. In this repo we are only keeping a copy of `Atlantis Project` so you won't see docker-compose examples. I typically use `docker-compose` when I am creating projects from scratch and I am the developer. I use volumes to allow myself to work in the containers and work on the files locally.

## Atlantis Project
We are using `Atlantis` to automate our `Terraform` deployments but are missing support for `Terragrunt` and `SOPS`. This project customizes the projects `Dockerfile` to download the required bins and set an alias for `Terragrunt/Terraform`.
