#!/usr/bin/env bash

REMOTEUSER="root"
PROJABSPATH=${PWD}
SUDOUSER="root"

apt update
apt install software-properties-common python3-apt python-apt-common -yq
apt-add-repository --yes --update ppa:ansible/ansible
apt install ansible -yq
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

cd ansible

sed -i "" -e "s+SETREMOTEUSER+$REMOTEUSER+g" ansible.cfg
sed -i "" -e "s+SETREMOTEUSER+$REMOTEUSER+g" playbooks/docker_app/up.yml
sed -i "" -e "s+SETPROJABSPATH+$PROJABSPATH+g" playbooks/docker_app/up.yml
sed -i "" -e "s+SETSUDOUSER+$SUDOUSER+g" playbooks/docker_app/up.yml

cp inventories/hosts inventories/hosts.back

rm -rf cp inventories/hosts
touch inventories/hosts
cat <<EOT >> inventories/hosts
[dockerserver]
127.0.0.1 ansible_connection=local
localhost ansible_connection=local

[dockerserver:vars]
ansible_python_interpreter=/usr/bin/python3
EOT

ansible-playbook playbooks/docker_app/up.yml -u ${REMOTEUSER}