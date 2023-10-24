#!/bin/bash

# Define the directories to check and create
directories=(
    "/usr/local/include/robot_libraries"
    "/usr/local/bin/scripts"
    "/usr/local/bin/robot/c"
    "/usr/local/bin/robot/py"
    "/usr/local/bin/robot_tests/c"
    "/usr/local/bin/robot_tests/py"
)

# Check if each directory exists, and if not, create it
for dir in "${directories[@]}"; do
    if [ ! -d "$dir" ]; then
        echo "Creating directory: $dir"
        sudo mkdir -p "$dir"
    fi
done

# Check if the entries are already in .bashrc, and if not, add them
bashrc_path="$HOME/.bashrc"

for dir in "${directories[@]}"; do
    if ! grep -q "export PATH=\$PATH:$dir" "$bashrc_path"; then
        echo "Adding '$dir' to $bashrc_path"
        echo "export PATH=\$PATH:$dir" >> "$bashrc_path"
    fi
done

# Source the .bashrc file to apply changes to the current session
source "$bashrc_path"

echo "Setup complete."
