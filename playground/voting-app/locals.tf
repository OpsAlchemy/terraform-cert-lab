locals {
  environment = {
    "default" = "unix:///var/run/docker.sock"
    "swarm"   = "ssh://azureuser@20.117.175.20"
  }

  host = local.environment[var.context]
}
