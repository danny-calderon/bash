#!/bin/bash

# Hecho por Danny Calderon

# Comprobamos que es super usuario
if [ $EUID -ne 0 ]; then
    echo "Debes ser root"
    exit 1
fi

usuarios_reparados=()

reparar_usuarios() {
    usuario=$1
    pass_inicial=$2

    # Creo el directorio home del usuario, si no existe
    if [ ! -d /home/$usuario ]; then
        mkdir /home/$usuario
        chown $usuario:$usuario /home/$usuario
        chmod 750 /home/$usuario

        # Compruebo si hubo algún error al crear el directorio
        if [ $? -ne 0 ]; then
            echo "ERROR: al crear el usuario"
            return 2
        fi
    fi

    echo "$usuario:$pass_inicial" | chpasswd
    chage -d 0 $usuario

    if [ $? -ne 0 ]; then
        echo "ERROR: contraseña"
        return 3
    fi

    usuarios_reparados+=($usuario)
}

read -p "Dime la contraseña: " pass_inicial

if [[ ${#pass_inicial} -lt 8 ]] || [[ ! "$pass_inicial" =~ [0-9] ]] || [[ ! "$pass_inicial" =~ [a-z] ]] || [[ ! "$pass_inicial" =~ [A-Z] ]] || [[ ! "$pass_inicial" =~ [^a-zA-Z0-9] ]]; then
    echo "La contraseña está mal"
    exit 1
fi

while IFS=: read -r usuario _ uid _ _ home _; do
    if [ $uid -ge 1000 ] && [ $uid -lt 200 ]; then
        if [ ! -d $home ]; then
            reparar_usuarios $usuario $pass_inicial
        fi
    fi
done < /etc/passwd

echo "Usuarios reparados: ${usuarios_reparados[@]}"
echo "La contraseña es: $pass_inicial"
echo "Se ha forzado un cambio de contraseña en el primer inicio de sesión"

exit 0

