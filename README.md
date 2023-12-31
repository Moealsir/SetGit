# SetGit
This script is designed to streamline various tasks related to managing and formatting code files, particularly within a Git environment. It encompasses features for setting executable permissions on scripts, installing the black Python code formatter, and applying code formatting and style checks to Python and C files using `black`, `pycodestyle`, and `betty`, respectively.

## WARINING:
1. Please Chack aliases in `bash_file` to avoid duplicating an alias if you already use some.
2. If you installed SetGet before `DO NOT INSTALL IT`, open your `~/.bashrc` file and copmare aliases and function and copy what you need.

## Updated:
1. `Added:` Auto-completion for bash.
2. `Added:` Script `x`.
3. `Added:` New aliases
4. `Updated:` Additional features to `dir_navigator.sh`.
5. `Removed:` Old, unnecessary functions.

## Usage:
1. Clone the repository anywhere and navigate to the repo.
2. Review the aliases in `bash_file` and update alias names if necessary before installing.
3. Run `./install.sh`
4. Ensure you don't have an alias or function named `x`; change it if found.

## Functions:
- **re** - use this function to fast travel between directories
1. `Updated:` Now accepts arguments.
2. `Updated:` Cleans up dir_history.
3. `Updated:` You can delete directories directly from the re function.

## script x
This Bash script is designed to automate various tasks related to managing and formatting code files. It includes functions for setting executable permissions on scripts, installing the black Python code formatter, and applying code formatting and style checks to Python and C files using black, pycodestyle, and betty respectively.<br>
**Features**
<br>
`Scripted Permissions Management:` The script includes a function (`chmod_scripts`) to automatically set executable permissions on scripts based on their shebang lines.

`Python Code Formatting:` The script provides functionality (`process_python_files`) to apply the `black` Python code formatter to Python files, ensuring consistent and formatted code. It also checks Python code style using `pycodestyle`.

`black Installation:` To enhance code formatting capabilities, the script includes a function (`install_black`) that installs the `black` code formatter if it is not already installed.

`C Code Style Checking:` The script includes a function (`check_and_run_betty_c`) to check C files using the `betty` coding style checker, ensuring adherence to coding standards.
<br>

