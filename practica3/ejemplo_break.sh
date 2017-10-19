#! /bin/bash -u 
# Muestra todos los parámetros. Si uno es una "f" finaliza
while [ $# -gt 0 ]
do
	if [ $1 = "f" ]
	then
		break
	fi
	echo Parámetro: $1
	shift
done
