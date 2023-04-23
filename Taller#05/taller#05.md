# Investigación
## Para esta practica, profundice lo hablado en clase. Investigue los siguientes tópicos y de su opinión:
### 1. Compare las diferencias entre la planeación a corto plazo y largo plazo.

Objetivo:
- PLP: se centra en controlar la admisión de procesos nuevos al sistema.
- PCP: asigna la CPU a uno de los procesos en memoria que se encuentran en estado preparado.

Frecuencia de ejecución: 
- PLP: se ejecuta con una frecuencia relativamente baja y generalmente, cada vez que un trabajo completado abandona el sistema. 
- PCP: se ejecuta con mucha más frecuencia, cada vez que se produce una conmutación de procesos debido a un evento interno o externo.

Horizonte temporal: 
- PLP: tiene un horizonte temporal más largo, ya que se enfoca en la admisión de nuevos procesos al sistema y en mantener una mezcla equilibrada de trabajos. 
- PCP: tiene un horizonte temporal más corto, ya que se centra en la asignación de la CPU a procesos en estado preparado para maximizar el rendimiento del sistema en ese momento.

Complejidad de los algoritmos: 
- PLP: Debido a su baja frecuencia de ejecución, puede incorporar algoritmos relativamente complejos y computacionalmente intensivos para admitir trabajos al sistema. 
- PCP: debe tomar decisiones rápidas y eficientes para asignar la CPU, por lo que los algoritmos utilizados son más simples.


### 2. Caracterice dos procesos que se puedan considerar a mediano plazo.

El texto anterior trata sobre la función y el propósito del Planificador de Memoria Principal (PMP) en un sistema operativo. Explica cómo 
- El PMP tiene como misión traer procesos suspendidos a la memoria principal y controla la transición de procesos en situación de suspensión a situación de preparados. 
- El PMP permanece inactivo mientras se mantiene la condición que dio lugar a la suspensión del proceso y que el PMP intenta asignar al proceso la cantidad de memoria principal que requiere una vez que desaparece dicha condición. 
- El PMP debe tener información sobre las necesidades de memoria de los procesos suspendidos y que esta información puede almacenarse en el Bloque de Control de Proceso (BCP).
- El PMP puede ser invocado cuando quede espacio libre en memoria por la terminación de un proceso o cuando el suministro de procesos preparados quede por debajo de un límite especificado.


### 3. Describa las acciones que toma el kernel para el cambio de contexto entre procesos.

- Backup del contexto actual: El kernel guarda el contexto actual del proceso que se está ejecutando en la CPU. El contexto incluye la información del registro de la CPU, como los valores de los registros y el puntero de pila.

- Selección del siguiente proceso: El kernel selecciona el próximo proceso que se ejecutará, esto se hace por medio de una lista de procesos preparados anteriormente.

- Cambio de espacio de direcciones: Si el próximo proceso tiene un espacio de direcciones diferente al proceso anterior, el kernel debera cambiar el espacio de direcciones para el nuevo proceso, para esto, se debe ir actualizando las tablas de paginación y los registros de la CPU relevantes.

- Restauración del contexto: El kernel restaura el contexto del próximo proceso seleccionado en la CPU. Esto se hace restaurando los valores del registro de la CPU y el puntero de pila guardados previamente.

- Inicio de ejecución: Con el contexto del próximo proceso restaurado en la CPU y el kernel inicia la ejecución del proceso.


### 4. Defina las ventajas y desventajas desde el punto de vista del programador para comunicación síncrona y asíncrona.

#### comunicación síncrona
Ventajas:
- Es fácil de usar e implementar.
- Proporciona una comunicación más segura y confiable, ya que el emisor espera a que el receptor confirme que ha recibido el mensaje antes de continuar.
- Es útil para situaciones en las que el emisor y el receptor están estrechamente acoplados y necesitan comunicarse de manera confiable y en tiempo real.

Desventajas:
- Puede generar bloqueos si el emisor y el receptor se bloquean mutuamente mientras esperan una respuesta.
- Si el receptor está inactivo o demasiado ocupado para recibir el mensaje, el emisor puede quedarse esperando una respuesta que nunca llega.
- No es adecuada para situaciones en las que el emisor y el receptor están desconectados temporalmente o se comunican a través de redes inestables o de baja calidad.

#### comunicación asíncrona
Ventajas:
- Permite que el emisor y el receptor se comuniquen de manera independiente sin tener que esperar el uno al otro.
- No genera bloqueos ni espera activa, lo que la hace más eficiente.
- Es útil para situaciones en las que el emisor y el receptor están desconectados temporalmente o se comunican a través de redes inestables o de baja calidad.

Desventajas:
- Puede ser más difícil de implementar y depurar, ya que el emisor y el receptor tienen que manejar mensajes entrantes y salientes de manera independiente.
- Requiere más recursos de programación y planificación para garantizar que los mensajes se procesen correctamente y en el orden correcto
- Puede haber problemas de consistencia de datos si el emisor y el receptor no están sincronizados correctamente.


### 5. Defina las ventajas y desventajas desde el punto de vista del OS para envío por copia y envío por referencia.
#### envío por copia
Ventajas:
- Es más seguro y confiable, ya que el sistema operativo puede garantizar que los datos enviados a una función no se modifiquen por otras partes del programa.
- Es útil para situaciones en las que se necesita crear una copia de los datos para su posterior procesamiento o manipulación.
- No hay problemas de sincronización de datos entre diferentes procesos o hilos de ejecución.

Desventajas:
- Puede ser menos eficiente que el envío por referencia, ya que se debe copiar los datos en memoria antes de que se puedan procesar.
- Si se envían grandes cantidades de datos, puede ocupar demasiado espacio en la memoria, lo que puede ser problemático para sistemas con recursos limitados.

#### envío por referencia
Ventajas:
- Es más eficiente que el envío por copia, ya que no se necesita copiar los datos en memoria.
- Permite que los datos se compartan entre diferentes partes del programa, lo que puede ser útil en situaciones en las que se necesita acceder a los mismos datos desde diferentes funciones o módulos.
- Es útil para situaciones en las que se necesita actualizar los datos en tiempo real.

Desventajas:
- Puede generar problemas de sincronización de datos si varias partes del programa tienen acceso al mismo dato y lo modifican al mismo tiempo.
- Puede ser menos seguro que el envío por copia, ya que cualquier parte del programa con acceso al dato de referencia puede modificarlo.


### 6. Defina las ventajas y desventajas desde el punto de vista del OS para mensajes de tamaño fijo y de tamaño variable.
#### mensajes de tamaño fijo
Ventajas:
- Son más fáciles de implementar y gestionar, ya que el sistema operativo puede reservar un tamaño fijo de memoria para cada mensaje.
- Permiten una mejor planificación del uso de recursos, ya que el sistema operativo puede reservar una cantidad fija de recursos para cada mensaje.
- Pueden ser más eficientes en términos de tiempo de procesamiento, ya que el sistema operativo puede procesar mensajes de tamaño fijo más rápidamente que los de tamaño variable.

Desventajas:
- Pueden ser menos flexibles, ya que el tamaño fijo de los mensajes puede limitar la cantidad de información que se puede enviar en cada mensaje.
- Pueden desperdiciar memoria, ya que si se envía un mensaje que no utiliza todo el espacio reservado, el espacio restante se desperdicia.

#### mensajes de tamaño variable
Ventajas:
- Son más flexibles, ya que el tamaño de los mensajes puede ajustarse según las necesidades de la aplicación.
- Pueden ser más eficientes en términos de uso de memoria, ya que el espacio reservado para cada mensaje se ajusta al tamaño real del mensaje.
- Pueden permitir una mayor cantidad de información que se puede enviar en un solo mensaje.

Desventajas:
- Son más difíciles de implementar y gestionar, ya que el sistema operativo debe ser capaz de manejar diferentes tamaños de mensajes.
- Pueden ser menos eficientes en términos de tiempo de procesamiento, ya que el sistema operativo debe realizar más operaciones para manejar mensajes de tamaño variable que los de tamaño fijo.
- Pueden ser menos predecibles, ya que el tamaño variable de los mensajes puede dificultar la planificación del uso de recursos.

### 7. Describa los estados de un proceso.
- Nuevo: Este es el estado en el que se encuentra un proceso recién creado. El proceso aún no ha sido asignado a un procesador y está esperando para ser admitido por el sistema operativo.

- Listo: Una vez que el proceso ha sido admitido por el sistema operativo, se mueve al estado de Listo. En este estado, el proceso está esperando ser asignado a un procesador para su ejecución. El sistema operativo mantiene una lista de procesos en estado de Listo, ordenados por prioridad y listos para ser ejecutados.

- En ejecución: Cuando un procesador ha sido asignado al proceso, el proceso pasa al estado de En ejecución. En este estado, el proceso está activo y está ejecutando sus instrucciones.

- Bloqueado: Si el proceso necesita esperar por algún evento, como una entrada/salida, espera de un recurso, u otra tarea que requiera tiempo, pasa al estado Bloqueado. En este estado, el proceso no puede continuar su ejecución hasta que se complete el evento o se libere el recurso.

- Terminado: Cuando el proceso ha completado su ejecución, pasa al estado Terminado. En este estado, el sistema operativo libera todos los recursos asociados con el proceso, incluyendo la memoria y los procesadores.

- Suspensión: El estado de Suspensión no es un estado estándar en todos los sistemas operativos, pero algunos sistemas lo tienen. En este estado, el proceso ha sido temporalmente detenido y no está ejecutando sus instrucciones. Sin embargo, el proceso no ha sido terminado y puede ser reanudado posteriormente en el estado en el que se detuvo


### 8. Que datos se encuentran en un PCB.
Los tipos de datos depende del sistema operativo, los mas comunes serian:
- Identificación del proceso: El PCB contiene un identificador único para el proceso, que lo distingue de otros procesos en el sistema.
- Estado del proceso: El PCB mantiene un registro del estado actual del proceso, es decir, si está en ejecución, bloqueado, listo o terminado.
- Contador de programa: El PCB también almacena el valor del contador de programa del proceso, que indica la dirección de la próxima instrucción a ejecutar.
- Registro de propósito general: El PCB puede contener una copia de los registros de propósito general del procesador, que son necesarios para reanudar la ejecución del proceso después de una interrupción o cambio de contexto.
- Información de planificación: El PCB mantiene información relevante para la planificación de procesos, como la prioridad, el tiempo de espera, entre otros.
- Información de memoria: El PCB almacena información sobre la memoria asignada al proceso, como la dirección base y el límite superior.
- Información de entrada/salida: El PCB mantiene una lista de los recursos de entrada/salida asignados al proceso, así como su estado actual.
- Información de permisos y recursos: El PCB almacena información sobre los permisos y recursos que se han concedido al proceso.

### 9. Describa un modelo de comunicación Cliente-Servidor.

EEl modelo Cliente-Servidor es un patrón de comunicación que se utiliza para proporcionar servicios a través de una red de computadoras. En este modelo, un programa cliente envía solicitudes de servicios o recursos a un programa servidor a través de la red. El servidor procesa las solicitudes de los clientes y envía las respuestas de vuelta al cliente. Este modelo se compone de dos componentes principales: el cliente, que solicita servicios, y el servidor, que proporciona servicios. Se utiliza comúnmente en entornos de red para servicios como correo electrónico, archivos, bases de datos, entre otros.


