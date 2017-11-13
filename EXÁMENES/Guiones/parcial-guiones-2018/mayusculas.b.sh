#! /bin/bash -u

[ $# -ne 2 ] && echo "Uso: $0 fichero1 fichero2" >&2 && exit 1
[ ! -r $1 ] && echo "$1 no es un fichero válido o no se puede leer" >&2 && exit 2
[ ! -r $2 ] && echo "$1 no es un fichero válido o no se puede leer" >&2 && exit 2

while read linea 
do
	npalabras=$(echo $linea | wc -w) 	# Número de palabras de la línea actual
	for i in $(seq 1 1 $npalabras)
	do
		palabra=$(echo $linea | cut -f$i -d" ")
		cat $2 | grep -wqi "$palabra" 	# Booleano que indica si $pal está en el fichero 2
		if [ $? -eq 0 ]
		then
			echo -n $palabra | tr [:lower:] [:upper:]
		else
			echo -n $palabra		
		fi
		echo -n " "
		let i+=1	
	done
	echo
done < "$1" 
