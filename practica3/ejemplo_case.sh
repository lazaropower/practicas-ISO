#! /bin/bash -u 

echo "Introduce un numero: " 
read num
case $num in 
	1)		echo "El resultado es 1"
		;;
	2)		echo "El resultado es 2"
		;;
	3|4)	echo "El resultado es 3 o 4"
		;;
	*)		echo "El resultado no es un enetero entre 1 y 4"
		;;
esac
