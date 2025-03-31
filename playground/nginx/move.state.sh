terraform state mv docker_image.nginx docker_image.nginx_image



# root ➜ /workspaces/terraform-cert-lab/playground/docker-1 (main) $ bash move.state.sh 
# Move "docker_image.nginx" to "docker_image.nginx_image"
# Successfully moved 1 object(s).
# root ➜ /workspaces/terraform-cert-lab/playground/docker-1 (main) $ terraform state list
# docker_container.nginx_container
# docker_image.nginx_image
# root ➜ /workspaces/terraform-cert-lab/playground/docker-1 (main) $ terraform apply -auto-approve
# docker_image.nginx_image: Refreshing state... [id=sha256:b52e0b094bc0e26c9eddc9e4ab7a64ce0033c3360d8b7ad4ff4132c4e03e8f7bnginx:latest]
# docker_container.nginx_container: Refreshing state... [id=4dd6394eb962eca46c0b2b5ce3a71e3fc6d858579e70922454d2f24fc3fddcf0]

# Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the
# following symbols:
# -/+ destroy and then create replacement

# Terraform will perform the following actions:

#   # docker_container.nginx_container must be replaced
# -/+ resource "docker_container" "nginx_container" {
#       + bridge                                      = (known after apply)
#       ~ command                                     = [
#           - "nginx",
#           - "-g",
#           - "daemon off;",
#         ] -> (known after apply)
#       + container_logs                              = (known after apply)
#       - cpu_shares                                  = 0 -> null
#       - dns                                         = [] -> null
#       - dns_opts                                    = [] -> null
#       - dns_search                                  = [] -> null
#       ~ entrypoint                                  = [
#           - "/docker-entrypoint.sh",
#         ] -> (known after apply)
#       ~ env                                         = [] -> (known after apply)
#       + exit_code                                   = (known after apply)
#       - group_add                                   = [] -> null
#       ~ hostname                                    = "4dd6394eb962" -> (known after apply)
#       ~ id                                          = "4dd6394eb962eca46c0b2b5ce3a71e3fc6d858579e70922454d2f24fc3fddcf0" -> (known after apply)
#       ~ init                                        = false -> (known after apply)
#       ~ ipc_mode                                    = "private" -> (known after apply)
#       ~ log_driver                                  = "json-file" -> (known after apply)
#       - log_opts                                    = {} -> null
#       - max_retry_count                             = 0 -> null
#       - memory                                      = 0 -> null
#       - memory_swap                                 = 0 -> null
#         name                                        = "nginx-server"
#       ~ network_data                                = [
#           - {
#               - gateway                   = "172.17.0.1"
#               - global_ipv6_prefix_length = 0
#               - ip_address                = "172.17.0.4"
#               - ip_prefix_length          = 16
#               - mac_address               = "da:1e:b2:55:ff:15"
#               - network_name              = "bridge"
#                 # (2 unchanged attributes hidden)
#             },
#         ] -> (known after apply)
#       - network_mode                                = "bridge" -> null # forces replacement
#       - privileged                                  = false -> null
#       - publish_all_ports                           = false -> null
#       ~ runtime                                     = "runc" -> (known after apply)
#       ~ security_opts                               = [] -> (known after apply)
#       ~ shm_size                                    = 64 -> (known after apply)
#       ~ stop_signal                                 = "SIGQUIT" -> (known after apply)
#       ~ stop_timeout                                = 0 -> (known after apply)
#       - storage_opts                                = {} -> null
#       - sysctls                                     = {} -> null
#       - tmpfs                                       = {} -> null
#         # (20 unchanged attributes hidden)

#       ~ healthcheck (known after apply)

#       ~ labels (known after apply)

#         # (1 unchanged block hidden)
#     }

# Plan: 1 to add, 0 to change, 1 to destroy.

# Changes to Outputs:
#   ~ container_id   = "4dd6394eb962eca46c0b2b5ce3a71e3fc6d858579e70922454d2f24fc3fddcf0" -> (known after apply)
# docker_container.nginx_container: Destroying... [id=4dd6394eb962eca46c0b2b5ce3a71e3fc6d858579e70922454d2f24fc3fddcf0]
# docker_container.nginx_container: Destruction complete after 1s
# docker_container.nginx_container: Creating...
# docker_container.nginx_container: Creation complete after 1s [id=4185287cf286420dd3e1016409016130d9eb917f2107b283b17226687b0b2dcb]

# Apply complete! Resources: 1 added, 0 changed, 1 destroyed.

# Outputs:

# container_id = "4185287cf286420dd3e1016409016130d9eb917f2107b283b17226687b0b2dcb"
# container_logs = false
# nginx_url = "http://localhost:8080"
# root ➜ /workspaces/terraform-cert-lab/playground/docker-1 (main) $ 