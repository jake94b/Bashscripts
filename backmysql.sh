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


