#!/bin/bash

#Comprobamos si la ip de este eqipo cosigue hacer ping

while true ; do

	ip=$(ip a | grep metric | cut -d " " -f6 | cut -d "/" -f1)

	sleep 1

	control=$(ping -c 1 10.0.2.3 | grep ", 0% packet loss" | wc -l)


	if [ $control = 1 ]; then

        echo "Funka"

#Si hubiera un erro en el ping mirariamos en el fichero arp.log

	elif [ $control = 0 ]; then

        	if [ -f arp.log ]; then


                	echo "Actualizando tu fichero arp ya que se encontró un error"

                	rm arp.log

                	wget http://tic.ieslasenia.org/arp.log

        	else

        		wget http://tic.ieslasenia.org/arp.log

                	echo "Se ha descargado el fichero arp por que se encontro un error"


		fi


		while true; do

			sleep 1

			cat arp.log | cut -d " " -f5 | while read lineas ; do


				echo $lineas > textinfo

        			info=$(cat textinfo)



                		if [ $palabra = $info ]; then


                        		echo "Error en las MAC"

                		fi

			done

        	done


	fi

done


exit 0
