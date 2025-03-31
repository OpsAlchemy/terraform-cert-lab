#!/bin/bash
sudo usermode -aG docker vscode

# Docker Aliases
echo "alias d='docker'" >> /home/vscode/.bashrc
echo "alias dps='docker ps'" >> /home/vscode/.bashrc
echo "alias dpsa='docker ps -a'" >> /home/vscode/.bashrc
echo "alias di='docker images'" >> /home/vscode/.bashrc
echo "alias drm='docker rm \$(docker ps -aq)'" >> /home/vscode/.bashrc
echo "alias drmi='docker rmi \$(docker images -q)'" >> /home/vscode/.bashrc
echo "alias dco='docker-compose'" >> /home/vscode/.bashrc
echo "alias dlog='docker logs -f'" >> /home/vscode/.bashrc

# Terraform Aliases
echo "alias tf='terraform'" >> /home/vscode/.bashrc
echo "alias tfp='terraform plan'" >> /home/vscode/.bashrc
echo "alias tfa='terraform apply'" >> /home/vscode/.bashrc
echo "alias tfi='terraform init'" >> /home/vscode/.bashrc
echo "alias tfd='terraform destroy'" >> /home/vscode/.bashrc
echo "alias tfv='terraform validate'" >> /home/vscode/.bashrc
echo "alias tff='terraform fmt'" >> /home/vscode/.bashrc
echo "alias tfs='terraform show'" >> /home/vscode/.bashrc
echo "alias tfw='terraform workspace'" >> /home/vscode/.bashrc
echo "alias tfo='terraform output'" >> /home/vscode/.bashrc

source /home/vscode/.bashrc

echo "Docker and Terraform aliases have been set up!"
