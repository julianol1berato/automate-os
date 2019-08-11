#!/bin/bash
# Create JulianoL1berato
#
# Desabilita selinux:
setenforce 0
sudo sed -i "s/enforcing/disabled/g" /etc/selinux/config
# Updates
yum update -y 
yum upgrade -y
# Install Utilities
yum install vim unzip openssh-server -y

# Change config sshd
cat /etc/ssh/sshd_config | grep -v "PermitRootLogin" >
cat /etc/ssh/sshd_config | grep -v "PasswordAuthentication" >
echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config
echo "PermitRootLogin yes" >> /etc/ssh/sshd_config

# Change configure Vim
echo "colorscheme elflord" > ~/.vimrc
echo "syntax on" >> ~/.vimrc
