#!/bin/bash
#
#Hecho Danny A. Calderon

# Este es un shell script el cual su utilidad es pasarle un archivo medieante argumentos y el que el cual puedas contar las lineas y las palabras de cualquier fichero que le pases

if [ $# -eq 0 ]; then
	
	echo "Escribe un argumento :)"
	exit 1

fi

echo "palabras del fichero:" | cat $1 | wc -c
echo "lineas del fichero:" | cat $1 | wc -l

exit 0
