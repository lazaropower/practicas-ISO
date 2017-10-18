#! /bin/bash -u 
cad1=hola
cad2=Hola

if [ "$cad1" != "$cad2" ]
then 
	echo "cad1 ($cad1) no es igual que cad2 ($cad2)"
	echo "'$cad1'"
fi 

if [ "$cad1" = "$cad2" ]
then 
	echo "cad1 ($cad1) es igual a cad2 ($cad2)"
fi 
