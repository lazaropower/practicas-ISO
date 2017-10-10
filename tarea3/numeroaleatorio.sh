#!/bin/bash -u

suma=0
while [ $suma -ne $2 ]
do
	aleatorio=$RANDOM$RANDOM$RANDOM$RANDOM
	while [ ${#aleatorio} -lt $1 ]
	do
		aleatorio=$RANDOM$RANDOM$RANDOM$RANDOM
	done
	aleatorio=$(echo $aleatorio | cut -c1-$1)

	suma=0
	for i in $(seq 1 1 ${#aleatorio})
	do
		suma=$(($suma + $(echo $aleatorio | cut -c$i)))
	done 
done

echo "Numero aleatorio de $1 cifras, suman $2: $aleatorio"

