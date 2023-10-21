#!/bin/bash

# Check if the directory argument is provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <directory>"
    exit 1
fi

# Directory to keep
directory_to_keep="$1"

username=$(whoami)

# Create a temporary directory for the copy
temporary_copy_dir="/home/$username/temp/temporary_auto_gen_copy_dir"
rm -rf "$temporary_copy_dir"
mkdir -p "$temporary_copy_dir"

# Clone the Git repository
git clone --recursive-submodules https://github.com/Repo-Factory/Robot-Packages git_auto_gen_package_dir

# Move into the cloned repository directory
cd git_auto_gen_package_dir || exit 1

# Find all directories matching the specified name and copy them to the temporary directory
find . -type d -name "$directory_to_keep" -exec sudo cp -r {} "$temporary_copy_dir/" \;

# Move back to the original directory
cd ..

# Remove the cloned repository
sudo rm -rf git_auto_gen_package_dir

echo "Cleanup completed. Only '$directory_to_keep' and its subdirectories remain in $temporary_copy_dir."

# Move into the temporary directory
cd "$temporary_copy_dir"

sudo chown -R "$username" "$directory_to_keep"

cd "$directory_to_keep"

s
. s

while [[ $# -gt 0 ]]; do
    case "$1" in
        -b|--build)
            bp
            bp -i            
            exit 0
            ;;
    esac
    shift
done
