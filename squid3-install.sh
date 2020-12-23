#!/bin/bash

# Squid Installer
# Author: https://blog.hostonnet.com
# Email: admin@hostonnet.com
# Github: https://github.com/HostOnNet/squid-proxy-installer

USERNAME = "squser"
PASSWORD = "user#123456"
PORT = "user#123456"

red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`
ip="$(dig +short myip.opendns.com @resolver1.opendns.com)"

if cat /etc/os-release | grep PRETTY_NAME | grep "Ubuntu 16.04"; then
    /usr/bin/apt update
    /usr/bin/apt -y install apache2-utils squid3
    touch /etc/squid/passwd
    /bin/rm -f /etc/squid/squid.conf
    /usr/bin/touch /etc/squid/blacklist.acl
    /usr/bin/wget --no-check-certificate -O /etc/squid/squid.conf https://raw.githubusercontent.com/andreybrigunet/squid-proxy-installer/master/squid.conf
    /sbin/iptables -I INPUT -p tcp --dport $PORT -j ACCEPT
    /sbin/iptables-save
    service squid restart
    update-rc.d squid defaults

    /usr/bin/htpasswd -b -c /etc/squid/passwd $USERNAME $PASSWORD

    echo ""  | tee -a /etc/sysctl.conf
    echo "net.ipv4.icmp_echo_ignore_all = 1"  | tee -a /etc/sysctl.conf

    sysctl -p

    echo ""
    echo "Proxy address: ${green}${USERNAME}:${PASSWORD}@${ip}:${PORT}${reset}"

else
    echo "OS NOT SUPPORTED. Contact admin@hostonnet.com to add support for your OS"
    exit 1;
fi


