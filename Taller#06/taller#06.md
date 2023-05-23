## Taller 06

### 1. Describa dos ejemplos en los que los mecanismos multihilo no proporcionen un mejor
### rendimiento que el monohilo:

- Si la tarea en cuestión es secuencial y no se puede dividir en subprocesos que se 
ejecuten simultáneamente, el enfoque monohilo puede ser más eficiente. 
- Si los hilos están compitiendo por recursos compartidos, como en el caso de las 
variables, pueden ocurrir bloqueos y cuellos de botella que disminuyan el rendimiento
en comparación con un enfoque monohilo.

### 2. Describa las acciones que toma una biblioteca de hilos para cambiar el contexto entre hilos de
### nivel de usuario.
Los hilos a nivel de usuario tienen como beneficio que su cambio de contexto es más
sencillo que el cambio de contexto entre hilos de kernel. A demás, se pueden
implementar aún si el SO no utiliza hilos a nivel de kernel. Otro de los beneficios
consiste en poder planificar diferente a la estrategia del SO. Por lo cual, se encuentra 
que a nivel de usuario puede contar con las mismas acciones que en modo kernel, pero 
con mayor flexibilidad a la hora de definir los metodos o acciones, por lo que puede contar
con una rama mas amplia, o reducida encuanto a la destion de hilos, esto con la ventaja de
que el SO no necesita contar con un sistema multihilo para realizar dichas tareas
de esta forma.

### 3. Los valores de los registros son componentes del estado de un programa, se comparten entre los
### hilos de un proceso multihilo? Si, no y porqué?
No. Cada hilo suele tener su propia memoria de pila y variables locales, aunque pueden compartir 
memoria global o compartida a través de estructuras de datos compartidas o segmentos de
memoria específicos. Compartir la memoria o trasladar un proceso de un hilo a otro, suele
ser un proceso bastante costoso a nivel de hardware, por lo que suele evitarse, ademas de que 
cada hilo cuenta con su propia memoria por lo que no se suele compartir la memoria o los datos
almacenados en esta.


### 4. Los cúmulos de memoria se comparten entre los hilos de un proceso multihilo? Si, no y porqué?
Si. Las variables globales pueden ser compartidas o no entre los hilos de un proceso multihilo,
dependiendo de cómo se gestionen. Si se utilizan variables globales sin ninguna protección o 
sincronización adecuada, pueden ocurrir condiciones de carrera y problemas de concurrencia. 
Sin embargo, si se utilizan mecanismos de sincronización, como bloqueos o semáforos, las variables
globales pueden ser compartidas de manera segura entre hilos.

### 5. Las variables globales se comparten entre los hilos de un proceso multihilo? Si, no y porqué?
Las variables globales pueden ser compartidas o no entre los hilos de un proceso multihilo, 
dependiendo de cómo se gestionen. Si se utilizan variables globales sin ninguna protección o 
sincronización adecuada, pueden ocurrir condiciones de competencia y problemas de concurrencia. 
Sin embargo, si se utilizan mecanismos de sincronización, como bloqueos o semáforos, las variables
globales pueden ser compartidas de manera segura entre hilos.

### 6. La memoria de pila se comparten entre los hilos de un proceso multihilo? Si, no y porqué?
No. Cada hilo tiene su propia pila donde se almacenan las variables locales y los contextos 
de ejecución. Esto permite a cada hilo tener su propio espacio de memoria independiente y 
evitar problemas de interferencia o corrupción de datos entre hilos.

### 7. En que ocasiones una solución multihilo que usa múltiples hilos del kernel proporciona mejor
### rendimiento que un solo hilo sobre un sistema monoprocesador.
El procesador al contar con un unico procesador tienede a relentizar el procesamiento, ya que solo 
puede manejar una tarea a la vez, al implementar el sistema multhilo se logra democratizar el uso
del procesador, dando tiempos de procesamiento con lo que se logra distribuir el costo de 
procesamiento de multiples procesos en un solo procesador. Esto repercute en poder realizar multiples
tareas en lugar de destinar todos los recursos a un solo proceso.


### 8. Puede una solución multihilo que utiliza múltiples hilos de usuario conseguir mejor rendimiento
### en un sistema multiprocesador que en un sistema de un solo procesador?
Si. El multihilo que utiliza múltiples hilos de usuario puede lograr un mejor rendimiento en un 
sistema multiprocesador en comparación con un sistema de un solo procesador. En un sistema 
multiprocesador, los hilos pueden distribuirse entre los diferentes núcleos de procesador, 
permitiendo la ejecución simultánea y paralela de múltiples tareas. Esto puede llevar a una 
mayor capacidad de procesamiento y un rendimiento mejorado en comparación con un sistema monoprocesador.

### 9. Suponga que el numero de hilos del usuario es mayor que el numero de procesadores del
### sistema. Explique el impacto sobre el rendimiento cuando el numero de hilos del kernel
### asignados al programa es menor que el numero de procesadores.
- Desperdicio de recursos: Si hay más hilos del usuario que procesadores disponibles, algunos hilos del usuario no podrán ejecutarse simultáneamente. Estos hilos pueden estar en espera o compitiendo por tiempo de CPU, lo que resulta en un desperdicio de recursos de procesamiento.

- Mayor latencia y tiempos de espera: Con más hilos del usuario que procesadores, los hilos pueden experimentar una mayor latencia y tiempos de espera. Si los hilos del kernel asignados son insuficientes para satisfacer la demanda de los hilos del usuario, estos últimos pueden quedarse inactivos o enfrentar esperas prolongadas antes de que se les asigne tiempo de CPU.

- Mayor sobrecarga de planificación: El sistema operativo debe realizar la planificación y administración de los hilos del usuario y del kernel. Con un número desequilibrado de hilos del usuario y del kernel, la sobrecarga de la planificación puede aumentar. El sistema operativo debe tomar decisiones más complejas para programar los hilos y administrar su ejecución, lo que puede llevar a una menor eficiencia y a una mayor carga en los recursos del sistema.

- Posibles bloqueos y condiciones de carrera: Si hay más hilos del usuario que procesadores y los hilos del kernel asignados son insuficientes, puede haber una mayor probabilidad de bloqueos y condiciones de carrera. Los hilos del usuario pueden competir por recursos compartidos, como variables o secciones críticas, lo que puede llevar a bloqueos y a una disminución del rendimiento general del sistema.






























