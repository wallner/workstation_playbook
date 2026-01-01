#!/bin/env sh
sudo dnf install git
sudo dnf install ansible
ansible-galaxy collection install community.general -p collections
ansible-galaxy role install luizgavalda.gnome_extensions -p roles
ansible-playbook -K playbook.yml
