function gtc
    git config --global user.name $gituser
    git config --global user.email $gitmail
    git config --global user.password $gitpass

    echo "Git global configuration set to Name: $gituser, Email: $gitmail, Password: $gitpass"
end
