#!/bin/bash

clear

# Change permission to dir_navigator.sh
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

# Ask user for the alias preference until a valid response is provided
while true; do
    read -p "Are you OK with the alias 'x' for the script? (y/n): " alias_response

    if [[ $alias_response == "y" ]]; then
        sudo mv x /bin/
        break
    elif [[ $alias_response == "n" ]]; then
        # Ask user for a new alias (check and prevent spaces in the alias)
        read -p "Enter a new alias for the script (no spaces): " new_alias

        # Remove any spaces from the alias
        new_alias="${new_alias// /}"

        # Move the script to the new alias
        sudo mv x "$new_alias"
        sudo mv "$new_alias" /bin/
        break
    else
        echo "Invalid response. Please enter 'y' or 'n'."
    fi
done

echo -e "Please copy and run this command\n"
echo -e "       source ~/.bashrc \n\nin your terminal to apply changes."
read -p "Press [Enter] key to continue..."

