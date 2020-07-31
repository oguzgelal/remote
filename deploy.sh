#!/usr/bin/env bash

apt update

# install python 3
apt install python3-apt python-apt-common -y

# install ansible
apt install software-properties-common -y
apt-add-repository --yes --update ppa:ansible/ansible
apt install ansible -y

# add docker repo
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# run ansible setup
ansible-playbook ansible/setup.yml