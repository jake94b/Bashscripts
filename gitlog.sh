#!/bin/bash
##Script to keep log of all git commits for a repository

git add .
read -p "Commit Description: " desc 
git commit -m "$desc"
echo `date` 2>>log.txt
git push origin master 2>> log.txt
