#!/bin/bash
##Shows disk space usage by group


#If a list of volume groups is provided, use those
#Otherwise, list all volume group disk usage
VGS=$@
[ -z "$VGS" ] && {
    #Tests if being run as root
        [ "$EUID" -eq 0 ] || {
            echo "Please run this as root"
            exit 1
}
    #Retrieve all volume groups
    $VGS=$(vgs --noheadings | awk '{print $1}' )


   TMPFILE=$(mktemp --suffix -$(basename $0)) 
    
for VG in $VGS
    do
        #Retrieve disk size in KB, stores in POSIX format
        KB =$(df -kP | grep ${VG}- | awk '{sum+=$3} END{printf("%d\n",sum)}')
        
        #convert to MB, GB, maybe Tb I dunno
        MB = $(echo $KB/1024 | bc -l | sed -e  "s/\(\.[0-9]\).*/\1/g")
        GB = $(echo $MB/1024 | bc -l | sed -e  "s/\(\.[0-9]\).*/\1/g")
        TB = $(echo $GB/1024 | bc -l | sed -e  "s/\(\.[0-9]\).*/\1/g")

done
