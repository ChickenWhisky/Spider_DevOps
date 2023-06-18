#!/bin/bash

directory="/home/bigBrother/logs/comp_log.txt"

# Function to write a section heading to the log file
write_heading() {
    echo "==============================" >> $directory
    echo "        COMPUTER LOG" >> $directory
    echo "==============================" >> $directory
    echo >> $directory
}

# Function to write system uptime to the log file
write_uptime() {
    uptime >> $directory
    echo >> $directory
}

# Function to write disk and memory usage to the log file
write_disk_memory_usage() {
    echo "Disk and memory usage :">> $directory
    df -h >> $directory
    echo >> $directory
    free -h >> $directory
    echo >> $directory
}

# Function to write processes utilisation of reources to the log file
write_utilization_processes() {
    echo "Utilization and most expensive processes :">> $directory
    top -b -n 1 | head -n 20 >> $directory
    echo >> $directory
}

#Fnctions to write Open TCP ports to the log file
write_open_tcp_ports() {
    echo "Open TCP ports :">> $directory
    netstat -tuln | grep 'tcp' >> $directory
    echo >> $directory
}

#Functions to write current connections to the log file
write_current_connections() {
    echo "Current connections :">> $directory
    netstat -ant | awk '{print $5}' | grep -v 'Address' | awk -F: '{print $1}' | sort | uniq -c | sort -nr >> $directory
    echo >> $directory
}

#Functions to write running processes to the log file
write_running_processes() {
    echo "Processes : " >> $directory
    ps aux >> $directory
    echo >> $directory
}


#Creates the Script 

write_heading 
write_uptime
write_disk_memory_usage
write_utilization_processes
write_open_tcp_ports
write_current_connections
write_running_processes
echo "==============================" >> $directory
