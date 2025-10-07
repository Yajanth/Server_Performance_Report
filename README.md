# 🖥️ Server Status Report Script

A lightweight **Bash script** that generates a detailed **system status report** including CPU, memory, disk usage, network details, uptime, and more.  
It saves each report entry to a CSV file (`Report_aggr.csv`) for historical tracking and analysis — perfect for system administrators, DevOps engineers, and anyone managing Linux servers.

---

## 📋 Features

✅ Generates a snapshot of key system metrics:
- Current **date and time**
- **Hostname** and **machine architecture**
- **Kernel version**
- **CPU model**
- **Memory** (total, used, free)
- **Disk usage** (for specified partition)
- **Network interfaces and IPs**
- **Server uptime**

✅ Automatically logs all reports to a CSV file (`Report_aggr.csv`)  
✅ Displays a clean, human-readable report in the terminal  
✅ Works on most **Linux distributions** (Ubuntu, Debian, CentOS, etc.)

---

## 🧰 Requirements

- Linux or Unix-based system  
- Bash shell  
- Common command-line tools:
  ```bash
  lscpu, free, df, ip, uptime, awk, grep


##💡 Use Cases

- 🧾 Daily System Health Check: Automate the script via cron to log daily system stats.

- 🧠 Performance Monitoring: Track memory and disk usage over time for trend analysis.

- 🛠️ Server Maintenance Reports: Generate a quick status summary before and after server updates.

- 📦 DevOps Automation: Integrate with CI/CD pipelines or monitoring scripts to record environment metrics.

- ☁️ Multi-server Management: Deploy across multiple servers to collect and aggregate CSV reports centrally.
