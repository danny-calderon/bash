#!/bin/bash

forma1=$1
formaFin=$2

luna=$(( $RANDOM %5 + 1 ))


if [ $luna -eq 3 ]; then


	echo "Nuestra forma es Crinos"


elif [ $luna != 3 ]; then


	if [ $forma1 = humano ] && [ $formaFin != humano ]; then

		echo "Cambiando de HUMANO a GLABRO"
		forma1=glabro
		sleep 3
	fi

	if [ $forma1 = glabro ] && [ $formaFin != glabro ]; then

		echo "Cambiando de GLABRO a CRINOS"
		forma1=crinos
		sleep 5
	fi

	if [ $forma1 = crinos ] && [ $formaFin != crinos ]; then

                echo "Cambiando de CRINOS a HISPO"
		forma1=hispo
		sleep 4
        fi

	if [ $forma1 = hispo ] && [ $formaFin != lupus ]; then

                echo "Cambiando de HISPO a LUPUS"
		forma1=lupus
		sleep 1
        fi

	if [ $forma1 = lupus ] && [ $formaFin != lupus ]; then

		echo "Cambiando de LUPUS a HUMANO"
		forma1=humano
		sleep 2

	fi

fi

exit 0
