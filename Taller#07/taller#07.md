### 1. Por qué es importante para un planificador diferenciar entre un programa limitado por I/O y por CPU?
- Un programa limitado por I/O es aquel que espera a que se completen las operaciones de entrada/salida, como leer o escribir en disco, realizar operaciones de red o interactuar con dispositivos periféricos. Estas operaciones son relativamente lentas en comparación con el tiempo de procesamiento del CPU. En este caso, el tiempo de CPU utilizado por el programa es generalmente mínimo en comparación con el tiempo total que tarda en ejecutarse debido a las operaciones de entrada/salida.

- Por otro lado, un programa limitado por CPU es aquel que realiza operaciones computacionalmente intensivas y requiere una cantidad significativa de tiempo de CPU para su ejecución. Estos programas utilizan el tiempo de CPU de manera más activa y pueden consumir recursos del sistema durante períodos prolongados.

Debido a lo anterior se tiene que el consumo de recursos por I/O y CPU demandan ciertos recursos, los cuales son diferentes, por lo que gestionar este tipo de limitacion dara al planificador mejores resultados en el consumo de recursos.

### 2. Como entran en conflicto en determinadas configuraciones la utilización de CPU y tiempo de respuesta?
Cuando se permite que la utilización de la CPU sea muy alta, es probable que el tiempo de respuesta se vea afectado negativamente, ya que las solicitudes deben esperar su turno para ser procesadas. Por otro lado, si se prioriza en exceso el tiempo de respuesta y se limita la utilización de la CPU, es posible que no se estén aprovechando completamente los recursos del sistema y se produzca una subutilización de la capacidad de procesamiento. Por lo tanto se debe buscar un equilibrio entre los tiempos de respueta y la utilizacion de cpu.

### 3. Como entran en conflicto en determinadas configuraciones el tiempo medio de procesamiento y tiempo máximo de espera?
Al priorizarse el tiempo medio de procesamiento y buscar minimizarlo, es posible que las solicitudes se procesen rápidamente en su mayoría, lo que resulta en un tiempo medio de procesamiento bajo. Sin embargo, esto puede aumentar el riesgo de que algunas solicitudes experimenten un tiempo máximo de espera muy largo, ya que se da prioridad a otras tareas o solicitudes más rápidas.
Por otro lado, si se prioriza el tiempo máximo de espera y se busca minimizarlo, puede haber una tendencia a asignar más recursos y capacidad de procesamiento para asegurar que las solicitudes se atiendan dentro de un límite de tiempo estricto. Esto puede garantizar que el tiempo máximo de espera se mantenga bajo, pero puede aumentar el tiempo medio de procesamiento ya que los recursos se distribuyen de manera más uniforme entre las solicitudes.

### 4. Como entran en conflicto en determinadas configuraciones la utilización de los dispositivos I/O y la utilización de la CPU?
El conflicto surge cuando se busca optimizar tanto la utilización de los dispositivos I/O como la utilización de la CPU. Si se prioriza una alta utilización de los dispositivos I/O, es posible que se generen numerosas operaciones de entrada/salida, lo que puede resultar en un tiempo de espera prolongado para las solicitudes que requieren acceso a esos dispositivos. En este caso, la CPU puede estar esperando activamente para recibir o enviar datos a través de los dispositivos I/O, lo que resulta en una menor utilización de la CPU.
Por otra parte, al priorizar una alta utilización de la CPU, es posible que las operaciones de entrada/salida tengan que esperar a que la CPU esté disponible para procesarlas. Esto puede generar un cuello de botella en el rendimiento del sistema, ya que los dispositivos I/O están inactivos durante períodos de tiempo significativos, lo que resulta en una menor utilización de los dispositivos I/O.

### 5. Considere el siguiente conjunto de procesos, todos llegan al mismo tiempo en el orden del subíndice:

### 6. Cual es el tiempo de ejecución de cada proceso para cada algoritmo?
p1 - 10
p2 - 1
p3 - 2
p4 - 1
p5 - 5

El tiempo real dependera de la capacidad de computo de la maquina, pero de forma general se asigna un tiempo de definido coforme a la tabla.

### 7. Cual es el tiempo de espera de cada proceso para cada algoritmo?
El tiempo de espera de cada proceso en un algoritmo de planificación puede variar según el algoritmo utilizado y las características específicas del sistema, a continuación, describiré el tiempo de espera promedio para algunos algoritmos comunes de planificación de procesos:
- Algoritmo de planificación de Firts input, Firts output (FCFS):
  - En el algoritmo FCFS, el tiempo de espera de un proceso depende del orden en el que llegan los procesos y de la duración de los procesos anteriores en la cola.
  - Si un proceso llega después de que todos los procesos anteriores hayan completado su ejecución, el tiempo de espera será cero.
  - Sin embargo, si un proceso llega mientras otros procesos están siendo ejecutados, deberá esperar en la cola hasta que le toque su turno.
  - El tiempo de espera puede variar significativamente según el tiempo de ejecución de los procesos anteriores en la cola.

- Algoritmo de planificación de prioridad:
  - En un algoritmo de planificación de prioridad, el tiempo de espera de un proceso depende de la prioridad asignada a ese proceso y de la prioridad de los procesos en espera.
  - Los procesos con mayor prioridad tendrán menor tiempo de espera, ya que se les dará prioridad para ser ejecutados antes que los de menor prioridad.
  - Sin embargo, si hay muchos procesos con alta prioridad esperando, los procesos de menor prioridad pueden experimentar un tiempo de espera más largo antes de que se les asigne tiempo de CPU.

- Algoritmo de planificación por lotes (Batch):
  - En los algoritmos de planificación por lotes, como el algoritmo de planificación de tiempo compartido o round-robin, el tiempo de espera de un proceso puede variar según el número total de procesos en la cola y el quantum de tiempo asignado a cada proceso.
  - Si hay muchos procesos en espera, cada proceso tendrá que esperar su turno para recibir tiempo de CPU, lo que puede resultar en un tiempo de espera más largo.
  - Sin embargo, debido a que los procesos se programan en intervalos de tiempo llamados "quantum", el tiempo de espera para cada proceso se mantiene dentro del límite de su quantum asignado.

### 8. Que algoritmo puede dar lugar a bloqueos indefinidos?
El algoritmo de exclusión mutua basado en espera activa, como el algoritmo de Peterson, puede dar lugar a bloqueos indefinidos si no se implementa correctamente o si las condiciones adecuadas no se cumplen.

El algoritmo de Peterson es un algoritmo clásico que se utiliza para lograr la exclusión mutua en sistemas de dos procesos. Cada proceso tiene una variable booleana que indica su deseo de entrar en la región crítica. Sin embargo, si ambos procesos intentan entrar en la región crítica simultáneamente, puede ocurrir un bloqueo indefinido.

El bloqueo indefinido puede ocurrir si se dan las siguientes condiciones:

- Interbloqueo (deadlock): Si ambos procesos están esperando a que el otro libere su recurso, ninguno de los procesos podrá avanzar y ambos quedarán bloqueados indefinidamente.

- Starvation (inanición): Si uno de los procesos siempre se ve obstaculizado por el otro proceso y nunca obtiene acceso a la región crítica, puede sufrir de inanición. Esto significa que el proceso se queda esperando permanentemente y nunca puede avanzar.

### 9. Considere un sistema que implementa una planificación por colas multinivel. Que estrategia puede utilizar una computadora para maximizar la cantidad de tiempo de CPU asignada al proceso del usuario?
La prioridad dinámica implica ajustar la prioridad de los procesos en función de su comportamiento y necesidades en tiempo real. A medida que los procesos se ejecutan, la computadora puede monitorear su rendimiento y ajustar sus prioridades para maximizar la utilización de la CPU y brindar una experiencia óptima al usuario.

Existen varias técnicas para implementar la prioridad dinámica en un sistema de planificación por colas multinivel:
- Retroalimentación de prioridad: Los procesos que requieren más tiempo de CPU y tienen una alta tasa de uso pueden recibir una prioridad más alta para que se les asigne más tiempo de CPU en el futuro. Esto permite que los procesos más activos reciban una mayor asignación de recursos.
- Prioridad basada en el historial de ejecución: La computadora puede mantener un registro del historial de ejecución de cada proceso, incluyendo su tiempo de CPU utilizado y su comportamiento en términos de eficiencia y cumplimiento de plazos. Utilizando esta información, la prioridad de un proceso se puede ajustar dinámicamente en función de su desempeño pasado.
- Prioridad basada en el tipo de trabajo: Algunos sistemas pueden clasificar los procesos en diferentes categorías o tipos de trabajo, como procesamiento intensivo, E/S intensivo, interactivos, etc. Cada categoría puede tener una prioridad asignada, y la computadora puede ajustar dinámicamente la prioridad de los procesos en función de su tipo de trabajo para maximizar la utilización de la CPU según las necesidades del sistema y del usuario



































