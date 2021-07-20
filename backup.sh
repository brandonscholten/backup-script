#!/bin/bash
#This script is a backup utility for the /etc directory.
#First the script prints a welcome message.
#Second the script asks the user whether they want to backup files
export backupPath='/etc_backup' #change this variable to your backup location
#Next the script asks the user whether they want to sort file names in the log
#script proceeds based on previous user input
echo 'This script will backup the /etc directory.'
read -p 'Would you like to backup files? [y/n]:' backup
read -p 'Would you like to sort file names in the log? [y/n]:' sortNames
#creating log of filenames
echo writing log...
if [ $sortNames = 'y' ]
then
	ls -la /etc | sort > log.txt
elif [ $sortNames = 'n' ]
then
	ls -la /etc > log.txt
else
	echo Please enter a valid option!
fi
#backing up files
echo copying files...
if [ $backup = 'y' ]
then
	sudo cp -R /etc $backupPath
fi
echo done.
echo log:
cat log.txt
exit 0
