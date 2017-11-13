#! /bin/bash -u 

[ ! $# -ge 2 ] && echo "Uso: $0 directorio sufijo_1 [sufijo_2 ... sufijo_n]" >&2 && exit 1
[ ! -d $1 ] && echo "$1 no existe o no es un directorio válido" >&2 && exit 2
