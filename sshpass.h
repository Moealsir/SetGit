#!/bin/bash

clear
#install sshpass
sudo apt install sshpass -y

#read mandotories
clear
echo -e "Open your Sandbox page and fill the following: \n"

read -p "Please enter you Host: " host
read -p "Please enter you Username: " user
read -p "Please enter you Password: " pass

echo -e "\n\n" >> ~/.bashrc
echo "#ALX terminal ssh
alias alx='sshpass -p \"$pass\" ssh -o ServerAliveInterval=60 -o ServerAliveCountMax=5 $user@$host'" >> ~/.bashrc

source ~/.bashrc
clear 
echo -e "You need need to try the regular wasy once before start using alias 'alx'\n\Usage: \ntype command alx"
