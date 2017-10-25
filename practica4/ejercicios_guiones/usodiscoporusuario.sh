#! /bin/bash -u

# Comprobación de errores en los parámetros.
[ $# -eq 0 ] && echo "Uso: $0 directorio dir1 [dir2] ... [dirN]" 1>&2 && exit 1
for dir in "$@"
do
	[ ! -d "$dir" ] && echo "$dir no es un directorio" 1>&2 && exit 2
done

errores=$(mktemp)
usuarios=$(find "$@" -type f -printf "%u\n" 2>$errores | sort | uniq)
ttotal=0
for usu in $usuarios
do
	tamficheros=$(find "$@" -type f -user "$usu" -printf "%s\n" 2>/dev/null)
	tusuario=0
	for tam in $tamficheros
	do
		let tusuario+=$tam
	done
	let ttotal+=$tusuario
	if [ $tusuario -lt 1048576 ] # 1 MiB = 1048576 bytes  
	then
		echo "$usu: $tusuario bytes"
	else
		let tusuario=\($tusuario/1024\)/1024
		echo "$usu: $tusuario MiB"
	fi
done
if [ $ttotal -lt 1048576 ] 
then
	echo "Total de todos los usuarios: $ttotal bytes"
else  
	let ttotal=\($ttotal/1024\)/1024
	echo "Total de todos los usuarios: $ttotal MiB"
fi
if [ -s $errores ]
then 
	echo "El contenido de los siguiente directorios no se ha podido contabilizar:"
	cat $errores | tr -s " " | cut -f 2 -d":"
fi 
