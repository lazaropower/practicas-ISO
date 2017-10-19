#! /bin/bash -u 

for nombre in *.tex
do
	# Quita sufijo "tex" de "nombre"
	nuevo_nombre=$(basename $nombre tex)
	
	# Añade sufijo "latex" a "nuevo_nombre"
	nuevo_nombre="$nuevo_nombre""latex"
	
	# Renombre fichero
	mv $f $nuevo_nombre
done 
