#!/usr/bin/bash

dir=$1
backupdir=$2
interval=$3
max_backups=$4


if [ $# -ne 4 ]
then
	echo "Please make sure to write the 4 parameters"
	exit 1
	
elif ! [[ "$interval" =~ ^[0-9]+$ ]]
then
	echo "Please make sure to write a correct interval in seconds "
	exit 1
	
elif ! [[ "$max_backups" =~ ^[0-9]+$ ]]
then
	echo "Please make sure to write a correct number of maximum backups "
	exit 1
	
elif [ $(find ./$dir 2>/dev/null | wc -l) -eq 0 ]
then
	echo "Please make sure to write a correct source directory"
	exit 1
fi

#get initial directory info
lastinfo=$(ls -lR $dir)
echo $lastinfo > directory-info.last


#copy the source to destination
currentdate=$(date -r $dir +"%y-%m-%d-%H-%M-%S")
#echo "Last modification date: $currentdate"
cp -r $dir $backupdir/$currentdate


while (true)
do
	sleep $interval
	newinfo=$(ls -lR $dir)
	echo $newinfo > directory-info.new
	
	currentdate=$(date -r $dir +"%y-%m-%d-%H-%M-%S")
	echo "Last modification date: $currentdate"

	if ! cmp -s directory-info.new directory-info.last
	then
			
		currentdate=$(date -r $dir +"%y-%m-%d-%H-%M-%S")
		cp -r $dir $backupdir/$currentdate
		lastinfo=$(ls -lR $dir)
		echo $lastinfo > directory-info.last
		
		lines=$(ls -1 $backupdir| wc -l)
		l=$( expr $lines - $max_backups ) #get number of folders that exceeds the max_backup limit
		
		
		#check if the backups exceed the limit
		if [ $lines -gt $max_backups ]
		then
			op=$(ls -1 $backupdir | head -n $l )
			while read line
			do
				rm -rf "$backupdir/$line"
			done <<< $op
		fi
	fi
	
done	
	
	
	
	
	
	
	
