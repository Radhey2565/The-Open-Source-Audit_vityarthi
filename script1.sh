#!/bin/bash
# Script 1: System Identity Report
# This script generates a basic report of the current Linux system.

# Store system information in variables using command substitution
KERNEL_VERSION=$(uname -r)
DISTRO_NAME=$(lsb_release -ds 2>/dev/null || cat /etc/os-release | grep "PRETTY_NAME" | cut -d'"' -f2)
CURRENT_USER=$USER
HOME_DIR=$HOME
UPTIME_INFO=$(uptime -p)
CURRENT_DATE=$(date)

# Display the report header
echo "------------------------------------------"
echo "      SYSTEM IDENTITY REPORT              "
echo "------------------------------------------"

# Print the gathered system information
echo "Kernel Version:    $KERNEL_VERSION"
echo "Distribution:      $DISTRO_NAME"
echo "Current User:      $CURRENT_USER"
echo "Home Directory:    $HOME_DIR"
echo "System Uptime:     $UPTIME_INFO"
echo "Date and Time:     $CURRENT_DATE"
echo "------------------------------------------"

# Display Linux License Message (Academic Requirement)
echo "NOTICE: The Linux kernel is released under the GNU General Public License (GPL)."
echo "------------------------------------------"
