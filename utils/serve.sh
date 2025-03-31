mkdir -p /workspaces/terraform-cert-lab/logs
nohup mkdocs serve > /workspaces/terraform-cert-lab/logs/output.log 2>&1 &