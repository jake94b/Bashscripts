#!/bin/bash
##Script to perform backup of home folder

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

temp="/tmp/available.$$"

trap "rm -f $temp" EXIT

cat << 'EOF' >$temp
    { sum += $4 }
    
END {mb = sum / 1024
     gb = mb / 1024
     printf "%.0f MB (%.2fGB) of available disk space\n" , mb, gb
    }
EOF

df -k | awk -f $temp

echo $gb
TIME=`date +%b-%d-%y`
FNAME=backup-$TIME.tar.gz
echo Please specify the directory you would like to back up
read $SRCNAME
SRCSIZE="$(du -sh $SRCNAME | cut -f 1)"
if 
echo Please specify where you would like to direct backup to
read $DESTNAME
tar -cvpzf $DESTNAME/$FNAME $SRCNAME

