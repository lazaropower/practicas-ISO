#! /bin/bash -u 
if [ $# -ne 2 ]
then 
	echo "Número de parámetros erróneo" >&2
	echo "USO: $0 directorio_busqueda fichero_a_buscar" >&2
	exit 1
fi 
if [ ! -d $1 ]
then 
	echo "El primer parámetro debe ser un directorio" >&2
	echo "USO: $0 directorio_busqueda fichero_a_buscar" >&2
	exit 2
fi 
if [ ! -f $1/$2 ]
then 
	echo "El segundo parámetro debe ser un fichero" >&2
	echo "USO: $0 directorio_busqueda fichero_a_buscar" >&2
	exit 3
fi 

####################################
# resto del codigo del guion shell #
####################################
