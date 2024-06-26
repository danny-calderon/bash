#!/bin/bash

#Hecho por Danny Calderón

# Este es un shell script el cual su utilidad es pasarle un archivo medieante argumentos y el que el cual puedas contar las lineas y las palabras de cualquier fichero que le pases

#comprobamos que el usuario si pone argumentos
if [ $# -eq 0 ]; then

        echo "Escribe un argumento :)"
        exit 1

fi

cat $1 | tr "[a-z]" "[A-Z]"
