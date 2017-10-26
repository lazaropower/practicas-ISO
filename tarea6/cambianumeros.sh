#! /bin/bash -u

[ $# -ne 2 ] && echo "Uso: $0 fichero1 fichero2" >&2 && exit 1
[ ! -f $1 ] && echo "El fichero $1 no es un fichero regular o no existe" >&2 && exit 2

echo "$1" | (while read linea 
do
			
done)
