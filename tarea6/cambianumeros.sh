#! /bin/bash -u

[ $# -ne 2 ] && echo "Uso: $0 fichero1 fichero2" >&2 && exit 1
[ ! -f $1 ] && echo "El fichero $1 no es un fichero regular o no existe" >&2 && exit 2

ncambios=0
nlinea=1

cat "$1" | (while read linea 
do
	haycambio=1		# Booleano que comprueba si ha habido algun cambio en la línea actual
	npalabra=1		# Contador de palabras
	palabra=" " 	# Palabra actual
	impLinea=1		# Booleano que comprueba si se ha imprimdo ya "Linea $nlinea:"
	while [ ! -z "$palabra" ]
	do
		ncambiosAux=$ncambios			# Guardamos el valor de $ncambios para un if posterior.
		npalcambio=0					# Guarda el nº de palabra en la que ha habido un cambio.  
		carpunct=""						# Carácter de [:punct:] a añadir al final de la palabra.
		palabra=$(echo $linea | cut -f$npalabra -d" ")
		aux=$(echo $palabra | rev | cut -c1)	# Último carácter de la palabra 
		echo $aux | grep -wq [[:punct:]]		# Comprobamos si $aux carácter es un signo de puntuación
		if [ $? -eq 0 ]
		then
			carpunct=$aux
			palabra=$(echo $palabra | tr -d [:punct:])
		fi
  		
		case $palabra in
			"cero")	echo -n "0" >> $2
				npalcambio=$npalabra
				haycambio=0
				let ncambios+=1
				;;
			"uno"| "Uno")	echo -n "1" >> $2
				npalcambio=$npalabra 
				haycambio=0
				let ncambios+=1
				;;
			"dos")	echo -n "2" >> $2
				npalcambio=$npalabra
				haycambio=0
				let ncambios+=1
				;;
			"tres")	echo -n "3" >> $2
				npalcambio=$npalabra 
				haycambio=0 
				let ncambios+=1
				;;
			"cuatro") echo -n "4" >> $2
				npalcambio=$npalabra  
				haycambio=0
				let ncambios+=1	
				;;
			"cinco") echo -n "5" >> $2
				npalcambio=$npalabra 
				haycambio=0
				let ncambios+=1	
				;;
			"seis")	echo -n "6" >> $2
				npalcambio=$npalabra  
				haycambio=0
				let ncambios+=1
				;;
			"siete") echo -n "7" >> $2
				npalcambio=$npalabra 
				haycambio=0 
				let ncambios+=1	
				;;
			"ocho")	echo -n "8" >> $2
				npalcambio=$npalabra 
				haycambio=0 
				let ncambios+=1
				;;
			"nueve") echo -n "9" >> $2
				npalcambio=$npalabra 
				haycambio=0 
				let ncambios+=1	
				;;
			*)	echo -n $palabra >> $2
				;;	
		esac
		if [ ! -z $carpunct ]
		then
			echo -n $carpunct >> $2		# Si la palabra contenía un signo de puntuación, lo ponemos. 
		fi
	 	echo -n " " >> $2   # Metemos espacio al fichero. 
		# Comprobamos si ha habido cambios para imprimir la línea. Si no ha habido ninguno, no se imprime.
		if [ $ncambiosAux -lt $ncambios ]
		then
			if [ $impLinea -eq 1 ]
			then 
				echo -n "Línea $nlinea: "
				impLinea=0
			fi
			echo -n "$npalcambio, "	
		fi
		let npalabra+=1
	done
	if [ $haycambio -eq 0 ]
	then
		echo
	fi
	echo >> $2	# Metemos salto de linea '\n' al fichero. 
	let nlinea+=1	
done
echo "Número total de cambios: $ncambios")
