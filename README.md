# sysmonitor

Simple Bash script for monitoring basic system metrics and logging results.

## Requirements
- Linux (tested on Debian / XFCE)
- Standard utilities: `bash`, `awk`, `sed`, `df`, `free`, `uptime`

## Features
- Displays system uptime
- Checks free RAM (MB)
- Checks root partition (`/`) usage and prints a warning if it exceeds 80%
- Automatically creates and overwrites `system.log` on every run

## Usage

Make the script executable and run it:

```bash
chmod +x check.sh
./check.sh