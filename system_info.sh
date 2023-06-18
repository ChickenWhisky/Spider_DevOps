#!/bin/bash

directory="/home/bigBrother/logs/system_info.txt"

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

# Create the system_info.txt file
echo "========================" > $directory
echo "      SYSTEM INFO" >> $directory
echo "========================" >> $directory
echo >> $directory
get_processor_info >> $directory
get_kernel_info >> $directory
get_os_version >> $directory
get_memory_info >> $directory
get_serial_number >> $directory
get_system_ip >> $directory
echo "-------------------------" >> $directory
echo >> $directory
get_installed_software >> $directory
echo >> $directory
echo "========================" >> $directory

