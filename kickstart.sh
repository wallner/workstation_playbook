#!/bin/env sh
TARGET_USER=${1:-$(whoami)}

# Install dependencies
sudo dnf install -y git ansible

# Install collections and roles
ansible-galaxy collection install community.general -p collections
ansible-galaxy role install luizgavalda.gnome_extensions -p roles

# Run playbook. Only ask for sudo password if in an interactive terminal.
ANSIBLE_FLAGS="--tags upgrade"
if [ -t 0 ]; then
    ANSIBLE_FLAGS="$ANSIBLE_FLAGS -K"
fi

ansible-playbook $ANSIBLE_FLAGS playbook.yml -e "user=$TARGET_USER"
