#!/bin/bash

user=$1
action=$2
path=$3

rc=0

truefalse=0


#Replenish

if [ $# -le 1 ]; then

        exit 1

fi

#/etc/passwd to have a list of all users

userList=$(cat /etc/passwd | cut -d ":" -f1 | grep $user) || rc=1


if [ $rc -eq 1 ]; then

        echo "User given not exist"
        action=0
fi

if [ $action = "replenish" ]; then


        mkdir /home/Workspace

        mkdir /home/Workspace/config
        touch /home/Workspace/config/sample.txt

        mkdir /home/Workspace/bin
        touch /home/Workspace/bin/sample.txt

        mkdir /home/Workspace/source
        touch /home/Workspace/source/sample.txt


        mkdir /home/Workspace/rsrc
        touch /home/Workspace/rsrc/sample.txt
        touch /home/Workspace/sample.txt

        echo "Directories created"

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
