# Tarea 5

10. Se pretende diseñar un guión shell llamado permisosraros.sh que reciba como parámetros uno o más directorios y devuelva un listado de los ficheros de esos directorios (y sus subdirectorios), que contenga aquellos con permisos que podemos considerar como “raros”. En particular, entendemos que un fichero tiene permisos “raros” cuando el usuario propietario del mismo no es “root” y además se cumple alguna de las siguientes dos condiciones: que el propietario no tenga permiso de lectura, o que no tenga permiso de ejecución cuando alguien del resto (grupo y otros) sı́ lo tiene.

Implementa el guión shell resolviendo los siguiente apartados:

a) Escribe una sola orden que devuelva un listado de los ficheros del directorio actual y subdirectorios de este, que contenga aquellos con permisos “raros”. En el listado debe aparecer el nombre del fichero (con ruta) y los permisos (como se hace en ls -l). Ejemplo de listado:
[alumno@localhost  ̃]$ orden
./dir1/b -rw-rwxr-x
./dir1/a --w--w----
./dir1/dir2/e -rw-rwxr--
./dir3/h -rw-rwxr--

b) Crea un guión llamado permisosraros.sh que reciba como parámetros uno o más directorios y devuelva el listado del apartado anterior, pero en este caso la salida tendrá una lista de usuarios propietarios de los ficheros ordenada alfabéticamente, junto con los ficheros de cada uno (y los permisos). No deberán aparecer aquellos usuarios que no tengan ningún fichero que cumpla la condición. Ejemplo:
[alumno@localhost  ̃]$ bash permisosraros.sh dir1 /home/alumno/dir3
alumno:
./dir1/b -rw-rwxr-x
./dir1/a --w--w----
usuar1:
./dir1/dir2/e -rw-rwxr--
./dir3/h -rw-rwxr--

c) Amplı́a el guión del apartado anterior para en lugar de mostrar los nombres de los ficheros precedidos de la ruta, ahora tras cada uno de los nombres de usuarios propietarios vendrá la lista de los directorios en los que hay algún fichero ordenados también alfabéticamente, y tras esto, la lista de los nombres de los ficheros detectados junto con los permisos. Ejemplo:
[alumno@localhost  ̃]$ bash permisosraros.sh dir1 /home/alumno/dir3
alumno:
./dir1:
--w--w----
a
-rw-rwxr-x
b
usuar1:
./dir1/dir2:
-rw-rwxr--
e
/home/alumno/dir3:
-rw-rwxr--
h

d) Vamos a considerar ahora el chequeo de los parámetros. Amplı́a el guión del apartado anterior para que compruebe que todos los argumentos pasados son directorios válidos. Si no lo son, habrá que mostrar un mensaje de uso por la salida estándar de error y devolver el código 1. Si no se pasa ningún argumento, se tomará como directorio el actual.

Todos los ejemplos asumen el siguiente árbol de directorios:

/home/alumno/dir1:
    --w--w---- 1 alumno alumno   10 may 27 21:26 a
    -rw-rwxr-x 1 alumno alumno   20 may 27 21:26 b
    -rw-rw-r-- 1 usuar1 usuar1   15 may 27 21:26 c
    -rwxrwxr-x 1 alumno alumno    7 may 27 21:33 d
    drwxrwxr-x 2 alumno alumno 4096 may 28 10:13 dir2
/home/alumno/dir1/dir2:
    -rw-rwxr-- 1 usuar1 usuar1  8 may 28 10:14 e
    -rwxrw-r-- 1 usuar1 usuar1 11 may 28 10:14 f
    -r-xr-xr-x 1 alumno alumno 17 may 28 10:14 g
/home/alumno/dir3:
    -rw-rwxr-- 1 usuar1 usuar1 3 may 28 10:14 h
    -rwxrw-r-- 1 alumno alumno 4 may 28 10:14 i
    -r-xr-xr-x 1 alumno alumno 5 may 28 10:14 j
