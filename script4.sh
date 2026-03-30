#!/bin/bash
# Script 4: Log File Analyzer
# This script counts occurrences of a keyword in a log file and shows recent matches.

# Take input arguments: $1 is logfile, $2 is keyword
LOGFILE=$1
KEYWORD=${2:-"error"} # Default keyword is "error" if not provided

# Handle file not found error
if [[ ! -f "$LOGFILE" ]]; then
    echo "Error: Log file '$LOGFILE' not found."
    echo "Usage: bash script4.sh <path_to_log> [keyword]"
    exit 1
fi

# Initialize counter variable
COUNT=0

# Count occurrences using a while read loop
while read -r line; do
    # Check if line contains the keyword (case insensitive)
    if echo "$line" | grep -qi "$KEYWORD"; then
        ((COUNT++))
    fi
done < "$LOGFILE"

# Output the results
echo "Total occurrences of '$KEYWORD' in $LOGFILE: $COUNT"

# Print the last 5 matching lines using grep and tail
echo "Last 5 matches found:"
grep -i "$KEYWORD" "$LOGFILE" | tail -n 5
