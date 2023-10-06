#!/bin/bash

# Build scion types


# Build Robot Type Library


# Build Dependencies


# Build Robot Packages


libraries_path=/usr/local/lib
include_path=/usr/local/include/robot_libraries
robot_bin_path=/usr/local/bin/robot
test_bin_path=/usr/local/bin/robot_tests

add_all_directores_to_bash_rc()
{
    # Update the PATH in ~/.bashrc
    echo "Adding directories to PATH in ~/.bashrc"
    for dir in "$TARGET_DIR"/*; do
        if [ -d "$dir" ]; then
            echo "export PATH=\$PATH:$dir" >> ~/.bashrc
        fi
    done
}

# flag to add to bashrc
while [[ $# -gt 0 ]]; do
    case "$1" in
        -a|--add)
           add_all_directores_to_bash_rc;;
    esac
    shift
done