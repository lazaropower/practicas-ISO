#! /bin/bash -u
if [ $# -eq 0 ]
then 
	rutas="."
else 
	for dir in "$@"
	do
		[ ! -d "$dir" ] && echo "$dir no es un directorio valido" 1>&2 && exit 1	
	done
	rutas="$@"
fi
# "-" significa al menos esos permisos. "/" significa que si los hay 
# deben de ser esos permisos  pero no necesariamente tiene por que haberlos. 

usuarios=$(find $rutas -type f ! -user root \( ! -perm -u=r -o \( ! -perm -u=x -perm /go=x \) \) -printf "%u\n" 2> /dev/null | sort | uniq)

for usu in $usuarios
do 
	echo "$usu:"
	directorios=$(find $rutas -type f -user $usu \( -perm -u=r -o \( ! -perm -u=x -perm /go=x \) \) -printf "\t%h\n" 2> /dev/null | sort | uniq)
	for dir in $directorios
	do
		echo -e "\t$dir"
		find "$dir" -maxdepth 1 -type f -user $usu \( -perm -u=r -o \( ! -perm -u=x -perm /go=x \) \) -printf "\t\t%M %f\n" 2> /dev/null
	done
done 
