#! /bin/bash -u
contador=0
cat $1 | ( while read linea 
		 do 
			let contador=$contador+1
			echo "Línea: $linea"
			# Procesar $linea (línea actual)
		done;
echo "Numero total del ineas del fichero: $contador" )
