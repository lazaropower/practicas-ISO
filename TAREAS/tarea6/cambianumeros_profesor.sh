#!/bin/bash -u
[ $# -ne 2 ] && echo "Uso: $0 <ficheroEntrada> <ficheroSalida>" 1>&2 && exit 1
[ ! -f "$1" ] && echo "$1 debe ser un fichero regular" 1>&2 && exit 2

fichero=$(mktemp)
ncambios=0
nlinea=0
while read linea
do
	npalabra=1
	esprimera=0
	let nlinea+=1
	for palabra in $linea
	do
		palabraantes=$palabra
		case $(echo $palabra | tr -d [:punct:] | tr [A-Z] [a-z]) in		# Quitamos la posible , o . después de la palabra y la ponemos en minuscula
			cero) palabra="0"
				;;
			uno) palabra="1"
				;;
			dos) palabra="2"
				;;
			tres) palabra="3"
				;;
			cuatro) palabra="4"
				;;
			cinco) palabra="5"
				;;
			seis) palabra="6"
				;;
			siete) palabra="7"
				;;
			ocho) palabra="8"
				;;
			nueve) palabra="9"
				;;
		esac
		if [ $palabraantes != $palabra ] 
		then
			let ncambios+=1
			palabra=$palabra$(echo $palabraantes | tr -d [A-Za-z])		# Añadimos posible signo de puntación tras un cambio
			if [ $esprimera -eq 0 ]						# El primer cambio requiere marcar la línea donde se produce 
			then
				echo -n "Línea $nlinea: $npalabra"
				esprimera=1
			else								# Para el resto de cambios simplemente se concatena el número de la palabra
				echo -n ", $npalabra"
			fi
		fi

		if [ $npalabra -eq 1 ]							# La primera palabra de cada línea se pone tal cual 
		then
			printf "%s" "$palabra" >> $fichero
		else									# Al resto de palabras se les antepone el espacio en blanco
			printf " %s" "$palabra" >> $fichero
		fi
		let npalabra+=1
	done
	[ $esprimera -eq 1 ] && echo							# Si ha habido cambios en la línea, retorno de carro
	echo >> $fichero 
done < "$1"
echo "Número total de cambios: $ncambios"
mv $fichero "$2"

