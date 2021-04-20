#!/bin/bash
## Create JulianoL1berato - https://zbx.liberato.dev
## CentOS 7.x
## disable selinux:
setenforce 0
sudo sed -i "s/enforcing/disabled/g" /etc/selinux/config
yum update -y 
yum upgrade -y
yum install vim unzip openssh-server bind-utils wget telnet net-snmp net-snmp-utils nmap epel-release -y


## change config sshd
cp /etc/ssh/sshd_config{,.original}
echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config
echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
echo 'HISTTIMEFORMAT="%d/%m/%Y - %T => "' >> ~/.bashrc
echo "HISTSIZE=50000" >> ~/.bashrc
echo "HISTFILESIZE=100000" >> ~/.bashrc
# append to the history file, don't overwrite it
echo "shopt -s histappend" >> ~/.bashrc
# avoid duplicate entries
echo "export HISTCONTROL=ignoredups:erasedups" >> ~/.bashrc
systemctl restart sshd
timedatectl set-timezone America/Sao_Paulo

## flush rules
/usr/sbin/iptables -F
/usr/sbin/iptables -X
/usr/sbin/iptables -Z
## initial rules
/usr/sbin/iptables -P INPUT ACCEPT
/usr/sbin/iptables -P OUTPUT ACCEPT
/usr/sbin/iptables -P FORWARD ACCEPT
/usr/sbin/iptables -A INPUT -i lo -j ACCEPT
systemctl stop firewalld
systemctl disable firewalld

## change configure vim
echo "colorscheme elflord" > ~/.vimrc
echo "syntax on" >> ~/.vimrc
## custom
cp ~/.bashrc{,.orig}
echo "PS1='\[\033[00;32m\]┌─[\[\033[00;31m\]\u\[\033[00m\]@\[\033[01;34m\]\h\[\033[00;32m\]]──[\[\033[01;33m\]\A\[\033[00;32m\]]──[\[\033[00m\]\w\[\033[00;32m\]]\n└─[\!]─>\$\[\033[00;32m\] '" >> ~/.bashrc
wget https://raw.githubusercontent.com/julianol1berato/automate-os/master/id_rsa.pub
mkdir /root/.ssh
cat id_rsa.pub > /root/.ssh/authorized_keys
rm -y id_rsa.pub
bash
