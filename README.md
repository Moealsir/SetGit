#Usage:
1. Clone repo anywhere and cd repo
2. Use chmod +x to change files permissions
3. First start ./alias_bash.h script
then fill the requireds
after script finish it will install fish shell
4. start fish with the command:
fish
5. now start ./alias_fish.h script
and fill requireds

#Both script will set the follwing:
1. aliases to can be used (you can modify them later)
2. functions that can be used.
3. you can use the command 're' to quick open a directory you visited before
4. use the command 'gtc' to quick set git config file
5. Use the function 'gcl' to quick clone repo from your repositry. 
for example: alx-low_level_programming
it will clone the repo and cd the repo, run pwd to check your path.
6. Use the function 'e' to echo file
for example: e 'readme file' README.md
7. Use the function 'ea' to append into file
for example: ea 'another line' README.md
8. Use the function 'm' to make a directory.
for example: m 0x07-pointers_arrays_strings
9. Use the function 'gacp' to git add commit and push.
**attention: use this command only and only in master branch, if else use aliases**
for example: gacp "my first commit"

