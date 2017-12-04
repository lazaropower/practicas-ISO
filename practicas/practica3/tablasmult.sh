#! /bin/bash -u 

if [ $# -ne 1 ]
then 
	echo "USO: ./tablamult N"
	exit 1 
fi 

if [ \( $1 -ge 0 \) -a \( $1 -le 10 \) ]
then 
	tabla=$1
	echo "TABLA DE MULTIPLICAR DEL 5"
	echo "=========================="
	for i in $(seq 1 1 10)
	do
		echo "$1 * $i = $(($1*$i))"	
	done
	exit 0
else 
	echo "Debe pasar un parametro (0 >= N <= 10)(USO: ./tablamult N)"
	exit 1
	
fi
