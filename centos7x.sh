#!/bin/bash
## Create JulianoL1berato
## CentOS 7.x
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
echo 'HISTTIMEFORMAT="%d/%m/%Y - %T => "' >> ~/.bashrc
echo "PS1='\[\033[00;32m\]┌─[\[\033[00;31m\]\u\[\033[00m\]@\[\033[01;34m\]\h\[\033[00;32m\]]──[\[\033[01;33m\]\A\[\033[00;32m\]]──[\[\033[00m\]\w\[\033[00;32m\]]\n└─[\!]─>\$\[\033[00;32m\] '" >> ~/.bashrc
# remember the last 1000 commands in history
echo "HISTSIZE=50000" >> ~/.bashrc
# Limit the size of the ~/.bash_history file
echo "HISTFILESIZE=100000" >> ~/.bashrc
# append to the history file, don't overwrite it
echo "shopt -s histappend" >> ~/.bashrc
# Avoid duplicate entries
echo "export HISTCONTROL=ignoredups:erasedups" >> ~/.bashrc

systemctl restart sshd

timedatectl set-timezone America/Sao_Paulo


## flush rules
/usr/sbin/iptables −F
/usr/sbin/iptables −X
/usr/sbin/iptables −Z
## initial rules
iptables −P INPUT ACCEPT
iptables −P OUTPUT ACCEPT
iptables −P FORWARD ACCEPT
iptables −A INPUT −i lo −j ACCEPT
systemctl stop firewalld
systemctl disable firewalld

## change configure vim
echo "colorscheme elflord" > ~/.vimrc
echo "syntax on" >> ~/.vimrc
bash

