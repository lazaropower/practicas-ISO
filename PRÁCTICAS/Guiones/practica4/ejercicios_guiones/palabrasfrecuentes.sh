#! /bin/bash -u

[ $# -ne 2 ] && echo "Uso: $0 fichero numero" 1>&2 && exit 1 
[ ! -r $1 ] && echo "El fichero $1 no existe o no se puede leer" 1>&2 && exit 2
if ! echo "$2" | grep -xq "[1-9][0-9]*"
then 
	echo "$2 no es un nmero o no es mayor que 0" 1>&2 && exit 3
fi
#################################################################
# OTRA FORMA DE HACER LA COMPROBACIÓN PARA EL SEGUNDO PARÁMETRO #
#if echo "$2" | grep -qvx '[0-9]\+' || [ $2 -lt 1 ]
#then
#	echo "$2 no es un numero o no es mayor que 0" 1>&2 && exit 3
#fi
# La opción -v del grep es para coger el inverso. También podemos
# quitarla y poner ! después del if
#################################################################

npalabras=$(grep -oiw '[a-z]\+' "$1" | wc -l)
grep -oiw '[a-z]\+' "$1" | sort | uniq -ci | sort -nr | head -n $2 | while read linea 
do 
	palabra=$(echo $linea | tr -s " " | cut -f2 -d" ")
	repeticiones=$(echo $linea | tr -s " " | cut -f1 -d" ")
	let porcentaje=($repeticiones*100)/$npalabras
	echo "$palabra: $repeticiones ($porcentaje%)"
done 
