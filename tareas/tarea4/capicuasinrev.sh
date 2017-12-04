#!/bin/bash -u

if [ $# -ne 1 ]
then 
	echo "Sintaxis: $0 entero positivo" 1>&2
	exit 2
elif ! $(echo $1 | grep -qx "[0-9]\+")
then
		echo "Sintaxis: $0 entero positivo" 1>&2
		exit 2
fi

i=1
j=${#1}
# j=$(echo -n $1 | wc -c)
while [ $i -lt $j ]
do
	ci=$(echo $1 | cut -c $i)
	cj=$(echo $1 | cut -c $j)
	[ $ci -ne $cj ] && exit 1
	let i+=1
	let j-=1
done
