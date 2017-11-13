#! /bin/bash -u

[ $# -eq 0 ] && echo "Uso: $0 directorio dir1 [dir2] ... [dirN]" 1>&2 && exit 1
for dir in "$@"
do
	[ ! -d "$dir" ] && echo "$dir no es un directorio" 1>&2 && exit 2 
done

fichero=$(mktemp)
find "$@" -type f -printf "%f\n" | (while read linea
do
	echo -n "$linea " >> $fichero
	echo "$linea" | wc -m >> $fichero			 	
done)

mayor=$(cat $fichero | sort -k2nr,2 -t " " | head -1 | cut -f 2 -d" ")
cat $fichero | sort -k2nr,2 -t " " | (while read linea 
do 
	longitud=$(echo $linea | cut -f 2 -d" ")
	nombre=$(echo $linea | cut -f 1 -d" ")	
	if [ $longitud -ge $mayor ]
	then
		find "$@" -type f -name "$nombre" -printf "%p"	
		echo
	fi	
done)
