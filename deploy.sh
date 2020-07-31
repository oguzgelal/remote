#!/usr/bin/env bash

apt update

# receive PUB keys for docker
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 7EA0A9C3F273FCD8

# install python 3
apt install python3-apt python-apt-common -y

# install ansible
apt install software-properties-common -y
apt-add-repository --yes --update ppa:ansible/ansible
apt install ansible -y

# run ansible setup
ansible-playbook ansible/setup.yml --extra-vars "cwd=${PWD}"