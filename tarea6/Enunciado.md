# Tarea 6 (repaso para el examen parcial)
Diseña un script llamado cambianumeros.sh que dado un fichero de entrada cambie los números entre 1 y 9 que aparezcan en forma escrita (uno, dos, tres, ...) en dicho fichero, por el dígito correspondiente (1, 2, 3, ...). El script recibirá dos parámetros, el primero de los cuales será el nombre del fichero de texto a procesar, y el segundo, el nombre del fichero donde se almacenará el texto procesado. Además, el script irá mostrando por pantalla los cambios realizados, siguiendo el formato: Línea x: w, y, z, donde x es el número de la línea, y w, y, z es el número de palabra dentro de la línea, comenzando a contar por 1, y número total de cambios realizados. Por último, el script también debe comprobar que se le han pasado exactamente 2 parámetros (de lo contrario avisará por salida estándar de error y devolverá el código 1) y que el primero de ellos es un fichero regular existente (de lo contrario avisará por salida estándar de error y devolverá el código 2).

A modo de ejemplo, si tenemos el fichero trescerditos.txt cuyo contenido es el siguiente:

Al lado de sus dos padres, tres cerditos habian crecido alegres en uno de los bosques
del condado. Y como los tres ya eran mayores, sus papas decidieron que era hora de que
construyeran, cada uno, su propia casa. Los tres cerditos se despidieron de sus papas,
y fueron durante ocho dias a ver como era el mundo, y encontraron un bonito lugar cerca
del bosque donde pensaron que iban a tener cero problemas.

Uno de los cerditos, muy trabajador, opto por construirse una casa de ladrillos y cemento.
Tardaria mas en construirla que los otros dos, pero estaria mas protegido. Despues de dos
dias de mucho trabajo, la casa quedo preciosa. Pero ya se empezaban a oir los ocho aullidos
del lobo en el bosque.

Y ejecutamos:

# bash cambianumeros.sh trescerditos.txt trescerditos_cambiado.txt

El script imprimirá por pantalla:

Línea 1: 5, 7, 13
Línea 2: 6
Línea 3: 3, 8
Línea 4: 4
Línea 5: 9
Línea 7: 1
Línea 8: 8, 15
Línea 9: 16
Número total de cambios: 12

Y se habrá generado un nuevo fichero llamado trescerditos_cambiado.txt con el siguiente contenido:

Al lado de sus 2 padres, 3 cerditos habian crecido alegres en 1 de los bosques
del condado. Y como los 3 ya eran mayores, sus papas decidieron que era hora de que
construyeran, cada 1, su propia casa. Los 3 cerditos se despidieron de sus papas,
y fueron durante 8 dias a ver como era el mundo, y encontraron un bonito lugar cerca
del bosque donde pensaron que iban a tener 0 problemas.

1 de los cerditos, muy trabajador, opto por construirse una casa de ladrillos y cemento.
Tardaria mas en construirla que los otros 2, pero estaria mas protegido. Despues de 2
dias de mucho trabajo, la casa quedo preciosa. Pero ya se empezaban a oir los 8 aullidos
del lobo en el bosque.
