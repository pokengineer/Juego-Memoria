El objetivo del juego es recordar la mayor cantidad de palabras que fueron mostradas sin cometer errores y sin pasarse del tiempo l�mite. 

El juego funciona de la siguiente manera: 
	1. El script le muestra una palabra al jugador, por ejemplo, �tenedor� y luego borra la pantalla. 
	2. El jugador escribe la palabra que se le mostr� (siguiendo el ejemplo, escribe �tenedor�) y presiona enter. 
	3. El script muestra la primer palabra y una nueva palabra, por ejemplo, �tenedor cuchara� y borra la pantalla. 
	4. El jugador escribe las dos palabras, separadas por un enter. Por ejemplo: �tenedor� <enter> �cuchara� <enter>. 
	5. El script va agregando de a una palabra y el jugador las va escribiendo. Este proceso se repite hasta que el jugador ingrese mal la secuencia de palabras. 
	6. Cuando el jugador pierde, se muestran los mejores 3 puntajes, basados en la cantidad m�xima de palabras que se recordaron. 
 

A considerar: 
� El listado de palabras a mostrar se encontrar� en un archivo que se pasar� por par�metro al script. Dentro del archivo habr� una palabra por l�nea y si est� vac�o el script debe informarlo y no comenzar� el juego. 
� Las palabras se deben mostrar en orden aleatorio para que el juego no sea siempre igual. 
� El juego debe mostrar una cantidad infinita de palabras. Esto quiere decir que si el archivo de entrada tiene s�lo 3 palabras, el juego las ir� repitiendo para poder seguir agregando palabras. Por ejemplo, para un archivo con las siguientes palabras: �A�, �B� y �C�, es posible que el juego las muestre de la siguiente manera: �A A B A C B A B B C C B A B A B C ...�. 
� Debe haber un tiempo m�ximo de 5 segundos por palabra. Si se supera ese tiempo, el juego termina. Ese l�mite debe estar controlado por un timer. 
� Los mejores puntajes deben estar guardados en un archivo con formato CSV y cada l�nea debe tener el nombre del jugador y el puntaje. Un mismo jugador puede tener m�s de un puntaje. 

El script recibe los siguientes par�metros: 
� Ruta del archivo de palabras. 
� Ruta del archivo de puntajes.