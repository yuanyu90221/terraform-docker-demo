# terraform_docker_demo
## Introduction
[terraform official website](https://www.terraform.io/intro/index.html)
Terraform a infra as code framework for cross-cloud deployment

## Setup
[Download Page](https://www.terraform.io/downloads.html)
Download as binary file
## Basic structure

### 1 main.tf
Entry point for execution script

### 2 attributes
Provider
Resource
## Docker sample
```ocaml=
terraform {
  required_providers {
    docker = {
      source = "terraform-providers/docker"
    }
  }
}
provider "docker" {
  host = "tcp://192.168.99.100:2376"
}
resource "docker_image" "nginx" {
  name = "nginx:latest"
  keep_locally = true
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.latest
  name = "tutorial"
  ports {
    internal = 80
    external = 9911
  }
}
```
## execution
### init
```shell=
terraform init
```
### deploy
```shell=
terraform apply
```
### destroy
```shell=
terraform destroy
```
## terraform.tfstate
file to store the state of deploy
```json=
{
  "version": 4,
  "terraform_version": "0.13.2",
  "serial": 9,
  "lineage": "d1043271-611d-bd4e-e938-33ad3a3a5c88",
  "outputs": {},
  "resources": []
}
```