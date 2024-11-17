#!/bin/bash

param=$1


#Say to the user to put one argument

if [ $# -gt 1 ]; then

	echo "ONLY ONE ARGUMENT"

	exit 1

elif [ $# -lt 1 ]; then

	echo "USE ARGUMENTS"

	exit 1

fi

if [ $param = "clean" ]; then

	if [ -d "$HOME/Friday-for-Friday" ]; then

		rm -r $HOME/Friday-for-Friday
		exit 0
	fi

fi




if [ $param = "start" ]; then

	mkdir $HOME/Friday-for-Friday
	date +%H:%M-%d/%m/%Y > $HOME/Friday-for-Friday/time-friday-start.tkn

	touch $HOME/Friday-for-Friday/statistics

	date +%Mm-%Ss-start >> $HOME/Friday-for-Friday/statistics

exit 0


fi


if [ $param = "green" ]; then


	if [ -d "$HOME/Friday-for-Friday" ]; then


	mkdir -p $HOME/Friday-for-Friday/Green-Level
	date +%H:%M-%d/%m/%Y > $HOME/Friday-for-Friday/Green-Level/time-friday-green.tkn


	date +%Mm-%Ss-green >> $HOME/Friday-for-Friday/statistics
		exit 0


	else

		echo "First start"

	exit 0

	fi
fi

if [ $param = "yellow" ]; then


	if [ -d $HOME/Friday-for-Friday/Green-Level ]; then


        	mkdir -p $HOME/Friday-for-Friday/Yellow-Level
        	date +%H:%M-%d/%m/%Y > $HOME/Friday-for-Friday/Yellow-Level/time-friday-Yellow.tkn

		date +%Mm-%Ss-yellow >> $HOME/Friday-for-Friday/statistics

	exit 0

	else

	echo "First  pass green level"

	exit 0

	fi

fi

if [ $param = "red" ]; then

	if [ -d $HOME/Friday-for-Friday/Yellow-Level ]; then


                mkdir -p $HOME/Friday-for-Friday/Red-Level
                date +%H:%M-%d/%m/%Y > $HOME/Friday-for-Friday/Red-Level/time-friday-Red.tkn

		date +%Mm-%Ss-red >> $HOME/Friday-for-Friday/statistics
	exit 0

	else

        echo "First pass yellow level"

	exit 0

	fi

fi

if [ $param = "pirate" ]; then


	if [ -d $HOME/Friday-for-Friday/Red-Level ]; then


                mkdir -p $HOME/Friday-for-Friday/PIRATES
                date +%H:%M-%d/%m/%Y > $HOME/Friday-for-Friday/PIRATES/time-friday-Pirates.tkn

		date +%Mm-%Ss-pirate >> $HOME/Friday-for-Friday/statistics

		exit 0


	else

        echo "Firs pass red level"
	exit 0
	fi

fi

if [ $param = "end" ]; then

	if [ -d $HOME/Friday-for-Friday/PIRATES ]; then

		mkdir -p $HOME/Friday-for-Friday/END

		date +%H:%M-%d/%m/%Y > $HOME/Friday-for-Friday/END/end-time

		date +%Mm-%Ss-end >> $HOME/Friday-for-Friday/statistics
	else

		echo "First pass pirate level"

	fi

fi

if [ $param = "statistics" ]; then


cat $HOME/Friday-for-Friday/statistics

fi

exit 0
