#!/usr/bin/env bash
TARGET_USER=${1:-$(whoami)}

# Install dependencies
sudo dnf install -y git ansible

# Install collections and roles from requirements file
ansible-galaxy install -r requirements.yml --roles-path roles
ansible-galaxy collection install -r requirements.yml --collections-path collections

# Run playbook. Only ask for sudo password if in an interactive terminal.
ANSIBLE_FLAGS="--tags all,upgrade"
if [ -t 0 ]; then
    ANSIBLE_FLAGS="$ANSIBLE_FLAGS -K"
fi

ansible-playbook $ANSIBLE_FLAGS playbook.yml -e "user=$TARGET_USER"

# Install pre-commit hooks
if command -v pre-commit &> /dev/null; then
    pre-commit install
fi
