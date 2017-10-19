#! /bin/bash -u 

salida=1
while [ $salida -gt 0 ]
do
	echo "Introduzca un número para calcular el doble:"
	read num
	let res=$num*2
	echo "El doble de $num es $res"
	exit=1
	while [ $exit -gt 0 ]
	do
		echo "¿Desea calcular otro doble? (S/N)?"
		read respuesta
		if [ $respuesta = 'S' -o $respuesta = 's' ] 
		then 
			exit=0
		elif [ $respuesta = 'N' -o $respuesta = 'n' ]
		then 
			exit=0
			salida=0
		else 
			echo "[ERROR] La respuesta debe ser (S/N)"
		fi
	done
done
