#!/bin/bash

# Check if a command is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <command>"
  exit 1
fi

# Iterate through directories and subdirectories
for dir in $(find . -type d); do
  # Skip the current directory (.) and parent directory (..)
  if [ "$dir" != "." ] && [ "$dir" != ".." ]; then
    # Execute the provided command in each directory
    (cd "$dir" && eval "$@")
  fi
done
