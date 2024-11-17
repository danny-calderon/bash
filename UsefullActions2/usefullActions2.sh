#!/bin/bash

#Say to the user to put tree arguments


if [ $# -gt 3 ]; then

        echo "You can't put more than 3 arguments"

        exit 1
elif [ $# -lt 2 ]; then

        echo "You have to put 2 or 3 arguments"

	exit 1

fi


user=$1

action=$2

path=$3

truefalse=0

date=$(date +%Y-%m-%d-%H:%M)




#/etc/passwd to have a list of all users

rc=0


userList=$(cat /etc/passwd | cut -d ":" -f1 | grep $user) || rc=1


if [ $rc -eq 1 ]; then

        echo "Error-User given not exist"

        action=0
fi

#Replenish

if [ $action = "replenish" ]; then


        mkdir /home/SolarSystem
	mkdir /home/SolarSystem/Mercury
	mkdir /home/SolarSystem/Venus
	mkdir /home/SolarSystem/Mars
	mkdir /home/SolarSystem/Jupiter
	mkdir /home/SolarSystem/Saturn
	mkdir /home/SolarSystem/Uranus
	mkdir /home/SolarSystem/Neptune

        touch /home/SolarSystem/Mercury/control-planet.txt
        touch /home/SolarSystem/Venus/control-planet.txt
        touch /home/SolarSystem/Mars/control-planet.txt
        touch /home/SolarSystem/Jupiter/control-planet.txt
        touch /home/SolarSystem/Saturn/Environment-$user-$date.txt
        touch /home/SolarSystem/Uranus/control-planet.txt
        touch /home/SolarSystem/Neptune/control-planet.txt


        echo "Directories created"

	echo $user-$date > /home/SolarSystem/Mercury/control-planet.txt
        echo $user-$date > /home/SolarSystem/Venus/control-planet.txt
        echo $user-$date > /home/SolarSystem/Mars/control-planet.txt
        echo $user-$date > /home/SolarSystem/Jupiter/control-planet.txt
        echo $user-$date > /home/SolarSystem/Saturn/Environment-$user-$date.txt
        echo $user-$date > /home/SolarSystem/Uranus/control-planet.txt
        echo $user-$date > /home/SolarSystem/Neptune/control-planet.txt

	echo $path
fi

#Clean

if [ $action = "clean" ]; then


if [ $# -le 2 ]; then

        echo "You need 3 arguments"



if [ -d $path ]; then

        echo "Es una ruta valida, vamos a borrarla"

        rm -r $path

        sleep1

        echo "Ruta borrada"

elif [ -f $path ]; then

        echo "Es una ruta valida, vamos a borrarla"

        rm $path

        sleep1

        echo "Ruta borrada"


fi

fi

fi

#Test


if [ $action = "test" ]; then

if [ $# -le 2 ]; then

        echo "You need 3 arguments"



fi

if [ -d $path ]; then

#Test -r to test reading permissions

	test -r $path || truefalse=1


	if [ $truefalse -eq 0 ]; then

		echo "$user has reading permissions"

	else

		echo "User not have reading permission"

	fi


else

        echo "The path given not exists"

fi

fi

exit 0
