#! /bin/bash -u 

case $1 in 
*.txt)
	cp $1 ~/copias
	;;
*.doc | *.bak)
	# Tan sólo como ejemplo de otras extensiones
	;;
*)
	echo "$1 tiene extensión desconocida"
	;;
esac
