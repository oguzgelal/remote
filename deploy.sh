#!/usr/bin/env bash

PROJABSPATH=${PWD}

apt update
apt install software-properties-common python3-apt python-apt-common -yq
apt-add-repository --yes --update ppa:ansible/ansible
apt install ansible -yq
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sed -i "" -e "s+SETPROJABSPATH+$PROJABSPATH+g" ansible/setup.yml

ansible-playbook ansible/setup.yml