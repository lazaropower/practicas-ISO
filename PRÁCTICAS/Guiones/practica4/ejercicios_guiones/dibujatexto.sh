#! /bin/bash -u

[ $# -eq 0 ] && echo "Uso: $0 <fichero>" 1>&2 && exit 1
[ ! -r $1 ] && echo "Imposible acceder al fichero $1" 1>&2 && exit 2

while read linea 
do 
	i=1
	car=" " # Aqui inicializamos a cualquier caracter que no sea cadena vacia "" 
	while [ ! -z "$car" ] # -z "$car" devuelve 0 si la longitud de $car es 0
	do
		num=$(echo "$linea" | cut -c$i)
		let i+=1
		car=$(echo "$linea" | cut -c$i)
		let i+=1
		for j in $(seq 1 1 $num)
		do
			echo -n "$car"
		done
	done
	echo
done < $1
