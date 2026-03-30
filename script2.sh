#!/bin/bash
# Script 2: Python Package Inspector
# This script checks for the presence of Python 3 and displays its details.

# Check if python3 is installed using command -v
if command -v python3 &> /dev/null; then
    echo "SUCCESS: Python 3 is installed on this system."
    
    # Get version using the --version flag
    PYTHON_VERSION=$(python3 --version)
    echo "Version: $PYTHON_VERSION"
    
    # Use a case statement to handle package detail retrieval
    # Assuming a Debian/Ubuntu based system as per requirements
    OS_TYPE="Debian" 
    
    case $OS_TYPE in
        "Debian")
            echo "Checking package details for python3..."
            # Use grep to find the summary/description
            SUMMARY=$(apt-cache show python3 2>/dev/null | grep "Description-en" -A 1 | tail -n 1)
            LICENSE="Python Software Foundation License (PSF)"
            
            echo "Summary: $SUMMARY"
            echo "License: $LICENSE"
            ;;
        *)
            echo "Unknown OS type. Cannot retrieve detailed metadata."
            ;;
    esac
else
    # Handle the case where python3 is missing
    echo "ERROR: python3 is not installed on this system."
    exit 1
fi
