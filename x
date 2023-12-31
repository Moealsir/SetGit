#!/bin/bash

function chmod_scripts() {
 if [ "$#" -eq 0 ]; then
        # No arguments provided, check for shebang files in the current directory
        for file in *; do
            if [[ -f "$file" && "$(head -n 1 "$file" 2>/dev/null | grep -c '^#!/')" -eq 1 ]]; then
                # Found a shebang script, set executable permissions
                chmod +x "$file"
            fi
        done
    else
        # Process user-specified files
        for file in "$@"; do
            # Check if the file is a regular file and has a shebang
            if [[ -f "$file" && "$(head -n 1 "$file" 2>/dev/null | grep -c '^#!/')" -eq 1 ]]; then
                # Found a shebang script, set executable permissions
                chmod +x "$file"
            fi
        done
    fi
}

function install_black() {
    # Check if black is installed
    if ! command -v black &> /dev/null; then
        # Check if pip is installed
        if ! command -v pip &> /dev/null; then
            echo "pip is not installed. Installing pip..."
            sudo apt-get install -y python3-pip
        fi

        echo "Black is not installed. Installing..."
        sudo pip install git+https://github.com/psf/black
        echo "Black installed successfully"
    fi
}

function process_python_files() {
    if [ "$#" -eq 0 ]; then
        # No arguments provided, check for *.py files in the current directory
        if compgen -G "*.py" > /dev/null; then
            # Process each specified .py file
            for file in *.py; do
                # Backup the original file
                backup_file="${file}.bak"
                cp "$file" "$backup_file"

                # Run black on the specified .py file
                black "$file"

                # Wait for the previous command to finish before proceeding
                wait

                # Run pycodestyle on the specified .py file
                pycodestyle "$file"
            done
        fi
    else
        # Process user-specified files
        for file in "$@"; do
            # Check if the file ends with .py
            if [[ "$file" == *.py ]]; then
                # Backup the original file
                backup_file="${file}.bak"
                cp "$file" "$backup_file"

                # Run black on the specified .py file
                black "$file"

                # Wait for the previous command to finish before proceeding
                wait

                # Run pycodestyle on the specified .py file
                pycodestyle "$file"
            fi
        done
    fi
}

# Call the function
process_python_files "$@"


function check_and_run_betty_c() {
    if [ "$#" -eq 0 ]; then
        # No arguments provided, check for *.c files in the current directory
        if compgen -G "*.c" > /dev/null; then
            # Run betty on *.c files
            betty *.c
        fi
    else
        # Process user-specified files
        for file in "$@"; do
            # Check if the file ends with .c
            if [[ "$file" == *.c ]]; then
                # Run betty on the specified .c file
                betty "$file"
            fi
        done
    fi
}


# Call the functions
chmod_scripts "$@"
install_black
process_python_files "$@"
check_and_run_betty_c "$@"

