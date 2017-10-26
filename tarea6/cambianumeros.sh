#! /bin/bash -u

[ $# -ne 2 ] && echo "Uso: $0 fichero1 fichero2" >&2 && exit 1
[ ! -f $1 ] && echo "El fichero $1 no es un fichero regular o no existe" >&2 && exit 2

# Función que comprueba si el último carácter de una palabra es un signo de puntuación. Devuelve 0(true) o 1(false)
function isPunct {
	aux=$(echo $palabra | rev | cut -c 1) 
	echo $aux | grep -wq [[:punct:]]
	if [ $? -eq 0 ]		
	then
		carpunct=$aux
	fi
}
ncambios=0
nlinea=0
cat "$1" | (while read linea 
do
	npalabra=1	# Contador de palabras
	palabra=" " 	# Palabra actual
	# addpunct=1	# Booleano que indica si tenemos que añadir un signo de puntuación al final de la palabra		
	while [ ! -z "$palabra" ]
	do
		carpunct=""	# Carácter de [:punct:] a añadir al final de la palabra.
		palabra=$(echo $linea | cut -f$npalabra -d" ")
  	
		case $palabra in
			"cero")	echo -n "0" >> $2 
				let ncambios+=1
				;;
			"uno")	echo -n "1" >> $2
				let ncambios+=1
				;;
			"dos")	echo -n "2" >> $2
				let ncambios+=1
				;;
			"tres")	echo -n "3" >> $2
				let ncambios+=1
				;;
			"cuatro") echo -n "4" >> $2
				let ncambios+=1	
				;;
			"cinco") echo -n "5" >> $2
				let ncambios+=1	
				;;
			"seis")	echo -n "6" >> $2
				let ncambios+=1
				;;
			"siete") echo -n "7" >> $2
				let ncambios+=1	
				;;
			"ocho")	echo -n "8" >> $2
				let ncambios+=1
				;;
			"nueve") echo -n "9" >> $2
				let ncambios+=1	
				;;
			*)	echo -n $palabra >> $2
				;;	
		esac
		if [ ! -z $carpunct ]
		then
			echo -n $carpunct >> $2
		fi
	 	echo -n " " >> $2   # Metemos espacio al fichero. 
		let npalabra+=1
	done
	echo >> $2	# Metemos salto de linea '\n' al fichero. 
	let nlinea+=1	
done)
