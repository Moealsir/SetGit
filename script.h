#!/bin/bash

clear

#install fish
sudo apt install fish -y

clear

echo "#!/bin/bash

DIR_HISTORY_FILE=\"\$HOME/.dir_history\"

if [ ! -f \"\$DIR_HISTORY_FILE\" ]; then
    echo \"Directory history file not found.\"
    exit 1
fi

if [ \"\$#\" -eq 0 ]; then
    # Display directory history if no argument is provided
    echo \"Directory History:\"
    tac \"\$DIR_HISTORY_FILE\" | awk '!a[\$0]++' | nl -w 1 -s '. '
    exit 0
fi

choice=\"\$1\"  # Use the argument as the choice

if [ \"\$choice\" = \"q\" ]; then
    exit 0
elif [[ \"\$choice\" =~ ^[0-9]+\$ ]]; then
    dir=\$(tac \"\$DIR_HISTORY_FILE\" | awk '!a[\$0]++' | sed -n \"\${choice}p\")
    if [ -n \"\$dir\" ]; then
        echo \"cd \\\"\$dir\\\"\"
    else
        echo \"Invalid choice. Try again.\"
    fi
else
    echo \"Invalid choice. Try again.\"
fi


" > dir_navigator.sh

#change permission to dir_navigator.sh
sudo chmod +x dir_navigator.sh
sudo mv dir_navigator.sh /usr/local/bin/

clear

#copy bash_file to ~/.bashrc
cat bash_file >> ~/.bashrc
source ~/.bashrc

#create config file
sudo touch ~/.config/fish/config.fish

#append fish_aliases to config file
sudo cat fish_aliases >> ~/.config/fish/config.fish

#create functions directory
sudo mkdir -p ~/.config/fish/functions

#copy functions to the directory
sudo cp funcs/* ~/.config/fish/functions

clear
echo "Setting up Variables"
echo
read -p "Enter your token: " token
read -p "Enter your username: " user
read -p "Enter your email: " mail

echo "#mygithub" >> ~/.bashrc
echo "#mygithub" >> ~/.config/fish/config.fish

echo "token=$token" >> ~/.bashrc
echo "set token $token" >> ~/.config/fish/config.fish

echo "gituser=$user" >> ~/.bashrc
echo "set gituser $user" >> ~/.config/fish/config.fish

echo "gitmail=$mail" >> ~/.bashrc
echo "set gitmail $mail" >> ~/.config/fish/config.fish

source ~/.bashrc
echo "Fish installed successfully."
echo
echo "Successfully scripted."
source ~/.bashrc
fish
