#!/bin/bash
CHAVESSH="~/.ssh/grupo-one.pem"
#CHAVESSH="/var/lib/jenkins/.ssh/grupo-one.pem"

cd terraform
terraform init
terraform fmt
terraform apply -auto-approve

echo "Aguardando criação de maquinas ..."
# sleep 10 # 10 segundos


ID_M1=$(terraform output | grep 'mysql_prod' | awk '{print $4}')
ID_M1_DNS=$(terraform output | grep 'mysql_prod' | cut -b 16- | tr -d '",')
IP_PRIV_M1=$(terraform output | grep 'mysql_IpPrivPrd' | cut -b 21- | tr -d '",')

ID_M2=$(terraform output | grep 'mysql_dev' | awk '{print $4}')
ID_M2_DNS=$(terraform output | grep 'mysql_dev' | cut -b 15- | tr -d '",')
IP_PRIV_M2=$(terraform output | grep 'mysql_IpPrivDev' | cut -b 21- | tr -d '",')

ID_M3=$(terraform output | grep 'mysql_stage' | awk '{print $4}')
ID_M3_DNS=$(terraform output | grep 'mysql_stage' | cut -b 17- | tr -d '",')
IP_PRIV_M3=$(terraform output | grep 'mysql_IpPrivStg' | cut -b 21- | tr -d '",')

echo "
[mysql_prod]
$ID_M1_DNS
[mysql_dev]
$ID_M2_DNS
[mysql_stage]
$ID_M3_DNS
" > ../ansible/hosts

echo "
PRD: $IP_PRIV_M1
DEV: $IP_PRIV_M2
STG: $IP_PRIV_M3
" > /tmp/mysql_ip_privado


#sleep 10 # 20 segundos


cd ../ansible

echo "Executando ansible ::::: [ ansible-playbook -i hosts provisionar.yml -u ubuntu --private-key ${CHAVESSH} ]"
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i hosts provisionar.yml -u ubuntu --private-key ${CHAVESSH}
