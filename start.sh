#!/bin/bash
# Create JulianoL1berato
#
yum update -y 
yum upgrade -y
yum install vim unzip -y

# Change configure Vim
echo "colorscheme elflord" > ~/.vimrc
echo "syntax on" >> ~/.vimrc
