resource "docker_network" "frontend" {
  name   = "frontend"
  driver = "overlay"
}

resource "docker_network" "backend" {
  name   = "backend"
  driver = "overlay"
}

