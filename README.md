-Para la tabla ciente
1. En este caso, se importo la tabla del archivo pedidos.xlsx como tabla. Se le llamo tablacorregida, del cual
ejecutamos los queries correspondientes a la totalidad de los registros y la tabla, tal como se muestra en la
imagen 1 y 2 respectivamente:
![image](https://github.com/user-attachments/assets/1e6e6325-1622-4cd7-8915-fcb809af938e)
![image](https://github.com/user-attachments/assets/f51b3968-09b9-4276-9d82-51767e334978)

OJO: para determinar los tipos de cada columna correspondientes a tablacorregida, pues se tuvo que analizar cada 
campo para el correcto uso. En este caso, fec_crea no nos permite convertir al formato deseado que es TIMESTAMP, 
por lo que en la insertacion de campos, pues se realizara la modificacion

1.A. Luego se realiza la creacion de una tabla vacia llamada tabla_cliente, del cual tiene las caracteristicas 
correspondientes igual al tipo de datos correspondiente a tablacorregida, en la imagen se le adjunta la query y el resultado: 
![image](https://github.com/user-attachments/assets/1f8240a0-ab25-460a-a2fc-a434deb5710a)

