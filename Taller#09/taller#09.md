## Taller#09
### 1. Considere la imagen, demuestre que las cuatro condiciones necesarias para que se produzca un interbloqueo se cumplen.
Para que se produzca un interbloqueo en un sistema, deben cumplirse las siguientes cuatro condiciones necesarias:
- Exclusión mutua: Al menos un recurso debe ser de uso exclusivo, lo que significa que solo un proceso puede acceder a él a la vez. Si un proceso ha obtenido el acceso a ese recurso, otros procesos deben esperar hasta que el recurso se libere. Por lo tanto si cada carril es un recurso y cada vehiculo es un proceso esperando poder continuar, en la imagen se muestra como estan saturados cada carril y estos se interconectan, lo que produce que los demas se detengan.
- Retención y espera: Un proceso que ya ha obtenido uno o más recursos puede retenerlos mientras espera la adquisición de otros recursos. Esto implica que el proceso no está dispuesto a liberar los recursos que ya posee, incluso si no los está utilizando en ese momento. Cada carril esta saturado, con lo que no existe forma de continuar el proceso, al interdepender los unos de los otros.
- No prelación (o espera circular): Existe una cadena circular de procesos en espera, donde cada proceso está esperando un recurso que está siendo retenido por el siguiente proceso en la cadena. En otras palabras, hay un ciclo en el grafo de asignación de recursos. En este caso, se evidencia que existe una codependencia entre los recursos, lo cual produce que se bloquen los demas carriles con la saturacion de uno.
- Espera o asignación no restringida: Los procesos deben ser capaces de solicitar nuevos recursos sin restricciones. Esto significa que no hay limitaciones o condiciones que impidan que un proceso solicite nuevos recursos mientras mantiene los recursos actuales. En este caso para que un vehiculo encuentre una via libre, ninguna via puede puede estar saturada ya que esto generara un trancon global, ya que las vias dependen una de otra.

### 2. Considere la imagen, enuncie una regla simple para evitar los interbloqueos en este sistema.
Una forma de garantizar que no se produzca esta condición es imponer una ordenación total de todos los tipos de recursos y requerir que cada proceso solicite sus recursos en un orden creciente de enumeración. Esto ya que el interbloqueo se da ya que existe una espera circular. 
### 3. Explique como se cumplen las condiciones básicas de interbloqueo en el problema de la cena de los filósofos.
- Exclusión mutua: Cada filósofo necesita tener en su poder ambos tenedores adyacentes para poder comer. Si un filósofo ya tiene uno de los tenedores y otro filósofo adyacente también lo tiene, entonces ambos filósofos no podrán comer simultáneamente. Esto crea una condición de exclusión mutua, donde solo un filósofo puede comer a la vez, lo que puede llevar a un interbloqueo si todos los filósofos intentan comer al mismo tiempo y están esperando que sus tenedores adyacentes estén disponibles.
- Retención y espera: Si un filósofo toma uno de los tenedores y no puede tomar el segundo tenedor porque está siendo utilizado por otro filósofo, el filósofo retiene el primer tenedor y espera pacientemente a que el segundo tenedor esté disponible. Durante este tiempo, el filósofo mantiene el primer tenedor ocupado sin liberarlo.
- espera circular: En la configuración clásica del problema de la cena de los filósofos, se puede formar una espera circular si todos los filósofos toman inicialmente su tenedor izquierdo y esperan a que el tenedor derecho esté disponible. Si todos los filósofos están esperando a que su tenedor derecho esté libre, se crea un ciclo en el que cada filósofo está esperando el tenedor que el siguiente filósofo está sosteniendo.
- Espera o asignación no restringida: En el problema de la cena de los filósofos, los filósofos pueden solicitar tenedores en cualquier momento sin restricciones. No hay limitaciones que impidan que un filósofo solicite ambos tenedores cuando los necesite para comer.

### 4. Explique como podría evitarse los interbloqueos impidiendo que se cumpla una de las condiciones en el problema de la cena de los filósofos.
Sin exclusion mutua, el bloqueo podria evitarse, para esto deberia permitirse que cada filosofo comiera con un unico tenedor, asi todos podrian comer a su ritmo y disposicion.

### 5. Compare el esquema de espera circular con los distintos esquemas de evasión de interbloqueos en lo que respecta a tiempo de ejecución adicional necesario.
- Evacion de interbloqueos: Este esquema de evacion se centra en evitar que surja la espera circular, por lo que el tiempo de procesamiento deberia ser optima para el problema.
- Algoritmo banquero: Destinaria los recursos de forma dinamica, mas no en el orden necesario para evitar esta condicion de interbloqueo, por lo que el tiempo adicional de procesamiento del sistema no seria optimo, y el sistema seria susptible de sufrir un interbloqueo. 

### 6. Compare el esquema de espera circular con los distintos esquemas de evasión de interbloqueos en lo que respecta a tasa de procesamiento del sistema.
- Evacion de interbloqueos: Este esquema de evacion se centra en evitar que surja la espera circular, por lo que la tasa de procesamiento deberia ser optima.
- Algoritmo banquero: Destinaria los recursos de forma dinamica, mas no en el orden necesario para evitar esta condicion de interbloqueo, por lo que la tasa de procesamiento del sistema no seria la optima, y el sistema seria susptible de sufrir un interbloqueo. 

### 7. Considere un sistema que tiene cuatro recursos del mismo tipo, compartidos entre tres procesos; cada proceso necesita como máximo dos recursos. Demuestre que el sistema esta libre de interbloqueos.
Por medio del algoritmo del banquero se puede asegurar que siempre existan recursos disponibles, ya que, como maximo cada proceso va a necesitar de dos recursos, lo que quiere decir que no necesariamente deben de emplear tantos recursos, por lo que por medio de este algoritmo se puede disribuir los recursos de forma dinamica entro los tres procesos sin que existan interbloqueos.

### 8. Considere el problema de los filósofos, los palillos se colocan en el centro de la mesa y cualquier filósofo puede usar dos palillos, la solicitud de los palillos se hace de una en una. Describa una regla simple para determinar si una solicitud podría ser satisfecha sin dar lugar a interbloqueos, dada la asignación actual de palillos a los filósofos.
La regla consistiria en que solo se puede solicitar los palillos si existen palillos disponibles, esto evitaria la espera circular como interbloqueo.
### 9. Cual es la suposición optimista realizada en el algoritmo de detección de interbloqueos y como podría violarse esta suposición?
El algoritmo de detección de interbloqueos se basa en una suposición optimista conocida como la suposición de asignación y liberación de recursos segura. Esta suposición establece que, si un proceso solicita una cierta cantidad de recursos, eventualmente se le podrán asignar esos recursos sin causar un interbloqueo.
La suposición optimista se puede violar si se permiten situaciones en las que un proceso retiene los recursos que ya ha adquirido y solicita recursos adicionales, lo que puede llevar a una espera indefinida de otros procesos y, finalmente, a un interbloqueo.









































