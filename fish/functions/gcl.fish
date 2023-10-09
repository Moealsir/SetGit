function gcl
    git clone https://$token@github.com/$gituser/$argv[1].git
    cd $argv[1]
end
