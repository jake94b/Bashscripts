#!/bin/bash
#Displays current CPU utilization

PREV_IDLE=0
PREV_TOTAL=0

while true; do

	#Get CPU Statistics
	CPU=(`sed -n 's/^cpu\s//p' /proc/stat`)
	IDLE=${CPU[3]} #Just idle time 

	
	#Calculate total CPU time
	TOTAL=0
	for VALUE in "${CPU[@]}"; do
		let "TOTAL=$TOTAL+$VALUE"
	don



#Calculate CPU Usage from last time
	let "DIFFIDLE=$IDLE-$PREV_IDLE"
  	let "DIFFTOTAL=$TOTAL-$PREV_TOTAL"
  	let "DIFFUSAGE=(1000*($DIFF_TOTAL-$DIFF_IDLE)/$DIFF_TOTAL+5)/10"
 echo -en "\rCPU: $DIFFUSAGE%  \b\b"

#Store CPU Usage for next cycle
PREV_IDLE="$IDLE"
PREV_TOTAL="$TOTAL"

#Wait
	sleep 1
done 
