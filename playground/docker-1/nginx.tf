resource "docker_image" "alpine" {
  name = "alpine:latest"
}

resource "docker_container" "alpine_container" {
  name  = "funny-container"
  image = docker_image.alpine.image_id

  command = ["sh", "-c", "apk add fortune && fortune && sleep infinity"]

  must_run = true
}


output "container_id" {
  description = "The ID of the created container"
  value       = docker_container.alpine_container.id
}

output "container_logs" {
  description = "Logs from the container"
  value       = docker_container.alpine_container.logs
}