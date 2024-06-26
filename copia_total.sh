#!/bin/bash
#
#Hecho por Danny A. Calderón

fecha=$(date +'%Y-%m-%d-%H')

#comprobamos que el fichero no esta repetido 
if [ ! -d /NOTICIA ]; then
	
	#en caso de no estar el fichero lo creamos
	mkdir /NOTICIA
fi

#hacemos una copia total en el escritorio
tar -cvzf /NOTICIA/backup-carles-$fecha.tar $HOME/Desktop/

exit 0
