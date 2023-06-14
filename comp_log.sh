#!/bin/bash

# Function to write a section heading to the log file
write_heading() {
    echo "==============================" >> /home/bigBrother/logs/comp_log.txt
    echo "        COMPUTER LOG" >> /home/bigBrother/logs/comp_log.txt
    echo "==============================" >> /home/bigBrother/logs/comp_log.txt
    echo >> /home/bigBrother/logs/comp_log.txt
}

# Function to write system uptime to the log file
write_uptime() {
    uptime >> /home/bigBrother/logs/comp_log.txt
    echo >> /home/bigBrother/logs/comp_log.txt
}

# Function to write disk and memory usage to the log file
write_disk_memory_usage() {
    df -h >> /home/bigBrother/logs/comp_log.txt
    echo >> /home/bigBrother/logs/comp_log.txt
    free -h >> /home/bigBrother/logs/comp_log.txt
    echo >> /home/bigBrother/logs/comp_log.txt
}

write_utilization_processes() {
    top -b -n 1 | head -n 20 >> /home/bigBrother/logs/comp_log.txt
    echo >> /home/bigBrother/logs/comp_log.txt
}

write_open_tcp_ports() {
    netstat -tuln | grep 'tcp' >> /home/bigBrother/logs/comp_log.txt
    echo >> /home/bigBrother/logs/comp_log.txt
}

write_current_connections() {
    netstat -ant | awk '{print $5}' | grep -v 'Address' | awk -F: '{print $1}' | sort | uniq -c | sort -nr >> /home/bigBrother/logs/comp_log.txt
    echo >> /home/bigBrother/logs/comp_log.txt
}

write_running_processes() {
    ps aux >> /home/bigBrother/logs/comp_log.txt
    echo >> /home/bigBrother/logs/comp_log.txt
}

write_heading 
write_uptime
echo "Disk and memory usage :">> /home/bigBrother/logs/comp_log.txt
write_disk_memory_usage
echo "Utilization and most expensive processes :">> /home/bigBrother/logs/comp_log.txt
write_utilization_processes
echo "Open TCP ports :">> /home/bigBrother/logs/comp_log.txt
write_open_tcp_ports
echo "Current connections :">> /home/bigBrother/logs/comp_log.txt
write_current_connections
echo "Processes : " >> /home/bigBrother/logs/comp_log.txt
write_running_processes
echo "==============================" >> /home/bigBrother/logs/comp_log.txt
