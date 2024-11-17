#!/bin/bash


while true; do

	sleep 5

clear

#Check root permissions

	permissions=$(id -u)


	if [ $permissions -gt 0 ]; then


		echo "You need root permissions"

	elif [ $permissions -eq 0 ]; then

		echo "You have root permissions"

		hora=$(date +%H:%M)

		echo "hour:" $hora

#Check if the mount point exists

		if [ -d /mnt/finished ]; then

			echo "the mount point exists"

		else

			mkdir /mnt/finished


		fi

#Mount here and show with the terminal

		sudo mount tic.ieslasenia.org:/srv/nfs/finished-on-server /mnt/finished

		echo "The card present are:"

		ls -1 /mnt/finished


	fi

count=$(ls -1 /mnt/finished | cut -d " " -f1 | wc -l)

let res=48-count

if [ $res -gt 0 ]; then

    echo "you have $res gaps"

fi



done

exit 0
