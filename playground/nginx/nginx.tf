resource "docker_image" "nginx_image" {
  name = "nginx:latest"
}

resource "docker_container" "nginx_container" {
  name  = "nginx-server"
  image = docker_image.nginx_image.image_id

  ports {
    internal = 80
    external = 8080
  }

  must_run = true
}

output "container_id" {
  description = "The ID of the created NGINX container"
  value       = docker_container.nginx_container.id
}

output "container_logs" {
  description = "Logs from the NGINX container"
  value       = docker_container.nginx_container.logs
}

output "nginx_url" {
  description = "Access the NGINX server at this URL"
  value       = "http://localhost:8080"
}
