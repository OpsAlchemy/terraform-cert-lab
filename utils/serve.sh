mkdir -p /workspaces/terraform-cert-lab/logs
nohup mkdocs serve > logs/output.log 2>&1 &