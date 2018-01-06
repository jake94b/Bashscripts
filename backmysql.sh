#!/bin/bash
##Script to backup MySQL databases
##Script will lst each database on a server
##And place them on their own compressed file

MYSQL="/usr/bin/mysql"
MYSQLDUMP="/usr/bin/mysqldump"
BZIP2="/usr/bin/bzip2"


##Compression Level
CLVL="-9"

BE_NICE=1


NLVL=10

BACKDIR="/home/backup/mysql"


DB_SERV="127.0.0.1"
SERV_NAME="$(hostname)"

USR="root"

##Will need to input password
PASSWD=" "

YR="$(date+"%Y")"
MNTH="$(date+"%M")"
DY="$(date+"%D")"

DATE="$YR$MNTH$DY"

BACKDIR="$BACKDIR/$YR"


#Makes the Backup directory if it does not exist
if [! -d $BACKDIR ]; then
	/bin/mkdir $BACKDIR
fi

if [! -w $BACKDIR }; then
	/bin/chown mysql:mysql $BACKDIR
	/bin/chmod 755 $BACKDIR
fi

BACKDIR="$BACKDIR/$MNTH"

if [! -d $BACKDIR ]; then
	/bin/mkdir $BACKDIR
fi

if [! -w $BACKDIR }; then
	/bin/chown mysql:mysql $BACKDIR
	/bin/chmod 755 $BACKDIR
fi

cd $BACKDIR

#Construct the date variable
DATE="$YR$MNTH$DY"


##Get list of databases
DBS= "$($MYSQL -h $DB_SRVR --user=$USR --password=$PASSWD --silent --batch --execute='show databases')" 

for db in $DBS
	 FILE="$db.$DB_SRVR_NAME.$DATE.sql"
	 
	 $MYSQLDUMP --opt -h $DB_SRVR --user=$USER --password=$PASSWD $db > $FILE
	
	 if [ $BE_NICE -eq 1 ]; then
	    $NICE -$NLVL $BZIP2 $CLVL $FILE
	 else
	    $BZIP2 $CLVL $FILE
	 fi
done


done
