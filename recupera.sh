#!/bin/bash

# Hecho por Danny A. Calderón

for archivo in /BACKUPS/*.tar; do
    # Extraer el archivo tar en el directorio /GASOLINERA/RECUPERA
    tar -xzvf "$archivo" -C /GASOLINERA/RECUPERA
done

# Mostrar la estructura de directorios en /GASOLINERA
tree /GASOLINERA

exit 0

