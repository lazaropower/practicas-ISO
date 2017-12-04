#!/bin/bash

for i in "$@"
do
	[ ! -d "$i" ] && {
		echo "El argumento "$i" no corresponde a un directorio válido"
		exit 1
	}
done

u=$(find "$@" -type f ! -user root \( ! -perm /400 -o \( -perm /100 ! -perm /011 -o ! -perm /100 \) \) -printf "%u\n" | sort | uniq)
echo "$u" | while read user
do
	echo "$user:"
	d=$(find "$@" -type f -user "$user" \( ! -perm /400 -o \( -perm /100 ! -perm /011 -o ! -perm /100 \) \) -printf "%h\n" | sort | uniq)
	echo "$d" | while read direc
	do
		echo "	$direc:"
		find "$direc" -maxdepth 1 -type f -user "$user" \( ! -perm /400 -o \( -perm /100 ! -perm /011 -o ! -perm /100 \) \) -printf "		%p %M\n"
	done
done
