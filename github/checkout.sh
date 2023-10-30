#!/bin/bash

# Check if the directory argument is provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <directory>"
    exit 1
fi

git clone --recurse-submodules https://github.com/Repo-Factory-Mechatronics/$1

while [[ $# -gt 0 ]]; do
    case "$2" in
        -b|--build)
            . s
            cd $1
            bp
            bp -i
            cd ..            
            exit 0
            ;;
    esac
    shift
done
