#!/bin/bash -u

if test -f "$1"		# ¿es un fichero regular? 
then 
	cat $1
elif test -d "$1" 	# ¿es un directorio? 
then 
	ls -l "$1"		# no es ni fichero ni directorio
else 
	echo "$1 no es un fichero ni directorio" >&2
	exit 1
fi 

# NOTA : Usamos las comillas dobles para $1 por si hubiera algun espacio en el nombre. 
