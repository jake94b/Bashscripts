#!/bin/bash
##Basic script to optimize battery life of laptop by turning off non-essential services

if [[ $EUID -ne 0 ]]; then
	echo "This must be run as root"
		exit 1
fi

nmcli radio status | grep 'enabled' &> /dev/null
if [ $? == 0 ]; then
   nmcli radio wifi off
fi


