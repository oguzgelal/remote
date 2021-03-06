#!/usr/bin/env bash

apt update

# install python 3
apt install python3-apt python-apt-common -y

# install ansible
apt install software-properties-common -y
apt-add-repository --yes --update ppa:ansible/ansible
apt install ansible -y

# run ansible setup
ansible-playbook setup.yml --extra-vars "cwd=${PWD}"
