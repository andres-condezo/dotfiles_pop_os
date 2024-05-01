#!/bin/bash

# Function to replace spaces with underscores in file or folder names
replace_spaces() {
    local item="$1"
    local newname=$(echo "$item" | tr ' ' '_')
    mv "$item" "$newname"
}

# Recursive function to traverse directories and replace spaces
traverse_and_replace() {
    local dir="$1"
    cd "$dir" || exit 1
    
    # Replace spaces in files
    for file in *; do
        if [ -f "$file" ]; then
            replace_spaces "$file"
        fi
    done
    
    # Recursively traverse into subdirectories
    for folder in */; do
        if [ -d "$folder" ]; then
            traverse_and_replace "$folder"
        fi
    done
    
    cd ..
    
    # Replace spaces in directory name after traversing
    local newdir=$(echo "$dir" | tr ' ' '_')
    mv "$dir" "$newdir"
}

# Start traversal from the current directory
traverse_and_replace "$(pwd)"
