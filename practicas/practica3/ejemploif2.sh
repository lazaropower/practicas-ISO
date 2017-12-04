#!/bin/bash -u

if [ \( $1 -ge 100 \) -o \( $2 -ge 100 \) ]
then 
	echo "Los parametros deben ser numeros menores de 100" >&2
	echo "USO: $0 numero1 numero2" >&2
	exit 1
fi 
let suma=$1+$2
echo "La suma de $1 y $2 es: $suma"
