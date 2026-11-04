#!/bin/bash

# Configuration
LOG_FILE="system.log"

# System Metrics
USER_NAME=$(whoami)
CURRENT_DATE=$(date +%Y-%m-%d)
DISK_USAGE=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')
DISK_FREE=$(free -m | awk 'NR==2 {print $4}')
UPTIME_SYS=$(uptime -p)

# Initialize log file (overwrites previous log with a fresh header)
{
    echo "=========================================="
    echo " System Check Report: $CURRENT_DATE"
    echo "=========================================="
    echo "User: $USER_NAME"
    echo "Uptime: $UPTIME_SYS"
    echo "Disk Usage: ${DISK_USAGE}%"
    echo "Free RAM: ${DISK_FREE} MB"
    echo "------------------------------------------"

    # Status check
    if [ "$DISK_USAGE" -gt 80 ]; then
        echo "Status: ⚠️ WARNING - Disk is almost full!"
    else
        echo "Status: ✅ OK - Disk usage is normal."
    fi
    echo "=========================================="
} > "$LOG_FILE"

# Print the result to the terminal screen
cat "$LOG_FILE"
