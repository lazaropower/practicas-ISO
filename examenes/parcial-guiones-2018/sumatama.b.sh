#! /bin/bash -u 

[ ! $# -ge 2 ] && echo "Uso: $0 directorio sufijo_1 [sufijo_2 ... sufijo_n]" >&2 && exit 1
[ ! -d $1 ] && echo "$1 no existe o no es un directorio válido" >&2 && exit 2

directorio=$1
shift
for sufijo in "$@"
do
	echo "Sufijo: $sufijo"
	echo "--------------------------------------"
	find $directorio -type f -name "*$sufijo" -printf "Fichero %p Tamaño: %s Bytes\n"
	echo
done
