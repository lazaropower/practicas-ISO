# Tarea 4
Implementa un guión shell llamado capicuasinrev.sh que devuelva como código de salida 0 si el entero positivo dado como parámetro es capicúa y 1 en caso contrario. En la realización del ejercicio está prohibido usar la orden rev. Además, es obligatorio que el guión shell compruebe que el número de parámetros y el entero dado son correctos; si no es ası́, debe devolver 2 como código de salida y un mensaje de error que indique la sintaxis de la orden. Ejemplos de uso:

[alumno@localhost  ̃]$ bash capicuasinrev 3113
[alumno@localhost  ̃]$ echo $?
0
[alumno@localhost  ̃]$ bash capicuasinrev 3112
[alumno@localhost  ̃]$ echo $?
1
[alumno@localhost  ̃]$ bash capicuasinrev 43,5
Sintaxis: capicuasinrev enteropositivo
[alumno@localhost  ̃]$ echo $?
2
