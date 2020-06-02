#!/bin/bash
## Create JulianoL1berato
##
## disable selinux:
setenforce 0
sudo sed -i "s/enforcing/disabled/g" /etc/selinux/config
## updates
yum update -y 
yum upgrade -y

## Install Utilities
yum install vim unzip openssh-server wget telnet epel-release -y
#sysadmin? 
#yum install bind-utils nmap 

## change config sshd
cat /etc/ssh/sshd_config | grep -v "PermitRootLogin" > /etc/ssh/sshd_config
cat /etc/ssh/sshd_config | grep -v "PasswordAuthentication" > /etc/ssh/sshd_config
echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config
echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
systemctl restart sshd

## flush rules
#/usr/sbin/iptables −F
#/usr/sbin/iptables −X
#/usr/sbin/iptables −Z
## initial rules
#iptables −P INPUT ACCEPT
#iptables −P OUTPUT ACCEPT
#iptables −P FORWARD ACCEPT
#iptables −A INPUT −i lo −j ACCEPT
systemctl stop firewalld
systemctl disable firewalld

## change configure vim
echo "colorscheme elflord" > ~/.vimrc
echo "syntax on" >> ~/.vimrc
echo 'HISTTIMEFORMAT="%d/%m/%Y - %T =>"' >> ~/.bashrc

