#!/bin/bash


path=$1


if [ $# != 1 ]; then

echo "Only one argument!"

exit 1

fi

rc=0

echo $path | grep ^/ || rc=1

if [ $rc -eq 0 ]; then

	echo "This is not a relative path"


else

        echo "This is a relative path"


fi


exit 0
