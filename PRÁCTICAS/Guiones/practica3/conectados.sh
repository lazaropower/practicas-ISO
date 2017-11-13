#!/bin/bash -u
veces=$(who | grep -w ^$1 | wc -l)
echo "$1 esta conectado $veces veces"
