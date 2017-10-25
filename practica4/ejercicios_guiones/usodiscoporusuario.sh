#! /bin/bash -u

# Comprobación de errores en los parámetros.
[ $# -eq 0 ] && echo "Uso: $0 directorio dir1 [dir2] ... [dirN]" 1>&2 && exit 1
for dir in "$@"
do
	[ ! -d "$dir" ] && echo "$dir no es un directorio" 1>&2 && exit 2
done

ttotal=0
find "$@" -type f -printf "%u\n" 2> /dev/null | uniq | (while read usuario
do
	tusuario=0
	find "$@" -type f -user "$usuario" -printf "%s\n" 2> /dev/null 2> /dev/null | (while read tamano
	do
		let tusuario+=$tamano
	done
	let ttotal+=$tusuario	
	echo "$usuario: $tusuario bytes")
done
echo "Total de todos los usuarios: $ttotal bytes")
