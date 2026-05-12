#!/bin/sh
# quick system info
OS=$(uname -s)
KERNEL=$(uname -r)
HOSTNAME=$(hostname)
UPTIME=$(uptime -p 2>/dev/null || uptime)
CPU=$(grep -m1 'model name' /proc/cpuinfo 2>/dev/null | cut -d: -f2 | sed 's/^ //' || sysctl -n machdep.cpu.brand_string 2>/dev/null)
MEM_TOTAL=$(grep MemTotal /proc/meminfo 2>/dev/null | awk '{printf "%.0f MB", $2/1024}')
MEM_FREE=$(grep MemAvailable /proc/meminfo 2>/dev/null | awk '{printf "%.0f MB", $2/1024}')

printf '\033[38;5;208m▐▛███▜▌\033[0m  \033[1m%s\033[0m@\033[1m%s\033[0m\n' "$(whoami)" "$HOSTNAME"
printf '\033[38;5;208m▝▜█████▛\033[0m  OS:     %s %s\n' "$OS" "$KERNEL"
printf '\033[38;5;208m  ▘▘ ▝▝\033[0m  CPU:    %s\n' "$CPU"
printf '           MEM:    %s / %s\n' "${MEM_FREE:-N/A}" "${MEM_TOTAL:-N/A}"
printf '           UPTIME: %s\n' "$UPTIME"
