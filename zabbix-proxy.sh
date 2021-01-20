#!/bin/bash
## install proxy centos7
## uso ./zabbix-proxy.sh HOSTNAME

##stop firewalld
systemctl stop firewalld
systemctl disable firewalld

##instalacao aplicacoes
yum update -y
yum upgrade -y
rpm -Uvh http://repo.zabbix.com/zabbix/5.0/rhel/7/x86_64/zabbix-release-5.0-1.el7.noarch.rpm
#rpm -Uvh http://repo.zabbix.com/zabbix/5.0/rhel/7/x86_64/zabbix-proxy-mysql-5.0.7-1.el7.x86_64.rpm
yum install epel-release vim wget -y
yum install mariadb-libs.x86_64 mariadb-server.x86_64 zabbix-agent zabbix-proxy zabbix-get -y

##backup configuracoes
cp /etc/zabbix/zabbix_proxy.conf{,.bkp}
cp /etc/zabbix/zabbix_agentd.conf{,.bkp}

##download gerador usuario sql
cd /tmp
wget https://raw.githubusercontent.com/julianol1berato/automate-os/master/zabbix-mysql.sql

##limpa comentarios
# /etc/zabbix/zabbix_proxy.conf

##gerar chave psk
openssl rand -hex 32 > /etc/zabbix/chave.psk
echo "Hostname="$1 >> /etc/zabbix/zabbix_proxy.conf
echo "TLSConnect=psk" >> /etc/zabbix/zabbix_proxy.conf
echo "TLSPSKIdentity=ZBX-"$1 >> /etc/zabbix/zabbix_proxy.conf
echo "TLSPSKFile=/etc/zabbix/chave.psk" >> /etc/zabbix/zabbix_proxy.conf
echo "Server=monitoramento.accesscontact.com.br" >> /etc/zabbix/zabbix_proxy.conf


##upload banco de dados zabbix-proxy
#zcat /usr/share/doc/zabbix-proxy-mysql*/schema.sql.gz | mysql -uzabbix -p zabbix
#systemctl enable zabbix-proxy.service zabbix-agent.service
