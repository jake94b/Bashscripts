#!/bin/bash
##Script to perform backup of home folder

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

TIME=`date +%b-%d-%y`
FNAME=backup-$TIME.tar.gz
echo Please specify the directory you would like to back up
read $SRCNAME
echo Please specify where you would like to direct backup to
read $DESTNAME
tar -cvpzf $DESTNAME/$FNAME $SRCNAME

