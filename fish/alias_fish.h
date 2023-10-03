#!/usr/bin/env fish

clear
sudo mkdir ~/.config/fish/functions
 
sudo echo 'function e
    echo "$argv[1]" > "$argv[2]"
end
' >> ~/.config/fish/functions/e.fish
funcsave e

sudo echo 'function ea
    echo "$argv[1]" >> "$argv[2]"
end
' > ~/.config/fish/functions/ea.fish
funcsave ea

sudo echo 'function m
    mkdir -vp $argv[1]
    cd $argv[1]
end' > ~/.config/fish/functions/m.fish
funcsave m 

sudo echo 'function gcl
    git clone https://$token@github.com/$gituser/$argv[1].git
    cd $argv[1]
end' > ~/.config/fish/functions/gcl.fish
funcsave gcl 

sudo echo 'function gacp
    git add .
    git commit -m $argv[1]
    git push
end' > ~/.config/fish/functions/gacp.fish
funcsave gacp 

sudo echo 'function gtc
    git config --global user.name $gituser
    git config --global user.email $gitmail

    echo "Git global configuration set to Name: $gituser, Email: $gitmail, Password: $gitpass"
end' > ~/.config/fish/functions/gtc.fish
funcsave gtc 

cat fish_aliases >> ~/.config/fish/config.fish
clear 

fish 
echo "Scripted successfully."
