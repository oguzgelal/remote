#!/usr/bin/env bash

REMOTEUSER="root"
PROJABSPATH=${PWD}
SUDOUSER="root"

cd ansible

sed -i "" -e "s+SETREMOTEUSER+$REMOTEUSER+g" ansible.cfg
sed -i "" -e "s+SETREMOTEUSER+$REMOTEUSER+g" playbooks/docker_app/up.yml
sed -i "" -e "s+SETPROJABSPATH+$PROJABSPATH+g" playbooks/docker_app/up.yml
sed -i "" -e "s+SETSUDOUSER+$SUDOUSER+g" playbooks/docker_app/up.yml

ansible-playbook playbooks/docker_app/up.yml -u ${REMOTEUSER}