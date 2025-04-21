#!/bin/bash
# Danny A. Calderon

# Contador de grupos
cont=0

# Máximo de usuarios en un grupo
max_usuarios=0

# Array para guardar los grupos con más usuarios
grupos_max=()

# Función para comprobar si el fichero existe
comfich() {
	if [ -f "$ruta" ]; then
		return 0
	else
		echo "❌ El fichero no existe. Inténtalo de nuevo."
		return 1
	fi
}

# Bucle para pedir la ruta hasta que exista el fichero
while true; do
	if [ $# -eq 0 ]; then
		read -p "📄 Dime la ruta del fichero: " ruta
	else
		ruta=$1
	fi

	comfich && break
done

# Leer el fichero línea por línea
while IFS=':' read -r grupo usuarios; do
	# Contar manualmente los usuarios (sin usar wc)
	num_usuarios=0
	for user in $usuarios; do
		((num_usuarios++))
	done

	echo "📌 Grupo '$grupo' tiene $num_usuarios usuario(s)."

	((cont++))

	# Actualizar máximo si corresponde
	if (( num_usuarios > max_usuarios )); then
		max_usuarios=$num_usuarios
		grupos_max=("$grupo")
	elif (( num_usuarios == max_usuarios )); then
		grupos_max+=("$grupo")
	fi

done < "$ruta"

# Mostrar resultados
echo ""
echo "✅ Total de grupos: $cont"
echo "🏆 Grupo(s) con más usuarios ($max_usuarios): ${grupos_max[*]}"

exit 0

