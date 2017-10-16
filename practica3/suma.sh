#!/bin/bash -u
echo "Introduzca un numero:"
read numero1
echo "Introduzca otro numero:"
read numero2
let respuesta=$numero1+$numero2
echo "$numero1 + $numero2 = $respuesta"
