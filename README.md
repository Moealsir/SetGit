**#Usage:**
1. Clone repo anywhere and cd repo
2. Use chmod +x to change files permissions
3. First start ./alias_bash.h script and wait till it finish
after script finish it will install and start fish shell 
5. now start ./alias_fish.h script (in fish terminal)
6. exit fish shell to normal terminal using command: exit
7. write this command to open bashrc file: 
~~~
vi ~/.bashrc
~~~
copy 'bash_file' content and paste it at the end of ~/.bashrc file then save it (DON'T DELETE ANYTHING FROM THIS FILE!)<br>
!modify the vaiables to your own information!<br>
now run the command: 
~~~
source ~/.bashrc
~~~
8. start fish shell with command: f
9. write this command to open fish config file:
~~~
vi ~/.config/fish/config.fish
~~~
copy 'fish_aliases' file and paste it inside config.<br>
!modify the vaiables to your own information!<br>
save file.

run the command to restart fish shell:
~~~
fish
~~~


**#Both script will set the follwing:**
1. aliases can be used anytime (you can modify them later)
2. functions can be used.
3. you can use the command 're' to quick open a directory you visited before
4. use the command 'gtc' to quick set git config file
5. use the function 'gcl' to quick clone repo from your repositry. 
for example: alx-low_level_programming
it will clone the repo and cd the repo, run pwd to check your path.
6. use the function 'e' to echo file
for example: e 'readme file' README.md
7. use the function 'ea' to append into file
for example: ea 'another line' README.md
8. use the function 'm' to make a directory.
for example: m 0x07-pointers_arrays_strings
9. use the function 'gacp' to git add commit and push.
**attention: use this command only and only in master branch, if else use aliases**
for example: gacp "my first commit"

