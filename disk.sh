#!/bin/bash

#Reads available disk space

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

exit 0
