#!/bin/bash

version="1.0.0"


if [ "$1" = "--version" ] || [ "$1" = "-v" ]; 
then
	echo "syspeek version $version"
 exit 0
fi






host=$(hostname)
kernel=$(uname -r)
cpu=$(nproc)
time_up=$(uptime -p)

source /etc/os-release
os=$PRETTY_NAME






ram=$(free -h | grep "Mem:" | awk '{print $3 " / " $2}')

disk=$(df -h | grep -w "/" | awk '{print $3 " / " $2}')

ip_addr=$(hostname -I | awk '{print $1}')

interface=$(ip route | grep "default" | awk '{print $5}')


procs=$(ps -e | wc -l)

echo "========================"
echo "       syspeek"
echo "========================"


echo ""

echo -e "host:\t\t$host"
echo -e "os:\t\t$os"
echo -e "kernel:\t\t$kernel"
echo -e "uptime:\t\t$time_up"
echo ""
echo -e "cpu:\t\t$cpu cores"
echo -e "ram:\t\t$ram"
echo -e "disk:\t\t$disk"
echo ""
echo -e "ip:\t\t$ip_addr"
echo -e "interface:\t$interface"
echo ""
echo -e "processes:\t$procs"
