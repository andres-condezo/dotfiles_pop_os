#!/bin/bash

# Navigate to the target folder
# cd /path/to/your/folder

# Replace spaces with underscores in file names
for folder in */; do
    if [ -d "$folder" ]; then
        newname=$(echo "$folder" | tr ' ' '_')
        mv "$folder" "$newname"
    fi
done
