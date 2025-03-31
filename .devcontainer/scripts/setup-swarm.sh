#!/bin/bash

set -e

KEYS_DIR="/root/elements/swarm/keys"
PUBLIC_IP_FILE="/root/elements/swarm/public-ip.json"
# LOGIN_SCRIPT="/root/elements/login.sh"
DOCKER_CONTEXT_PREFIX="swarm"
LOG_FILE="/root/elements/setup-swarm.log"
SSH_CONFIG_FILE="/root/.ssh/config"

echo "Starting the complete setup process..." | tee -a $LOG_FILE

if ! command -v jq &> /dev/null; then
    echo "jq not found, installing..." | tee -a $LOG_FILE
    apt-get update && apt-get install -y jq
fi

# It have changed
# if [ -f "$LOGIN_SCRIPT" ]; then
#     chmod +x "$LOGIN_SCRIPT"
# else
#     echo "Error: Login script ($LOGIN_SCRIPT) not found." | tee -a $LOG_FILE
#     exit 1
# fi

if [ ! -f "$PUBLIC_IP_FILE" ]; then
    echo "Error: Public IP file ($PUBLIC_IP_FILE) not found." | tee -a $LOG_FILE
    exit 1
fi

mkdir -p /root/.ssh
touch $SSH_CONFIG_FILE
chmod 600 $SSH_CONFIG_FILE

echo "Configuring SSH keys and Docker contexts for all Swarm clusters..." | tee -a $LOG_FILE

for vm_name in $(jq -r 'keys[]' "$PUBLIC_IP_FILE"); do
    ip_address=$(jq -r --arg vm_name "$vm_name" '.[$vm_name] | to_entries[0].value.ip_address' "$PUBLIC_IP_FILE")
    pem_file="$KEYS_DIR/$vm_name.pem"
    context_name="${DOCKER_CONTEXT_PREFIX}-${vm_name}"

    if [ ! -f "$pem_file" ]; then
        echo "Warning: PEM file ($pem_file) not found for VM $vm_name, skipping..." | tee -a $LOG_FILE
        continue
    fi

    chmod 600 "$pem_file"

    if ! ssh -i "$pem_file" -o IdentitiesOnly=yes -o StrictHostKeyChecking=no -o ConnectTimeout=5 azureuser@$ip_address "echo connected" &> /dev/null; then
        echo "Error: Unable to connect to $vm_name at $ip_address using SSH." | tee -a $LOG_FILE
        continue
    fi

    if docker context inspect "$context_name" &> /dev/null; then
        echo "Removing existing Docker context: $context_name" | tee -a $LOG_FILE
        docker context rm "$context_name" -f
    fi

    echo "Creating SSH config for $vm_name at $ip_address..." | tee -a $LOG_FILE
    cat <<EOF >> $SSH_CONFIG_FILE
Host $ip_address
    HostName $ip_address
    User azureuser
    IdentityFile $pem_file
    IdentitiesOnly yes
    StrictHostKeyChecking no
EOF

    echo "Creating Docker context for $vm_name at $ip_address..." | tee -a $LOG_FILE
    docker context create "$context_name" \
        --docker "host=ssh://azureuser@$ip_address" \
        --description "Swarm Manager $vm_name"

    echo "Docker context created: $context_name" | tee -a $LOG_FILE
done

unset DOCKER_HOST
echo "Docker contexts configured successfully!" | tee -a $LOG_FILE
docker context ls | tee -a $LOG_FILE

echo "Verifying Docker contexts..." | tee -a $LOG_FILE

for context in $(docker context ls --format "{{.Name}}" | grep "$DOCKER_CONTEXT_PREFIX-"); do
    echo "Switching to Docker context: $context" | tee -a $LOG_FILE
    docker context use "$context"
    if docker --context "$context" node ls &> /dev/null; then
        echo "Successfully connected to $context" | tee -a $LOG_FILE
        docker --context "$context" node ls | tee -a $LOG_FILE
    else
        echo "Error: Failed to connect to Docker context: $context" | tee -a $LOG_FILE
    fi
done

echo "Setup complete!" | tee -a $LOG_FILE
