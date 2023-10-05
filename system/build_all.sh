#!/bin/bash

process_directory() {
    local dir="$1"

    # Check if CMakeLists.txt exists in the directory
    if [ -e "$dir/CMakeLists.txt" ]; then
        # Run your desired command here
        echo "Running command in $dir"
        # Replace the following line with your actual command
        (cd "$dir" && build_project.sh -i && cd ..)
    else
        echo "No CMakeLists.txt in $dir"
    fi
}

# Function to process all directories and subdirectories
process_all_directories() {
    local start_dir="$1"

    # Process the current directory
    process_directory "$start_dir"

    # Recursively process subdirectories
    for sub_dir in "$start_dir"/*; do
        if [ -d "$sub_dir" ]; then
            process_all_directories "$sub_dir"
        fi
    done
}

# Start processing from the current directory
current_dir=$(pwd)
process_all_directories "$current_dir"
