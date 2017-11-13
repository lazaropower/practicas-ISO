#!/bin/bash -u
echo "El nombre del programa es $0"
echo "El numero total de parametros es $#"
echo "Todos los parametros recibidos son $@"

i=1
echo "El primer parametro recibido es ${!i}"
i=2
echo "El segundo parametro recibido es ${!i}"
i=3
echo "El tercer parametro recibido es ${!i}"
i=4
echo "El cuarto parametro recibido es ${!i}"
echo "El numero total de parametros, sin hacer shifts, es $#"
