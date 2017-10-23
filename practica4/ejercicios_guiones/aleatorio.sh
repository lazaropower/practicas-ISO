#! /bin/bash -u 

if [ $# -eq 0 ]
then
	echo $(($RANDOM%100+1))
	exit 0
fi

valido=1
while [ $valido -eq 1 ]
do
	aleatorio=$(($RANDOM%100+1))
	echo $@ | grep -qw $aleatorio && continue
	valido=0
done

echo "Número aleatorio entre 1 y 100 (eliminando los argumentos): $aleatorio"
