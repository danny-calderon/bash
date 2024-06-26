#!/bin/bash

#Hecho por Danny A. Calderon

#usamos el date para conseguir el año
fecha=$(date +'%Y')
fecha_anterior=$(date -d "last year" +'%Y')
#hacemos un contador
cont=0

#donde esta el archivo usamos una ruta relativa
archivo="alumno.csv"

#si el archivo existe lo borramos asi si se repite un alumno lo vuelve a poner, se va actualizando 
if [ -f "FP_$fecha-$fecha_anterior.txt" ]; then

    	rm "FP_$fecha-$fecha_anterior.txt"

fi

#el tail es para que no coga la primera linea
tail -n +2 $archivo | while IFS=',' read -r matricula nombre apellido curso nota poblacion; do

	if [ $nota -ge 50  ]; then

		#lo metemos en el archivo ...
		echo $nombre" "$apellido" "$curso >> FP_$fecha-$fecha_anterior.txt		

		#le sumamos 1 al contador 
		cont=$((cont+1))
	fi

done

echo "el numero de alumnos a los cuales hay que premiar son:" $cont

#usamos e sort para ordenar el fichero en orden alfabetico 
sort FP_$fecha-$fecha_anterior.txt -o FP_$fecha-$fecha_anterior.txt

exit 0
