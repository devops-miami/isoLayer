# ISO Layer
This layer is responisble for maintain Dockerfiles for Helm charts. We split the ISO Layer from things like Infrastruction and Services so we can version or dependencies without being tied down by other things. `Docker` is the primary tool used for manipulating this layer and `Jenkins Pipelines` are normally used to automate the builds and push to cloud enviroment we are working on. This layer is only used for custom projects and image changes so we can meet requirements. Once you build and push you can change your `helm` chart to reference your private registry.

## Atlantis ISO
We are using `Atlantis` to automate our `Terraform` deployments but are missing support for `Terragrunt` and `SOPS`. The `Dockerfile` will now download the required bins as well as set an alias for `Terragrunt/Terraform`.
