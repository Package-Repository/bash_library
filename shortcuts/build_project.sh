#!/bin/bash

set -e  # Exit on any error

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BUILD_DIR="$SCRIPT_DIR/build"

# Create build directory if it doesn't exist
mkdir -p "$BUILD_DIR"

# Change to the build directory
cd "$BUILD_DIR" || exit 1

# Run CMake
cmake ..

# If -i flag present, install shared library to the machine for later use
while [[ $# -gt 0 ]]; do
    case "$1" in
        -i|--install)
            sudo make install
            exit 0
            ;;
    esac
    shift
done

# Build the project
make
