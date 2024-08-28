-PARA LA TABLA CLIENTE:
1. En este caso, se importo la tabla del archivo clientes.xlsx como tabla. Se le llamo tablacorregida, del cual
ejecutamos los queries correspondientes a la totalidad de los registros y la tabla, tal como se muestra en la
imagen 1 y 2 respectivamente:

![image](https://github.com/user-attachments/assets/1e6e6325-1622-4cd7-8915-fcb809af938e)

Imagen 1:Elaboracion Propia

![image](https://github.com/user-attachments/assets/f51b3968-09b9-4276-9d82-51767e334978)

Imagen 2:Elaboracion Propia

OJO: para determinar los tipos de cada columna correspondientes a tablacorregida, pues se tuvo que analizar cada 
campo para el correcto uso. En este caso, fec_crea no nos permite convertir al formato deseado que es TIMESTAMP, 
por lo que en la insertacion de campos, pues se realizara la modificacion

1.A. Luego se realiza la creacion de una tabla vacia llamada tabla_cliente, del cual tiene las caracteristicas 
correspondientes igual al tipo de datos correspondiente a tablacorregida, asociando los tipos de valores de tablacorregida 
a tabla_cliente (Inciso 1.B) , tal como en la imagen 3 se le adjunta la query y el resultado: 

![image](https://github.com/user-attachments/assets/1f8240a0-ab25-460a-a2fc-a434deb5710a)

Imagen 3:Elaboracion Propia

2. Luego se realiza la insercion correspondiente a tabla_cliente. En este caso se usa la opcion nvl para los campos VAL_APE2,
VAL_NOM2, COD_SEXO; pues en el archivo del excel se observo que hay campos vacios, reemplazando estos campos a NULL debido
a la ausencia de valores. Ademas, en un inicio, el campo FEC_CREA de la tabla del excel llamada tablacorregida, pues se importo
como varchar(26) para no perder sus caracteristicas, ya que este tipo de archivos son de tipo TIMESTAMP y al realizar la configuracion
de tipo de dato, pues arrojaba un error debido a p. m. y a. m. (razon por la que se le realizara la modificacion correspondiente a TIMESTAMP
en la insercion y FEC_CREA de tabla_cliente es TIMESTAMP). Para ello, se tiene que detectar el segundo espacio de la cadena FEC_CREA de la tabla
tablacorregida, luego se selecciona todo el caracter (ya sea a. m. o p. m.) mediante un WHEN CASE y se reemplaza por AM o PM respectivamente.
Ahora, se realiza la conversion a la cadena modificada, usando TO_TIMESTAMP y el formato correspondiente 'MM/DD/YYYY HH:MI PM' o 'MM/DD/YYYY HH:MI AM'
(dependiedo si es PM o AM); usando el comando de ejemplo TO_TIMESTAMP(tablacorregida.FEC_CREA,'MM/DD/YYYY HH:MI PM'), especificando puntos en la imagen 4:

![image](https://github.com/user-attachments/assets/5fcf04c0-cabc-4f14-bbfe-933bdf4b4574)

Imagen 4:Elaboracion Propia

Al obtener los resultados de insercion correctos, pues renombramos a la tabla como clientes y ejecutamos COMMIT para guardar los cambios:

Luego ejecutamos las siguientes queries para ver la cantidad de filas totales en la tabla clientes y * para ver todos los campos ,generando la insercion correcta



-PARA LA TABLA PEDIDOS:

1. En este caso, se importo la tabla del archivo pedidos.xlsx como tabla. Se le llamo pedidoscorregido, del cual
ejecutamos los queries correspondientes a la totalidad de los registros y la tabla, tal como se muestra en la
imagen 1 y 2 respectivamente:

![image](https://github.com/user-attachments/assets/dca5eab0-59c6-461b-8a22-5d8d566d2975)

Imagen 1:Elaboracion Propia

![image](https://github.com/user-attachments/assets/3ddac9e3-ba08-4697-970c-edff6a79dc24)

Imagen 1:Elaboracion Propia

1.A. Luego se realiza la creacion de una tabla vacia llamada tabla_pedidos, del cual tiene las caracteristicas 
correspondientes igual al tipo de datos correspondiente a pedidoscorregido, asociando los tipos de valores de pedidoscorregido 
a tabla_pedidos (Inciso 1.B) , tal como en la imagen 3 se le adjunta la query y el resultado: 

![image](https://github.com/user-attachments/assets/98e7eef7-5f2a-4489-8a8a-16556a3c8915)


2. Luego se realiza la insercion correspondiente a tabla_pedidos. En este caso se usa la opcion nvl para los campos VAL_APE2,
VAL_NOM2, COD_SEXO; pues en el archivo del excel se observo que hay campos vacios, reemplazando estos campos a NULL debido
a la ausencia de valores, tal como se realiza en la siguiente query.

![image](https://github.com/user-attachments/assets/14e08ede-9eaa-4150-9cff-06d22a0dc0a5)


Luego se renombra la tabla de tabla_pedidos a pedidos, luego se ejecuta COMMIT para guardar los cambios


Por ultimo, se observa la consulta de datos de la insercion correspondiente, tal como se muestra en las imagenes: 

![image](https://github.com/user-attachments/assets/d2931b1c-8b41-4f42-81f9-f68b86dcf31e)
![image](https://github.com/user-attachments/assets/e13e11a1-2baa-47c1-8e88-b61f5fcef12d)



