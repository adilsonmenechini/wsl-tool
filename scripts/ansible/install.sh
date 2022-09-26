#!/bin/bash

set -euo pipefail

###################
#Install ansible #
if ! hash ansible >/dev/null 2>&1; then
    echo -e "\nEnter password for user $USER\n"
    sudo passwd

    echo -e "\nInstalling Ansible..."
    sudo apt-get update -qq
    sudo apt-get install software-properties-common ansible git python3-apt -y
else
    echo -e "\nAnsible already installed"
fi
ansible-galaxy collection install community.general
ansible-playbook $PWD/scripts/ansible/ansible-sre.yml --ask-become-pass

