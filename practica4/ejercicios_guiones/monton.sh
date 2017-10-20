#! /bin/bash -u
# Tratamiento de errores
if [ $# -ne 1 ]
then 
	echo "Número de parámetros erróneo" 1>&2
	echo "USO: $0 numero" 1>&2
	exit 1
fi
if ! echo $1 | grep -x -q "[0-9]\+"
then 
	echo "El argumento $1 no es un entero mayor que 0" 1>&2
	echo "USO: $0 numero" 1>&2
	exit 1
fi
# Codigo del programa
for i in $(seq 1 1 $1)
do
	let espacios=$1-$i
	let asteriscos=($i*2)-1
	for j in $(seq 1 1 $espacios)
	do
		echo -n " "
	done
	for j in $(seq 1 1 $asteriscos)
	do
		echo -n "*" 
	done
	echo
done
