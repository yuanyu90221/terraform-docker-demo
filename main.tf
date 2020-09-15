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