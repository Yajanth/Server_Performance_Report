#!/bin/bash

#Server Status Report

#Get Systems Date and Time
current_date=$(date "+%d/%m/%y")
current_time=$(date "+%H:%M:%S")

#Get Systems hostname
host_name=$(hostname)

#Os and machine info
machine=$(uname -m)
kernel_version=$(uname -r)

#get CPU info
cpu_info=$(lscpu | grep "Model name:" | awk '{for (i=3; i<=NF; i++) printf $i " "; print ""}')

#get Memory info
total_mem=$(free -h | grep "Mem:" | awk '{print $2}')
used_mem=$(free -h | grep "Mem:" | awk '{print $3}')
free_mem=$(free -h | grep "Mem:" | awk '{print $4}')

#get disk Usage
space_used=$(df -h| grep "/dev/nvme0n1p7" | awk '{print $3}')

#get network interface details
ip_address=$(ip -o -4 addr show | awk '{print $2 ":" $4}')

#get server uptime
up_time=$(uptime -p | awk '{printf $2 ":" $4 "hr" }') 

#Generating the Report
#check if the file exists
if [[ ! -f Report_aggr.csv ]]; then
  echo "Date,Time,Hostname,Machine,Kernel_version,Total_Mem,Used_Mem,Free_Mem,Disk_space,IP_info,UpTime" > Report_aggr.csv 
fi

#Append the report to the aggregrator
echo "$current_date,$current_time,$host_name,\"$cpu_info\",$kernel_version,$total_mem,$used_mem,$free_mem,$space_used,\"$ip_address\",$up_time" >> Report_aggr.csv


#Print the report
echo "-----------------------------------"
echo "    System Information Report      "
echo "-----------------------------------"
echo "Report Generated: $current_date"
echo
echo "Hostname: $host_name"
echo
echo "Operating System Information: $(uname) "
echo
echo "Kernel Version: $kernel_version"
echo
echo "CPU Information: $cpu_info"
echo
echo "Total RAM: $total_mem"
echo "Used RAM: $used_mem"
echo "Free RAM: $free_mem"
echo
echo "Disk Usage (Root Partition): $space_used"
echo
echo "Network Interfaces and IP Addresses:"
echo "$ip_address"
echo
echo "System Uptime: $up_time"
echo "-----------------------------------"


