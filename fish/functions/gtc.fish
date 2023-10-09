function gtc
    git config --global user.name $gituser
    git config --global user.email $gitmail

    echo "Git global configuration set to Name: $gituser, Email: $gitmail."
end
