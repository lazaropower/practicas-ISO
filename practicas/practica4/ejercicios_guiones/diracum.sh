#! /bin/bash -u
# Comprobacion de errores
# Otra forma posible: [ $# -ne 1 ] && echo "USO: $0 <directorio>" 1>&2 && exit 1
if [ $# -eq 0 ]
then
	echo "USO: $0 <directorio> [directorio...]" 1>&2 && exit 1
fi
for dir in "$@"
do
	[ ! -d "$dir" ] && echo "$dir no es un directorio" 1>&2 && exit 2
done

fichero=$(mktemp)
ttotal=0
find "$@" -maxdepth 1 -type f -printf "%s\n" > $fichero 
while read linea
do
	let ttotal+=$linea
done < $fichero
#########################################################################
#         OTRA FORMA DE CALCULAR EL TAMAÑO TOTAL MUY RAPIDA             #
#########################################################################
ttot=$(find "$@" -maxdepth 1 -type f -printf "%s\n" | paste -s -d"+" | bc)
#########################################################################

# Nos es indifernete poner -k2n,2 o -k2n. Igual con $(($tacum+$tamano)) y let tacum=$tacum+$tamano
tacum=0
nfich=0
echo -e "PERMISOS\tTAMAÑO\tACUMULADO\tNOMBRE\tPORCENTAJE"
find "$@" -maxdepth 1 -type f -printf "%M:%s:%f\n" | sort -k2n,2 -t ";" | (while read linea ; do
	permisos=$(echo $linea | cut -f 1 -d":")
	tamano=$(echo $linea | cut -f 2 -d":")
	nombre=$(echo $linea | cut -f 3 -d":")
	tacum=$(($tacum+$tamano))
	let porcentaje=\($tamano*100\)/$ttotal
	let nfich+=1
	echo -e "$permisos\t$tamano\t$tacum\t\t$nombre\t$porcentaje%"
done;
echo "Total de ficheros = $nfich | Tamaño medio = $(($tacum/$nfich))")
