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



#Calculate CPU Usage from last time


#Store CPU Usage for next cycle


#Wait
	sleep 1
done 
