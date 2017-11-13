#! /bin/bash -u 

echo -e "USER\tVSZ" 
ps aux | tr -s " " | cut -f1 -d" " | sort | uniq | head -n -1 | (while read linea
do
	totalmem=0
	ps aux | tr -s " " | cut -f1,5 -d" " | sort | head -n -1 | grep $linea | cut -f2 -d" " | (while read gato
	do
		totalmem=$(($totalmem+$gato))
	done
	echo -e "$linea\t$totalmem")
done)
