#!/bin/bash

function install_deps() {
    pip install mkdocs-awesome-pages-plugin
}

function main() {
    echo "Starting the main setup process..."

    echo "Adding vscode user to the Docker group..."
    sudo usermod -aG docker vscode

    echo "Making scripts executable..."
    chmod +x /workspaces/terraform-cert-lab/.devcontainer/scripts/setup-aliases.sh
    chmod +x /workspaces/terraform-cert-lab/.devcontainer/scripts/setup-swarm.sh

    echo "Running the alias setup script..."
    bash /workspaces/terraform-cert-lab/.devcontainer/scripts/setup-aliases.sh

    echo "Running the swarm setup script..."
    bash /workspaces/terraform-cert-lab/.devcontainer/scripts/setup-swarm.sh

    echo "Main setup process completed!"
}

install_deps
main
