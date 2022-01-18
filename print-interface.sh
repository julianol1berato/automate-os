#!/bin/bash
reset
sleep 1
echo "--------------------------------------------------------------------------" 
echo " " 


/usr/sbin/ip a s | grep -v inet6 | grep inet | grep -v 127.0.0.1
sleep 30
