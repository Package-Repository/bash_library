#!/bin/bash

# Function to process each directory
process_directory() {
    local dir="$1"

    # Check if CMakeLists.txt exists in the directory
    if [ -e "$dir/CMakeLists.txt" ]; then
        # Run your desired command here
        echo "Running command in $dir"
        # Replace the following line with your actual command
        build_project.sh -i
    else
        echo "No CMakeLists.txt in $dir"
    fi
}

# Main script

# Loop through each directory
for dir in */; do
    # Exclude non-directories (e.g., symbolic links)
    if [ -d "$dir" ]; then
        process_directory "$dir"
    fi
done
