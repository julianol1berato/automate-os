#!/bin/sh
# Install puppet CentOS 6 - 7

case "$1" in
agent)
/opt/puppetlabs/puppet/bin/puppet agent -t
;;
install)
echo "nameserver 8.8.8.8" >> /etc/resolv.conf
wget https://yum.puppet.com/puppet/puppet6-release-el-6.noarch.rpm
yum install puppet tzdata -y
echo "[agent]
certname = $(hostname)
server = gconf.eitisolucoes.com.br" > /etc/puppetlabs/puppet/puppet.conf
chkconfig --level 345 puppet on
/opt/puppetlabs/puppet/bin/puppet agent -t
;;
hostname)
read -p 'Enter new hostname: ' hostname0
##hostname $hostname0
##sed /etc/sysconfig/network
##sed /etc/hosts
;;
*)      echo "Uso: {agent, install, hostname}"
        exit 2
        ;;

esac
exit 0
