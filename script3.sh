#!/bin/bash
# Script 3: Disk and Permission Auditor
# This script audits permissions and sizes of key Linux directories.

# List of directories to audit in an array
DIRECTORIES=("/etc" "/var/log" "/home" "/usr/bin" "/tmp")

echo "----------------------------------------------------------------------"
echo "PERMISSIONS | OWNER | GROUP | SIZE | DIRECTORY"
echo "----------------------------------------------------------------------"

# Loop through the directories using a for loop
for dir in "${DIRECTORIES[@]}"; do
    if [ -d "$dir" ]; then
        # Get permissions, owner, and group using ls and awk
        INFO=$(ls -ld "$dir" | awk '{print $1, $3, $4}')
        
        # Get size using du (disk usage) and awk
        SIZE=$(du -sh "$dir" 2>/dev/null | awk '{print $1}')
        
        # Display the formatted output
        echo "$INFO | $SIZE | $dir"
    else
        echo "Directory $dir does not exist."
    fi
done

# Also check Python config directory if it exists
PYTHON_CONFIG="/usr/lib/python3"
if [ -d "$PYTHON_CONFIG" ]; then
    echo "----------------------------------------------------------------------"
    echo "Python Config Directory Found: $PYTHON_CONFIG"
    ls -ld "$PYTHON_CONFIG" | awk '{print "Permissions: " $1 ", Owner: " $3 ", Group: " $4}'
fi
