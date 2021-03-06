#!/bin/bash
# test MatiaDB provisiones with ansible

echo "Starting VM and provision with role"
vagrant box update
vagrant destroy -f
vagrant up

echo "Clean up machine"
ansible-playbook -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory build/cleanup.yml -u vagrant

echo "Packaging box"
vagrant package --output mariadb.box

echo "Destroying machine"
vagrant destroy -f