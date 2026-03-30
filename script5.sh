#!/bin/bash
# Script 5: Open Source Manifesto Generator
# This script generates a personalized manifesto based on user input.

# Ask user questions using the read command
echo "Welcome to the Open Source Manifesto Generator!"
echo "Please answer the following questions to build your manifesto:"

read -p "1. What is the main Open Source tool you use? " TOOL
read -p "2. What does 'freedom' mean to you in software? " FREEDOM
read -p "3. What do you want to build with Open Source? " BUILD

# Get current username using command substitution
USER_NAME=$(whoami)

# Generate the manifesto paragraph using variables
MANIFESTO="I, $USER_NAME, am a proud user of $TOOL. To me, freedom in software means $FREEDOM. With the power of Open Source, I aim to build $BUILD and contribute back to the community."

# Save the manifesto to a file named manifesto_<username>.txt
FILENAME="manifesto_${USER_NAME}.txt"
echo "$MANIFESTO" > "$FILENAME"

# Display confirmation and the content of the file
echo "------------------------------------------"
echo "Manifesto generated successfully!"
echo "Saved to: $FILENAME"
echo "------------------------------------------"
cat "$FILENAME"
echo "------------------------------------------"
