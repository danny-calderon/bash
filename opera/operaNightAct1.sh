#!/bin/bash

#ACT I: Overture

echo "Bienvenido al acto 1"

if [ -d /srv/sox ]; then

rm -r /srv/sox

fi

mkdir /srv/sox
mkdir /srv/sox/TheGreatGateOfKiev
mkdir /srv/sox/BlueDanube
mkdir /srv/sox/NewWorldSyphonie
mkdir /srv/sox/TheJazzSuite


cat txts | while read line; do

touch /srv/sox/TheGreatGateOfKiev/$line.txt
touch /srv/sox/BlueDanube/$line.txt
touch /srv/sox/NewWorldSyphonie/$line.txt
touch /srv/sox/TheJazzSuite/$line.txt

echo $line > /srv/sox/TheGreatGateOfKiev/$line.txt
echo $line > /srv/sox/BlueDanube/$line.txt
echo $line > /srv/sox/NewWorldSyphonie/$line.txt
echo $line > /srv/sox/TheJazzSuite/$line.txt



chmod 640 /srv/sox/TheGreatGateOfKiev/$line.txt
chmod 640 /srv/sox/BlueDanube/$line.txt
chmod 640 /srv/sox/NewWorldSyphonie/$line.txt
chmod 640 /srv/sox/TheJazzSuite/$line.txt

done


exit 0
