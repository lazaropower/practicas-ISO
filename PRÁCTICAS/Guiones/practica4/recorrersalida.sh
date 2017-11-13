#! /bin/bash -u 
tam_tot=0
find . -name "*.pdf" -printf "%f %s \n" | (while read linea ; do 
		nom_fic=$(echo $linea | cut -f1 -d" ")
		tam_fic=$(echo $linea | cut -f2 -d" ")
		let tam_tot=$tam_tot+$tam_fic
		echo "Fichero: $nom_fic --> Tamaño: $tam_fic"
done; 
echo "Tamaño total de los ficheros acabados en '.pdf': $tam_tot")
