#!/bin/bash

# Hecho por Danny A. Calderon

# Esto es para sacar la fecha y la hora
fecha=$(date +'%y%m%d')
dia=$(date +'%A')

# Variables de fecha y hora completas y vendedor
fecha_completa=$(date +'%y-%m-%d-%H-%M-%S')
vendedor=$(whoami)

# Pedimos al trabajador el producto y la cantidad
read -p "Dime la cantidad: " cantidad
read -p "Dime el producto: " producto

# Nombre del archivo
archivo="ventas-$fecha-$dia.csv"

# Comprueba si el archivo existe y tiene menos de 2 líneas
if [ ! -f "$archivo" ] || [ $(wc -l < "$archivo") -lt 2 ]; then
    # Ponemos el título si el archivo no existe o tiene menos de 2 líneas
    echo "fecha;producto;vendedor;cantidad" > "$archivo"
fi

# Añadir la nueva línea de datos al archivo
echo "$fecha_completa;$producto;$vendedor;$cantidad" >> "$archivo"

exit 0

