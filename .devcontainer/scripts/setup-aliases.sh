#!/bin/bash

# sudo usermod -aG docker vscode

# Global Bashrc file for root
GLOBAL_BASHRC="/etc/bash.bashrc"


add_aliases() {
  local bashrc_file=$1

  # Docker Aliases
  echo "alias d='docker'" >> $bashrc_file
  echo "alias dps='docker ps'" >> $bashrc_file
  echo "alias dpsa='docker ps -a'" >> $bashrc_file
  echo "alias di='docker images'" >> $bashrc_file
  echo "alias drm='docker rm \$(docker ps -aq)'" >> $bashrc_file
  echo "alias drmi='docker rmi \$(docker images -q)'" >> $bashrc_file
  echo "alias dco='docker-compose'" >> $bashrc_file
  echo "alias dlog='docker logs -f'" >> $bashrc_file

  # Terraform Aliases
  echo "alias tf='terraform'" >> $bashrc_file
  echo "alias tfp='terraform plan'" >> $bashrc_file
  echo "alias tfa='terraform apply'" >> $bashrc_file
  echo "alias tfi='terraform init'" >> $bashrc_file
  echo "alias tfd='terraform destroy'" >> $bashrc_file
  echo "alias tfv='terraform validate'" >> $bashrc_file
  echo "alias tff='terraform fmt'" >> $bashrc_file
  echo "alias tfs='terraform show'" >> $bashrc_file
  echo "alias tfw='terraform workspace'" >> $bashrc_file
  echo "alias tfo='terraform output'" >> $bashrc_file

  echo "alias login-node='cd /workspaces/terraform-cert-lab/utils/  && ./login-node.sh'" >> $bashrc_file
}
add_aliases $GLOBAL_BASHRC


echo "Global Terraform aliases have been set up!"
