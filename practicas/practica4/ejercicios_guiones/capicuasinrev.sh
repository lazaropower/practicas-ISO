#! /bin/bash -u
# "||" significa que lo primero se va a ejecutar solamente si lo primero da true.
# >&2 es equivalente a 1>&2. 
if test $# -ne 1 || ! echo $1 | grep -qx "[0-9]\+"
then
	echo "Sintaxis: $0 numeronatural" 1>&2
	exit 2
fi 

i=1
j=${#1}

while [ $i -lt $j ]
do
	ci=$(echo $1 | cut -c$i)
	cj=$(echo $1 | cut -c$j)
	
test $ci -ne $cj && exit 1

	i=$(($i+1))
	let j=$j-1
done 
