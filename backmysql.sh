#!/bin/bash
##Script to backup MySQL databases
##Script will lst each database on a server
##And place them on their own compressed file

MYSQL="/usr/bin/mysql"
MYSQLDUMP="/usr/bin/mysqldump"
BZIP2="/usr/bin/bzip2"

#Compression Level
CLVL="-9"


BACKDIR="/home/backup/mysql"


DB_SERV="127.0.0.1"
SERV_NAME="$(hostname)"

USR="root"

##Will need to input password
PASSWD=" "

YR="$(date+"%Y")"
MNTH="$(date+"%M")"
DY="$(date+"%D")"

BACKDIR="$BACKDIR/$YR"


#Makes the Backup directory if it does not exist
if [! -d $BACKDIR ]; then
	/bin/mkdir $BACKDIR
fi

if [! -w $BACKDIR }; then
	#Todo: Make sure directory is accessible
fi


