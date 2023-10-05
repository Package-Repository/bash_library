#!/bin/bash

# @dependency build_project.sh

# Function to process each directory
process_directory() {
    local dir="$1"

    # Check if CMakeLists.txt exists in the directory
    if [ -e "$dir/CMakeLists.txt" ]; then
        # Run your desired command here
        echo "Running command in $dir"
        # Replace the following line with your actual command
        cd "$dir" || exit
        build_project.sh -i
        cd ..
    else
        echo "No CMakeLists.txt in $dir"
    fi
}

# Main script using find command to traverse all subdirectories
find . -type d -exec bash -c 'process_directory "{}"' \;
