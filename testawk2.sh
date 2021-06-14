#!/bin/bash

ram=$(free -h | grep Mem | awk '{print $3}' | cut -f 1 -d "M")
df=$(df -h | grep centos-root | awk '{print $5}' | cut -f 1 -d "%")
cpu=$(uptime | awk '{print $10}')
cpu2=${cpu%.*}

##Name of Script##
echo $0

##User Information##
echo -e My user information is "\n" $(id) "\n"

##Print running directry##
echo -e My running directory is $(pwd) "\n"

echo ">>Uptime<<"
echo -e $(uptime) "\n"

if [[ $cpu2 -ge 10 ]]; then
  echo "CPU IS AT MAX CAPACITY! WARNING! FIX NOW!"
else
  echo "CPU in optimal condition."
fi

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

if [[ $df -eq 100  ]]; then
  echo "The root volume is full"
elif [[  $df -ge 75 && $df -le 99  ]]; then
  echo "The root volume is almost full"
elif [[  $df -ge 50 && $df -le 74  ]]; then
  echo "The root volume is at medium capacity"
else
  echo "The root volume is less than 49% capacity"
fi

echo ">>RAM Usage<<"
echo -e $(free -h | sed -n 1p | awk '{print $2,$3}')
echo -e $(free -h | grep Mem | awk '{print $3,$4}') "\n"

if [[ $ram -eq 990 ]]; then
  echo "The RAM is full"
elif [[ $ram -ge 694 && $ram -le 989 ]]; then
  echo "The RAM Utilization is almost full"
elif [[ $ram -ge 495 && $ram -le 693 ]]; then
  echo "The RAM is between 50% and 70%"
else
  echo "The RAM Utilization is perfect!"
fi

echo ">>Swap Usage<<"
echo -e $(free -h | sed -n 1p | awk '{print $2,$3}')
echo -e $(free -h | grep Swap | awk '{print $3,$4}') "\n"

echo ">>CPU Usage<<"
echo -e $(mpstat | sed -n 3p | awk '{print $3,$4,$5,$7,$13}')
echo -e $(mpstat | sed -n 4p | awk '{printf("%s %s %s...%s...%s\n",$3,$4,$5,$7,$13)}') "\n"

echo ">>Last Reboot<<"
echo -e $(who -b) "\n"
