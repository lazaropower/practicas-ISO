#!/bin/bash -u
echo "Inicio del guion $0"
echo "El PID de $0 es $$"
echo "Llamando al guion ’num’"
./num.sh
res=$?
echo "El guion ’num’ ha devuelto el valor $res"
echo "Fin del guion $0"
