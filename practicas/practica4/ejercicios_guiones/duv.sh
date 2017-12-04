#! /bin/bash -u

[ $# -eq 0 ] && echo "Uso: $0 directorio" 1>&2 && exit 1
[ ! -d $1 ] && echo "$1 no es un directorio o no existe" 1>&2 && exit 2

ttotal=0
maxasteriscos=60	# Numero maximo que puede haber de asteriscos. Corresponde al 100%.
find "$1" -type f -printf "%s\n" | (while read linea
do 
	let ttotal+=$linea
done
echo "Total : $ttotal bytes"

find "$1" -type f -printf "%.9f %s\n" | (while read linea 
do
	tamano=$(echo $linea | cut -f 2 -d" ")
	nombre=$(echo $linea | cut -f 1 -d" ")
	let porcentaje=\($tamano*100\)/$ttotal
	echo -n "$nombre "
	let asteriscos=\($porcentaje*$maxasteriscos\)/100
	for i in $(seq 1 1 $asteriscos)
	do
		echo -n "*"
	done
	echo " $porcentaje %"
done))
