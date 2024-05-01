#!/bin/bash

# Navigate to the target folder
# cd /path/to/your/folder

# Replace spaces with underscores in file names
for file in *; do
    if [ -f "$file" ]; then
        newname=$(echo "$file" | tr ' ' '_')
        mv "$file" "$newname"
    fi
done
