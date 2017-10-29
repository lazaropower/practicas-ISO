#! /bin/bash -u

[ $# -ne 2 ] && echo "Uso: $0 fichero1 fichero2" >&2 && exit 1
[ ! -r $1 ] && echo "$1 no es un fichero válido o no se puede leer" >&2 && exit 2
[ ! -r $2 ] && echo "$1 no es un fichero válido o no se puede leer" >&2 && exit 2

while read linea 
do 
	primera=$(echo $linea | cut -f1 -d" ")
	cat $2 | grep -wqi "$primera" 	# Booleano que indica si $primera está en el fichero 2
	if [ $? -eq 0 ] 
	then
		echo $linea | tr [:lower:] [:upper:]	
	else 
		echo $linea
	fi
done < "$1" 
