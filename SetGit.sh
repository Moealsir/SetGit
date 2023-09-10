#!/bin/bash

clear
echo "Welcome to Moealsir SCRIPT"
echo

#ask user if he want to set-up SSH connection
read -p "Do you want to set up an SSH connection? (y for yes / n for no): " SSHconn

if [ "$SSHconn" == "y" ]; then
    #set-up GitHub profile
    clear 
    echo "First, Set up your GitHub profile"
    echo
    read -p "Please enter your GitHub email: " gitemail
    read -p "Please enter your GitHub username: " gituser
    read -p "Please enter your GitHub passowrd: " gitpass
    read -p "Please enter your GitHub token: " token

    git config --global user.email "$gitemail"
    git config --global user.name "$gituser"
    git config --global user.passowrd "$gitpass"

    # Create gcl alias for fast cloning
    echo -e '\n\n' >> ~/.bashrc
    echo -e "gcl() {      
        git clone https://github.com/$gituser/\$1.git
    }" >> ~/.bashrc
    source ~/.bashrc

    # Create SSH connection
    clear
    echo "Let's set up your connection to the ALX web terminal"
    echo
    read -p "Please enter your web terminal Host: " SandHost
    read -p "Please enter your web terminal Username: " SandUser
    read -p "Please enter your web terminal Password: " SandPass

    # Create an alias to open ALX terminal quickly
    # Then append the alias to ~/.bashrc
    echo -e '\n\n' >> ~/.bashrc
    echo '# ALX terminal alias' >> ~/.bashrc
    echo "alias alx='sshpass -p \"$SandPass\" ssh -o ServerAliveInterval=60 -o ServerAliveCountMax=3 $SandUser@$SandHost'" >> ~/.bashrc

    clear

    echo "#################################################"
    echo "Script is done" 
    echo "Now you can use the \"alx\" alias to connect to your ALX web terminal"
    echo ""
    echo "Also, you can use the \"gcl\" function to clone any repo from your GitHub account"
    echo ""
    echo "For example: gcl zero_day"
    echo ""
    echo "#################################################"
    echo -e "Scripted by: Moealsir\n"

else
    clear
    #set-up GitHub profile
    echo "First, set up your GitHub profile"
    echo
    read -p "Please enter your GitHub email: " gitemail
    read -p "Please enter your GitHub username: " gituser
    read -p "Please enter your GitHub passowrd: " gitpass
    read -p "Please enter your GitHub token: " token

    git config --global user.email "$gitemail"
    git config --global user.name "$gituser"
    git config --global user.passowrd "$gitpass"

    # Create a function for fast cloning
    echo -e '\n\n' >> ~/.bashrc
    echo -e "gcl() {      
        git clone https://$token@github.com/$gituser/\$1.git
    }" >> ~/.bashrc
    source ~/.bashrc
    clear

    echo "#################################################"
    echo "Script is done" 
    echo "Now you can use the \"gcl\" function to clone any repo from your GitHub account"
    echo ""
    echo "For example: gcl zero_day"
    echo ""
    echo "#################################################"
    echo -e "Scripted by: Moealsir\n"
fi

