#!/bin/bash -u
# Almacena en la variable "fecha" la salida estandar de la orden "date"
fecha=$(date)

# Almacena en la variable "usuario" la salida estandar de la orden "whoami"
usuario=$(whoami)

# Muestra en pantalla el mensaje de saludo
echo "Hola $usuario. La fecha de hoy es: $fecha"
