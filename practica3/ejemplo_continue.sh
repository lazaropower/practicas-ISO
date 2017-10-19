#! /bin/bash -u

# Muestra todos los parámetros, si uno de ellos es una "f"
# se lo salta y continúa el bucle 

while [ $# -gt 0 ]
do 
	if [ $1 = "f" ]
	then 
		shift
		continue
	fi
	echo Parámetro: $1
	shift
done 
