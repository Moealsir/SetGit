#!/usr/bin/env fish

clear
#setting up variables
echo "Setting vaiables and functions"
read -P "Enter your token: " token
echo "
#Usefull variable" >> testing
echo "set token $token" >> testing

read -P "Enter your GitHub Email: " gitmail
read -P "Enter your GitHub Username: " gituser
read -P "Enter your GitHub Password: " gitpass
echo "set gitmail $gitmail" >> testing
echo "set gituser $gituser" >> testing
echo "set gitpass $gitpass" >> testing

echo "

#Basic aliases
alias ob vi ~/.bashrc
alias sb source ~/.bashrc
alias ccc clear
alias t touch
alias i sudo apt-get install
alias v vim
alias d rm -rf
alias cx chmod +x

#naviagation aliases
alias c cd
#go back to previous directories
alias b cd ..
alias bb cd ../..
alias b3 cd ../../../
alias b4 cd ../../../../
alias b5 cd ../../../../../

#Git aliases
alias ada git add *
alias ad git add
alias gb git branch
alias st git status
alias gco git checkout
alias p git push
alias pl git pull
alias fc 'vi ~/.config/fish/config.fish'
alias ff 'cd ~/.config/fish/functions'

" >> ~/.config/fish/config.fish

echo 'function e
    echo "$argv[1]" > "$argv[2]"
end
' >> ~/.config/fish/functions/e.fish

echo 'function ea
    echo "$argv[1]" >> "$argv[2]"
end
' >> ~/.config/fish/functions/ea.fish

echo 'function m
    mkdir -vp $argv[1]
    cd $argv[1]
end' > ~/.config/fish/functions/m.fish

echo 'function gcl
    git clone https://$token@github.com/$gituser/$argv[1].git
    cd $argv[1]
end' > ~/.config/fish/functions/gcl.fish

echo 'function gacp
    git add .
    git commit -m $argv[1]
    git push
end' > ~/.config/fish/functions/gacp.fish

echo 'function gtc
    git config --global user.name $gituser
    git config --global user.email $gitmail
    git config --global user.password $gitpass

    echo "Git global configuration set to Name: $gituser, Email: $gitmail, Password: $gitpass"
end' > ~/.config/fish/functions/gtc.fish

fish 
echo "Scripted successfully."