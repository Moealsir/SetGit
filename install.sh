#!/bin/bash

clear

#change permission to dir_navigator.sh
sudo chmod +x dir_navigator.sh
sudo mv dir_navigator.sh /bin/

clear
echo "Setting up Variables"
echo
read -p "Enter your token: " token
read -p "Enter your username: " user
read -p "Enter your email: " mail

echo "#mygithub" >> ~/.bashrc
echo "token=$token" >> ~/.bashrc
echo "gituser=$user" >> ~/.bashrc
echo "gitmail=$mail" >> ~/.bashrc
echo

clear
cat bash_file >> ~/.bashrc

echo -e "Please copy and run this command\n"
echo -e "       source ~/.bashrc \n\nin your terminal to apply changes."
read -p "Press [Enter] key to continue..."
