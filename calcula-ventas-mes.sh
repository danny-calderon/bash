#!/bin/bash

#Hecho por Danny A. Calderón

#sacamos el año y el mes
fecha=$(date +'%y%m')

for archivo in ventas-$fecha* ; do

	if [ -f $archivo ]; then

		tail -n +2 $archivo |while IFS=";" read -r fecha producto vendedor cantidad; do
	
			echo $vendedor "	" $cantidad  >> ventas-Mes.txt

		done 
	fi
done

sort ventas-Mes.txt -o ventas-Mes.txt

exit 0
