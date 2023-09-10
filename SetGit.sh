#!/bin/bash

# Define ANSI escape codes for colors
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

clear
echo -e "${CYAN}Welcome to Moealsir SCRIPT${NC}"
echo

read -p "Do you want to set up an SSH connection? (y for yes / n for no): " SSHconn

if [ "$SSHconn" == "y" ]; then
    clear
    echo "First, Set up your GitHub profile"
    echo
    read -p "Please enter your GitHub email: " gitemail
    read -p "Please enter your GitHub username: " gituser
    read -p "Please enter your GitHub token: " token

    git config --global user.email "$gitemail"
    git config --global user.name "$gituser"

    # Create an alias for fast cloning
    echo -e '\n\n' >> ~/.bashrc
    echo -e "gcl() {      
        git clone https://github.com/$gituser/\$1.git
    }" >> ~/.bashrc
    source ~/.bashrc

    # Create SSH connection
    clear
    echo -e "${YELLOW}Let's set up your connection to the ALX web terminal${NC}"
    echo
    read -p "Please enter your web terminal Host: " SandHost
    read -p "Please enter your web terminal Username: " SandUser
    read -p "Please enter your web terminal Password: " SandPass

    # Create an alias to open ALX terminal quickly
    # Then append the alias to ~/.bashrc
    echo -e '\n\n' >> ~/.bashrc
    echo '# ALX terminal alias' >> ~/.bashrc
    echo "alias alx='${GREEN}sshpass -p \"$SandPass\" ssh -o ServerAliveInterval=60 -o ServerAliveCountMax=3 $SandUser@$SandHost${NC}'" >> ~/.bashrc

    clear

    echo -e "${BLUE}#################################################${NC}"
    echo -e "${GREEN}Script is done${NC}" 
    echo "Now you can use the \"alx\" alias to connect to your ALX web terminal"
    echo ""
    echo "Also, you can use the \"gcl\" function to clone any repo from your GitHub account"
    echo ""
    echo -e "For example: ${YELLOW}gcl zero_day${NC}"
    echo ""
    echo -e "${BLUE}#################################################${NC}"
    echo -e "Scripted by: ${CYAN}Moealsir${NC}\n"

else
    clear
    echo "First, set up your GitHub profile"
    echo
    read -p "Please enter your GitHub email: " gitemail
    read -p "Please enter your GitHub username: " gituser
    read -p "Please enter your GitHub token: " token

    git config --global user.email "$gitemail"
    git config --global user.name "$gituser"

    # Create a function for fast cloning
    echo -e '\n\n' >> ~/.bashrc
    echo -e "gcl() {      
        git clone https://github.com/$gituser/\$1.git
    }" >> ~/.bashrc
    source ~/.bashrc
    clear

    echo -e "${BLUE}#################################################${NC}"
    echo -e "${GREEN}Script is done${NC}" 
    echo "Now you can use the \"gcl\" function to clone any repo from your GitHub account"
    echo ""
    echo -e "For example: ${YELLOW}gcl zero_day${NC}"
    echo ""
    echo -e "${BLUE}#################################################${NC}"
    echo -e "Scripted by: ${CYAN}Moealsir${NC}\n"
fi

