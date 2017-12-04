#! /bin/bash -u 

while true 
do 
	clear
	echo "
		Ver directorio actual...........[1]
		Copiar ficheros.................[2]
		Editar ficheros.................[3]
		Imprimir fichero................[4]
		Salir del menú..................[5]"
	read i
	case $i in 
	1)	ls
		;;
	2)	echo "Introduzca [desde]"
		read x
		echo "Introduzca [hasta]"
		read y
		cp $x $y
		;;
	3) 	echo "¿Nombre de fichero a editar?"
		read x
		vi $x	
		;;	
	4) 	echo "¿Nombre de fichero a imprimir?"
		read x
		lpr $x
		;;
	5)  clear
		break
		;;
	esac
	echo "Pulse INTRO para continuar"
	read x
		
done 
