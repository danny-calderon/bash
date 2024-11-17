#!/bin/bash


ataque=$1

defensa=$2

contador=0

#Un bucle que lo recorra de arriba a bajo
cat data.txt | sed -n 2,19p | cut -d "," -f1 | while read line; do

#Contador aprovechando que los tipos de pokemon estan en el mismo orden tanto en ataque como defensa
let contador=contador+1


if [ $line = $defensa ]; then

#Buscamos el numero en que se encuentra hacia bajo y este coincidirá con el horizontal


	let contador=contador+1

#Mostramos solo el campo que queremos y lo mostramos
	puntos=$(cat data.txt | sed -n 2,19p | grep -i $ataque | cut -d "," -f$contador)
	echo "Tu multiplicador fueron $puntos puntos"

fi


done


exit 0
