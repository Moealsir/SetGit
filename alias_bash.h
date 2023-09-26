#!/bin/bash

clear

#install fish
apt install fish -y

clear
echo "Fish installed successfully."

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

echo "Successfully scripted."
