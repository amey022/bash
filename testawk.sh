#!/bin/bash

##Name of Script##
echo $0

##User Information##
echo -e My user information is "\n" $(id) "\n"

##Print running directry##
echo -e My running directory is $(pwd) "\n"

echo ">>Uptime<<"
echo -e $(uptime) "\n"

echo ">>Top 5 Processes<<"
echo -e $(ps -ef | sort -rn | sed -n 1p | awk '{print $1,$2,$3,$8}')
echo -e $(ps -ef | sort -rn | sed -n 2p | awk '{print $1,$2,$3,$8}')
echo -e $(ps -ef | sort -rn | sed -n 3p | awk '{print $1,$2,$3,$8}')
echo -e $(ps -ef | sort -rn | sed -n 4p | awk '{print $1,$2,$3,$8}')
echo -e $(ps -ef | sort -rn | sed -n 5p | awk '{print $1,$2,$3,$8}')
echo -e $(ps -ef | sort -rn | sed -n 6p | awk '{print $1,$2,$3,$8}') "\n"

echo ">>Disk Space Utilization<<"
echo -e $(df -h | sed -n 1p | awk '{print $3,$4}')
echo -e $(df -h | grep centos | awk '{print $3,$4}') "\n"

echo ">>RAM Usage<<"
echo -e $(free -h | sed -n 1p | awk '{print $2,$3}')
echo -e $(free -h | grep Mem | awk '{print $3,$4}') "\n"

echo ">>Swap Usage<<"
echo -e $(free -h | sed -n 1p | awk '{print $2,$3}')
echo -e $(free -h | grep Swap | awk '{print $3,$4}') "\n"

echo ">>CPU Usage<<"
echo -e $(mpstat | sed -n 3p | awk '{print $3,$4,$5,$7,$13}')
echo -e $(mpstat | sed -n 4p | awk '{printf("%s %s %s...%s...%s\n",$3,$4,$5,$7,$13)}') "\n"

echo ">>Last Reboot<<"
echo -e $(who -b) "\n"
