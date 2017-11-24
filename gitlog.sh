#!/bin/bash
##Script to keep log of all git commits for a repository


gitlog(){

echo "Please state which file you wish to commit"

read FNAME

git add $FNAME

echo "What message would you like for commit?"

read MSG

git commit -m "$MSG"

if [ -e log.txt ]; then

git push origin master 2>> log.txt

else

git push origin master 2> log.txt
 
fi
}


gitlog
