#!/bin/bash
##Script to keep log of all git commits for a repository


gitlog(){

echo "Please state which file you wish to commit"

read FNAME

git add $FNAME

echo "What message would you like for commit?"

read MSG

if [ -e log.txt ]; then

echo "----------`date`---------"

git commit -m "$MSG" 2>> log.txt

git push origin master 2>> log.txt

echo "----------------------------------------"

else

echo "----------`date`----------"

git commit -m "$MSG" 2>> log.txt

git push origin master 2>> log.txt

echo "---------------------------------------"


fi
}


gitlog
