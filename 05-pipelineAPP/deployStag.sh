#!/bin/bash

cd 05-pipelineAPP/ansible

#ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i hosts provisionar.yml -u ubuntu --private-key ~/key-private-turma3-dani-dev.pem

echo "Executando ansible ::::: [ ansible-playbook -i hosts provisionar.yml -u ubuntu --private-key /var/lib/jenkins/key-private-turma3-dani-dev.pem ]"
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i hosts provisionarStag.yml -u ubuntu --private-key /var/lib/jenkins/key-private-turma3-dani-dev.pem
