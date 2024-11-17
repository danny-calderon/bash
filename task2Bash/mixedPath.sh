#!/bin/bash
#Alvaro Pardo Peralta

path=$1

#Check if we have only one argument

if [ $# != 1 ]; then

echo "Only one argument!"

exit 1

fi

#Check if the directory and the file exists

if [ -d $path ]; then

	echo "Is a directory and exists"


elif [ -f $path ]; then


	echo "Is a file and exists"

else

	echo "The directory/file not exsists"


fi


rc=0


echo $path | grep ^/ || rc=1

#Check if there are absolute or relative paths

if [ $rc -eq 0 ]; then

        echo "This is an absolute path"


else

        echo "This is a relative path"


fi

#Check write, read and execute permissions

rc2=0

ls -l $path | cut -d " " -f1 | grep "r" || rc2=1

if [ $rc2 -eq 0 ]; then

	echo "Read permissions: Yes"

else

	echo "Read permissions: No"

fi

rc2=0

ls -l $path | cut -d " " -f1 | grep "w" || rc2=1

if [ $rc2 -eq 0 ]; then

        echo "Write permissions: Yes"

else

        echo "Write permissions: No"

fi

rc2=0

ls -l $path | cut -d " " -f1 | grep "x" || rc2=1


if [ $rc2 -eq 0 ]; then

        echo "Executing permissions: Yes"

else

        echo "Executing permissions: No"

fi




exit 0
