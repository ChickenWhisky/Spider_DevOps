#!/bin/bash

# Function to retrieve the desktop processor information
get_processor_info() {
    processor=$(grep "model name" /proc/cpuinfo | head -n1 | awk -F': ' '{print $2}')
    echo "Desktop processor: $processor"
}

# Function to retrieve the system kernel information
get_kernel_info() {
    kernel=$(uname)
    echo "System Kernel: $kernel"
}

# Function to retrieve the operating system version
get_os_version() {
    os_version=$(lsb_release -d | awk -F'\t' '{print $2}')
    echo "Operating system version: $os_version"
}

# Function to retrieve the desktop memory information
get_memory_info() {
    memory=$(free -h | awk '/^Mem:/ {print $2}')
    echo "Desktop memory: $memory"
}

# Function to retrieve the system serial number
get_serial_number() {
    serial=$(dmidecode -s system-serial-number)
    echo "Serial number: $serial"
}

# Function to retrieve the system IP address
get_system_ip() {
    ip=$(hostname -I | awk '{print $1}')
    echo "System IP: $ip"
}

# Function to retrieve the installed software information
get_installed_software() {
    software=$(dpkg-query -f '${Package}\n' -W)
    echo "Installed software:"
    echo "$software"
}

# Main script

# Create the system_info.txt file
echo "========================" > "/home/bigBrother/logs/system_info.txt"
echo "      SYSTEM INFO" >> "/home/bigBrother/logs/system_info.txt"
echo "========================" >> "/home/bigBrother/logs/system_info.txt"
echo >> "/home/bigBrother/logs/system_info.txt"

# Retrieve system information and append it to the file
get_processor_info >> "/home/bigBrother/logs/system_info.txt"
get_kernel_info >> "/home/bigBrother/logs/system_info.txt"
get_os_version >> "/home/bigBrother/logs/system_info.txt"
get_memory_info >> "/home/bigBrother/logs/system_info.txt"
get_serial_number >> "/home/bigBrother/logs/system_info.txt"
get_system_ip >> "/home/bigBrother/logs/system_info.txt"
echo "-------------------------" >> "/home/bigBrother/logs/system_info.txt"
echo >> "/home/bigBrother/logs/system_info.txt"
get_installed_software >> "/home/bigBrother/logs/system_info.txt"
echo >> "/home/bigBrother/logs/system_info.txt"
echo "========================" >> "/home/bigBrother/logs/system_info.txt"

