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
done
