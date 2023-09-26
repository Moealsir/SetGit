#!/bin/bash

clear

#install fish
apt install fish -y

clear
echo "Fish installed successfully."

#setting up aliasses first
echo "


#Aliases:

#Basic aliases
alias ob='vi ~/.bashrc'
alias sb='source ~/.bashrc'
alias alias='vi~/.bash_aliases'
alias ccc='clear'
alias t='touch'
alias i='sudo apt-get install'
alias v='vim'
alias d='rm -rf'
alias cx='chmod +x'
alias f='fish'

#naviagation aliases
alias c='cd '
#go back to previous directories
alias b='cd ..'
alias bb='cd ../..'
alias b3='cd ../../../'
alias b4='cd ../../../../'
alias b5='cd ../../../../../'

#Git aliases
alias ada='git add *'
alias ad='git add'
alias gb='git branch'
alias st='git status'
alias gco='git checkout'
alias p='git push'
alias pl='git pull'

" >> ~/.bash_aliases

clear
echo "Aliases was created."

#setting up variables
echo "Setting vaiables and functions"
read -p "Enter your token: " token
echo "
#Usefull variable" >> ~/.bashrc
echo "token=$token" >> ~/.bashrc

read -p "Enter your GitHub Email: " gitmail
read -p "Enter your GitHub Username: " gituser
read -p "Enter your GitHub Password: " gitpass
echo "gitmail=$gitmail" >> ~/.bashrc
echo "gituser=$gituser" >> ~/.bashrc
echo "gitpass=$gitpass" >> ~/.bashrc

echo -e "\n" >> ~/.bashrc

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

sudo chmod +x dir_navigator.sh
mv dir_navigator.sh /usr/local/bin/


#setting functions
echo "#functions" >> ~/.bashrc
echo -e "#make dir and cd dir
m() {
   mkdir -v -p \$1
   cd \$1
}

#clone repo
gcl() {
    git clone https://\$token@github.com/\$gituser/\$1.git
cd \$1
}

#echo
e() {
     echo \"\$1\" > \"\$2\"
}

#append
ea() {
    echo \"\$1\" >> \"\$2\"
}

#git add commit push
gacp () {
    git add .
    git commit -m \"\$1\"
    git push
}

#set up git config
gtc() {
    git config --global user.name \"\$gituser\"
    git config --global user.email \"\$gitmail\"
    git config --global user.password \"\$gitpass\"

    echo \"Git global configuration set to Name: \$gituser , Email: \$gitmail , Password: \$gitpass\"
}

#re
re() {
    # Display directory history
    dir_navigator.sh

    # Prompt the user
    echo \"Enter a number to change directory, or 'q' to quit.\"
    read choice

    # Use the choice as an argument and change directory
    eval \"\$(dir_navigator.sh \"\$choice\")\"
}

export DIR_HISTORY_FILE=\"\$HOME/.dir_history\"

# Append the new directory to the history file whenever 'cd' is used
cd() {
    builtin cd \"\$@\" && echo \"\$PWD\" >> \"\$DIR_HISTORY_FILE\"
}

" >> ~/.bashrc

source ~/.bashrc

clear
echo "Scripted successfully."

fish