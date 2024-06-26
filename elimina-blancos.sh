#!/bin/bash

# Hecho por Danny A. Calderon

# Esto es para sacar la fecha y el día de la semana
fecha=$(date +'%y%m%d')
dia=$(date +'%A')

# Este es el fichero el cual vamos a tratar
archivo=$1

# Si no se proporciona ningún archivo como argumento, se usa un nombre predeterminado
if [ $# -eq 0 ]; then
    archivo="ventas-$fecha-$dia.csv"
fi

# Asegúrate de que el archivo existe antes de intentar procesarlo
if [ ! -f "$archivo" ]; then
    echo "El archivo $archivo no existe :("
    exit 1
fi

# Usar un archivo temporal para almacenar la salida procesada
tempfile=$(mktemp)

	# Leer el archivo, reemplazar espacios con punto y coma, y escribir al archivo temporal
	while IFS= read -r linea; do
	    echo "$linea" | tr " " ";" >> "$tempfile"
	done < "$archivo"

# Reemplazar el archivo original con el archivo temporal
mv "$tempfile" "$archivo"

exit 0

