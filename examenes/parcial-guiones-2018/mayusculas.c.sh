#! /bin/bash -u

[ $# -ne 2 ] && echo "Uso: $0 fichero1 fichero2" >&2 && exit 1
[ ! -r $1 ] && echo "$1 no es un fichero válido o no se puede leer" >&2 && exit 2
[ ! -r $2 ] && echo "$1 no es un fichero válido o no se puede leer" >&2 && exit 2

res=$(mktemp) 	# Fichero temporal donde almacenaremos todo el texto para después pasárselo al fichero
nletrastotal=0		# Número de letra stotales
nletratotalcamb=0	# Númeor de letras totales cambiadas
npalabrastotal=0	# Número total de palabras
npalabrastotalcamb=0	# Número total de palabras cambiadas
while read linea 
do
	npalabras=$(echo $linea | wc -w) 	# Número de palabras de la línea actual
	let npalabrastotal+=npalabras
	for i in $(seq 1 1 $npalabras)
	do
		palabra=$(echo $linea | cut -f$i -d" ")
		ncar=$(echo -n $palabra | wc -c)
		let nletrastotal+=ncar
		cat $2 | grep -wqi "$palabra" 	# Booleano que indica si $pal está en el fichero 2
		if [ $? -eq 0 ]
		then
			ncarcamb=$(echo -n $palabra | wc -c)
			let nletrastotalcamb+=ncarcamb
			let npalabrastotalcamb+=1
			echo -n $palabra | tr [:lower:] [:upper:] >> $res
		else
			echo -n $palabra >> $res		
		fi
		echo -n " " >> $res
		let i+=1	
	done
	echo >> $res
done < "$1" 

cat $res > "$1"	# Movemos el contenido del fichero temporal al original 

echo "Número de letras del fichero $1: $nletrastotal"
echo "Número de letras cambiadas a mayúsculas: $nletrastotalcamb"
echo "Número de palabras totales del fichero $1: $npalabrastotal"
echo "Número de palabras cambiadas a mayúsculas: $npalabrastotalcamb"
