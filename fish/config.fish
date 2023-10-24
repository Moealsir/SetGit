if status is-interactive
    # Commands to run in interactive sessions can go here
end
alias ob 'vi ~/.bashrc'
alias sb 'source ~/.bashrc'
alias ccc 'clear'
alias t 'touch'
alias i 'sudo apt-get install'
alias v 'vim'
alias l 'ls'
alias d 'rm -rf'
alias cx 'chmod +x'
alias f 'fish'
alias o 'open'

#naviagation aliases
alias c 'cd '
#go back to previous directories
alias b 'cd ..'
alias bb 'cd ../..'
alias b3 'cd ../../../'
alias b4 'cd ../../../../'
alias b5 'cd ../../../../../'

#Git aliases
alias ada 'git add *'
alias ad 'git add'
alias gb 'git branch'
alias st 'git status'
alias gco 'git checkout'
alias p 'git push'
alias pl 'git pull'
alias fc 'vi ~/.config/fish/config.fish'
alias ff 'cd ~/.config/fish/functions'

alias alx='sshpass -p "84b8a7e3c59122fde1c3" ssh -o ServerAliveInterval=60 -o ServerAliveCountMax=5 3a5993c2f91b@3a5993c2f91b.53c8753f.alx-cod.online'

#mygithub
set token 

set gituser 
set gitmail 
