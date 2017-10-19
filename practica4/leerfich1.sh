#! /bin/bash -u 
contador=0
while read linea
do 
	let contador=$contador+1
	echo "Línea $contador: $linea"
	# Procesar $linea (línea actual)
done < $1
echo "Numero total de lineas del fichero: $contador"

