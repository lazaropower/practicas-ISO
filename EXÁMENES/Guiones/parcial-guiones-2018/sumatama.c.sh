#! /bin/bash -u 

[ ! $# -ge 2 ] && echo "Uso: $0 directorio sufijo_1 [sufijo_2 ... sufijo_n]" >&2 && exit 1
[ ! -d $1 ] && echo "$1 no existe o no es un directorio válido" >&2 && exit 2

directorio=$1
shift
for sufijo in "$@"
do	
	tsufijo=$(find $directorio -type f -name "*$sufijo" -printf "%s\n" | paste -s -d"+" | bc)
	[ -z $tsufijo ] && tsufijo=0
	echo "Fichero con sufijo '$sufijo'. Tamaño total: $tsufijo Bytes"
done
