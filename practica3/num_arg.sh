#! /bin/bash -u

if [ $# -ge 1 ] 
then
	echo "El guión shell "$0" ha recibido '$#' argumentos"
	exit 0	
else
	echo "El guión shel "$0" no ha recibido ningún argumento" 
	exit 1 
fi 
