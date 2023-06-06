## Taller # 10
### 1. Explique la diferencia entre los conceptos de fragmentación interna y externa.
- La fragmentación interna: ocurre cuando un proceso o programa asignado a un bloque de memoria tiene un tamaño menor que el tamaño del bloque en sí. Esto resulta en un desperdicio de espacio dentro del bloque de memoria. Por ejemplo si se asigna un bloque de memoria de 4 KB a un proceso que solo necesita 2 KB, los otros 2 KB restantes dentro del bloque se consideran fragmentación interna y no se pueden utilizar por otros procesos. 
- la fragmentación externa: se da cuando hay suficiente memoria total disponible para satisfacer las solicitudes de los procesos, pero no se pueden asignar debido a la falta de bloques de memoria contiguos lo suficientemente grandes para satisfacer las solicitudes. 

### 2. ¿En que forma el editor de montaje cambia el acoplamiento de las instrucciones y los datos a direcciones de memoria?
El editor puede realizar cambios en el acomplamiento de instruccionse de tres maneras:
- Tiempo de compilación: se puede generar código absoluto si conocemos la ubicación en memoria del proceso. Si el proceso reside en una ubicación dememoria con base R, el compilador comenzará allí y se extenderá. Si se cambia la ubicación R, el código debe ser recompilado.
- Tiempo de carga: si no conocemos la ubicación en memoria del proceso, se genera código reubicable. La asignación de memoria se realiza durante la carga, por lo que si cambia la dirección base R, solo es necesario recargar el código con el valor modificado.
- Tiempo de ejecución: si un proceso puede moverse entre segmentos de memoria, es necesario retrasar la reasignación hasta ese momento. Este enfoque requiere hardware especial y es utilizado por la mayoría de los OS de propósito general.
### 3. ¿Que información debe pasar el compilador al editor de montaje para facilitar el acoplamientode memoria de éste?
- Información de tamaño de datos e instrucciones: El compilador puede indicar al ensamblador el tamaño de las instrucciones y los datos utilizados en el programa.

- Tabla de símbolos: El compilador puede generar una tabla de símbolos que contenga información sobre los símbolos utilizados en el programa, como: etiquetas, variables y funciones. Esta tabla puede incluir los nombres de los símbolos y sus direcciones asociadas en la memoria. El ensamblador puede utilizar esta información para resolver las referencias a los símbolos y asignar las direcciones correctas durante el ensamblado.

- Información de paginación: En sistemas que utilizan técnicas de paginación de memoria, el compilador puede proporcionar información sobre las páginas utilizadas por el programa. Esto incluye la base y el límite de cada página, así como cualquier información adicional necesaria para el manejo de la memoria.

- Directivas o instrucciones especiales: El compilador puede emitir instrucciones especiales que indiquen al ensamblador como manejar ciertos aspectos relacionados con el acoplamiento de memoria.

### 4. En el siguiente orden, se tienen cinco particiones de memoria de 100 KB, 500 KB, 200 KB, 300 KB, y 600 KB. ¿Como situarían en memoria una serie de procesos de 212 KB, 417 KB, 112 KB y 426 KB en ese orden con los algoritmos de primer ajuste, mejor ajuste y peor ajuste? ¿Que algoritmo hace el uso más eficiente de la memoria?
Algoritmo de primer ajuste:
- Proceso de 212 KB: Se ubicaría en la primera partición de 500 KB, utilizando 212 KB de espacio y dejando un fragmento de 288 KB.
- Proceso de 417 KB: Se ubicaría en la partición de 600 KB, utilizando 417 KB de espacio y dejando un fragmento de 183 KB.
- Proceso de 112 KB: Se ubicaría en la partición de 300 KB, utilizando 112 KB de espacio y dejando un fragmento de 188 KB.
- Proceso de 426 KB: No hay una partición lo suficientemente grande para alojarlo, por lo que este proceso no puede ser situado en memoria.

Algoritmo de mejor ajuste:
- Proceso de 212 KB: Se ubicaría en la primera partición de 500 KB, utilizando 212 KB de espacio y dejando un fragmento de 288 KB.
- Proceso de 417 KB: Se ubicaría en la partición de 600 KB, utilizando 417 KB de espacio y dejando un fragmento de 183 KB.
- Proceso de 112 KB: Se ubicaría en la partición de 200 KB, utilizando 112 KB de espacio y dejando un fragmento de 88 KB.
- Proceso de 426 KB: Se ubicaría en la partición de 500 KB, utilizando 426 KB de espacio y dejando un fragmento de 74 KB.

Algoritmo de peor ajuste:
- Proceso de 212 KB: Se ubicaría en la partición de 600 KB, utilizando 212 KB de espacio y dejando un fragmento de 388 KB.
- Proceso de 417 KB: Se ubicaría en la partición de 600 KB, utilizando 417 KB de espacio y dejando un fragmento de 183 KB.
- Proceso de 112 KB: Se ubicaría en la partición de 200 KB, utilizando 112 KB de espacio y dejando un fragmento de 88 KB.
- Proceso de 426 KB: Se ubicaría en la partición de 500 KB, utilizando 426 KB de espacio y dejando un fragmento de 74 KB.

Ahora, evaluemos la eficiencia de los algoritmos en términos de la cantidad de memoria fragmentada:
- Algoritmo de primer ajuste: Deja fragmentos de 288 KB, 183 KB y un proceso de 426 KB no puede ser situado.
- Algoritmo de mejor ajuste: Deja fragmentos de 288 KB, 183 KB y 88 KB.
- Algoritmo de peor ajuste: Deja fragmentos de 388 KB, 183 KB y 88 KB.

Como resultado del anterior analisis se encuentra que el algoritmo de mejor ajuste genera la segmentacion mas eficiente ya que logra dejar los fragmentos en el menor tamaño posible respecto a los otros metodos.

### 5. La mayoría de OS permiten a los programas asignar más memoria a su espacio de direcciones durante la ejecución. ¿Que se necesitaría para soportar la asignación dinámica de memoria en los siguientes esquemas?
### - Asignación contigua de memoria.
- Reubicación y protección: El sistema operativo debe poder reubicar programas en tiempo de ejecución para acomodar su crecimiento y asignarles más memoria. Además, debe proporcionar mecanismos de protección de memoria para evitar que un programa acceda a la memoria asignada a otros programas.
- Compactación de memoria: Si los programas se asignan y liberan memoria de manera dinámica, la asignación contigua puede generar fragmentación externa. Por lo que el sistema operativo puede necesitar técnicas de compactación de memoria para consolidar los espacios vacíos y crear bloques contiguos más grande.
### - Segmentación pura.
- Tablas de segmentos: El sistema operativo debe mantener tablas de segmentos que contengan información sobre cada segmento de memoria asignado a un programa. Estas tablas deben incluir la dirección base y el tamaño de cada segmento, así como información de protección y reubicación si es necesario. Durante la asignación dinámica de memoria, el sistema operativo debe actualizar estas tablas para reflejar los cambios en la asignación de memoria.
- Algoritmos de asignación: El sistema operativo debe implementar algoritmos para asignar nuevos segmentos a los programas en tiempo de ejecución. Estos algoritmos deben encontrar segmentos de memoria disponibles y asignarlos de manera eficiente.
### -  Paginación pura.
- Tablas de páginas: El sistema operativo debe mantener tablas de páginas que indiquen la ubicación física de cada página de memoria asignada a un programa. Estas tablas deben ser actualizadas dinámicamente para reflejar los cambios en la asignación de memoria.
- Algoritmos de asignación: El sistema operativo debe implementar algoritmos de asignación de páginas que encuentren páginas de memoria disponibles y las asignen a los programas en tiempo de ejecución. Estos algoritmos deben considerar la fragmentación interna y externa para optimizar la asignación de páginas.
### 6. Compare los esquemas de organización de la memoria principal basados en una asignación continua de memoria, en una segmentación pura y una paginación pura con respecto a:
### - Fragmentación externa.
- Asignación continua de memoria: Tiene una alta probabilidad de fragmentación externa, ya que los programas se asignan de manera contigua y pueden dejar espacios vacíos entre ellos.
- Segmentación pura: La fragmentación externa puede ser baja o nula, ya que los segmentos pueden ubicarse en cualquier espacio disponible en la memoria. Sin embargo, puede haber fragmentación externa si los segmentos no se asignan y liberan de manera eficiente.
- Paginación pura: La fragmentación externa es mínima o nula, ya que las páginas se asignan de manera independiente y no requieren contigüidad física. No hay espacios vacíos entre las páginas, lo que minimiza la fragmentación externa.
### - Fragmentación interna.
- Asignación continua de memoria: Puede haber fragmentación interna, especialmente si el tamaño de los programas no coincide exactamente con el tamaño de las particiones de memoria. Esto se debe a que los programas deben ajustarse a las particiones, lo que puede resultar en espacios no utilizados dentro de cada partición.
- Segmentación pura: No hay fragmentación interna en este esquema, ya que los segmentos se asignan de acuerdo con sus tamaños individuales, sin espacios no utilizados dentro de ellos.
- Paginación pura: Puede haber fragmentación interna, ya que los programas se dividen en páginas y puede haber un desperdicio de espacio en la última página si el programa no ocupa toda su capacidad.
### - Capacidad de compartir código.
- Asignación continua de memoria: Puede haber problemas para compartir código entre programas, ya que los programas están asignados de manera contigua y no se pueden compartir regiones de memoria específicas fácilmente.
- Segmentación pura: Permite una mayor facilidad para compartir código, ya que los segmentos pueden asignarse a múltiples programas y compartirse entre ellos.
- Paginación pura: También permite la capacidad de compartir código, ya que las páginas pueden ser compartidas entre diferentes programas.

### 7. En un OS con paginación, un proceso no puede acceder a una zona de memoria que no sea de su propiedad.
### - ¿Por qué?
- Ya que cada proceso tiene su propio espacio de direcciones virtuales y las páginas de memoria asignadas a dicho proceso están protegidas por medio de mecanismos que protegen la memoria. Esto busca garantizar la seguridad y el aislamiento entre procesos. Si un proceso pudiera acceder a la memoria de otro proceso, podría modificar o corromper los datos del proceso objetivo, lo que podría llevar a comportamientos inesperados o inseguros del sistema.
### - ¿Como podía el OS permitir el acceso a otras zonas de memoria?
- El sistema operativo puede permitir el acceso a otras zonas de memoria mediante mecanismos controlados y seguros, como las llamadas de sistema o las interfaces de programación de aplicaciones (API) específicas. Estos mecanismos proporcionan funciones y servicios que permiten a los procesos solicitar acceso a la memoria de otros procesos de manera controlada.
### - ¿Por qué debería o por qué no debería?
- El acceso a otras zonas de memoria debe estar debidamente justificado y controlado. Permitir el acceso indiscriminado a la memoria de otros procesos puede llevar a problemas en la seguridad y privacidad, debido a que un proceso malicioso podría acceder, modificar o robar datos sensibles de otros procesos. Por lo tanto, permitir el acceso a otras zonas de memoria debe hacerse de manera selectiva y bajo circunstancias específicas y seguras, como operaciones de intercomunicación entre procesos controladas por el sistema operativo.
### 8. Compare el mecanismo de paginación con el de segmentación con respecto a la cantidad de memoria requerida por las estructuras de producción de direcciones para convertir las direcciones virtuales en direcciones físicas.
- Paginación: se utiliza una estructura de traducción de páginas que mapea las páginas virtuales a páginas físicas en la memoria. Esta estructura se conoce como tabla de páginas. La cantidad de memoria requerida para la tabla de páginas depende del tamaño de la memoria física y del tamaño de las páginas utilizadas. En general, la tabla de páginas necesita ser lo suficientemente grande como para abarcar todas las páginas virtuales posibles en el espacio de direcciones de un proceso. Esto significa que la cantidad de memoria requerida por la tabla de páginas aumenta linealmente con el tamaño de la memoria física y el tamaño de las páginas.

- Segmentación: se utiliza una estructura de tablas de segmentos que mapea los segmentos virtuales de direcciones físicas en la memoria. La cantidad de memoria requerida para las tablas de segmentos también depende del tamaño de la memoria física, pero no está relacionada directamente con el tamaño de los segmentos. En la segmentación, las tablas de segmentos deben ser lo suficientemente grandes como para cubrir todos los segmentos virtuales posibles en el espacio de direcciones de un proceso, independientemente de su tamaño. Esto significa que la cantidad de memoria requerida por las tablas de segmentos puede ser mayor que en el caso de paginación, especialmente si hay una gran cantidad de segmentos virtuales.

Como conlcusion, en términos de la cantidad de memoria requerida por las estructuras de traducción de direcciones, la paginación tiende a requerir menos memoria que la segmentación. 
