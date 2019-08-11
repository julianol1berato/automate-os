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
yum install vim unzip openssh-server -y

## change config sshd
cat /etc/ssh/sshd_config | grep -v "PermitRootLogin" >
cat /etc/ssh/sshd_config | grep -v "PasswordAuthentication" >
echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config
echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
systemctl restart sshd

## flush rules
iptables −F
iptables −X
iptables −Z
iptables −t nat −F
## initial rules
iptables −P INPUT ACCEPT
iptables −P OUTPUT ACCEPT
iptables −P FORWARD ACCEPT
iptables −t nat −P PREROUTING ACCEPT
iptables −t nat −P POSTROUTING ACCEPT
iptables −A INPUT −i lo −j ACCEPT


## change configure vim
echo "colorscheme elflord" > ~/.vimrc
echo "syntax on" >> ~/.vimrc
