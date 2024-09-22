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
if [[ ! -f Report_aggr.csv ]]; then
  echo "Date,Time,Hostname,Machine,Kernel_version,Total_Mem,Used_Mem,Free_Mem,Disk_space,IP_info,UpTime" > Report_aggr.csv 
fi

echo "$current_date,$current_time,$host_name,\"$cpu_info\",$kernel_version,$total_mem,$used_mem,$free_mem,$space_used,\"$ip_address\",$up_time" >> Report_aggr.csv
