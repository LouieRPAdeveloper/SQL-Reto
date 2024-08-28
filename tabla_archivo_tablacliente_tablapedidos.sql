--Para la tabla clientes
--1
-- 1.1.este es la tabla de los archivos en EXCEL llamado Clientes y previamente importada
SELECT * FROM tablacorregidacliente;
SELECT COUNT(*) FROM tablacorregidacliente;
--1.A.proceso de creacion de la nueva tabla llamada tabla_cliente, que tendra las 
--mismas propiedades que la tablacorregidacliente
-- Para el 1.B se asocia de acuerdo a las caracteristicas observadas en la tabla tablacorregida
CREATE TABLE tabla_cliente (
    COD_CLIE VARCHAR2(26),
    VAL_APE1 VARCHAR2(26),
    VAL_APE2 VARCHAR2(26),
    VAL_NOM1 VARCHAR2(26),
    VAL_NOM2 VARCHAR2(26),
    COD_SEXO CHAR(1),
    FEC_CREA TIMESTAMP,
    SAL_DEUD_ANTE NUMBER(38,2),
    FEC_NACI DATE
);

--2
--proceso de insercion de valores a la tabla de 1.A con los valores de la tabla 1.1
Insert INTO tabla_cliente (
    COD_CLIE, VAL_APE1, VAL_APE2, VAL_NOM1, VAL_NOM2, COD_SEXO, FEC_CREA, SAL_DEUD_ANTE, FEC_NACI
)

SELECT COD_CLIE, VAL_APE1, nvl(VAL_APE2,NULL), VAL_NOM1, nvl(VAL_NOM2,NULL), nvl(COD_SEXO,NULL),CASE 
    WHEN FEC_CREA LIKE '%p. m.%' THEN 
      TO_TIMESTAMP(REPLACE(FEC_CREA, SUBSTR(FEC_CREA, INSTR(FEC_CREA, ' ', 1, 2) + 1),'PM'),'MM/DD/YYYY HH:MI PM') 
    WHEN FEC_CREA LIKE '%a. m.%' THEN 
      TO_TIMESTAMP(REPLACE(FEC_CREA, SUBSTR(FEC_CREA, INSTR(FEC_CREA, ' ', 1, 2) + 1),'AM'),'MM/DD/YYYY HH:MI AM') 
  END , SAL_DEUD_ANTE, FEC_NACI   FROM tablacorregidacliente ;

-- para insertar completamente los cambios, se ejecuta commit
commit;

--renombramos la tabla final a Clientes:
RENAME tabla_cliente TO clientes;
commit;

--para ver los resultados de la tabla Clientes:
SELECT  * FROM clientes;

--SELECT CASE 
--    WHEN FEC_CREA LIKE '%p. m.%' THEN 
--      TO_TIMESTAMP(REPLACE(FEC_CREA, SUBSTR(FEC_CREA, INSTR(FEC_CREA, ' ', 1, 2) + 1),'PM'),'MM/DD/YYYY HH:MI PM') 
--    WHEN FEC_CREA LIKE '%a. m.%' THEN 
--      TO_TIMESTAMP(REPLACE(FEC_CREA, SUBSTR(FEC_CREA, INSTR(FEC_CREA, ' ', 1, 2) + 1),'AM'),'MM/DD/YYYY HH:MI AM') 
--  END FROM tablacorregidacliente;

--Para la TABLA PEDIDOS
-- Parte 1 - TABLA PEDIDOS
--AHORA CON LA TABLA PEDIDOS
-- 3. se procede con la tabla de Pedidos, previamente insertada desde Excel: 
select * from pedidoscorregido;

--4.1.A.creamos tabla_pedidos con las caracteristicas de la tabla del inciso 3
-- llamado tabla_pedidos

create table tabla_pedidos (
FEC_SOLI DATE,
COD_PERI VARCHAR2(38),
VAL_NUME_SOLI VARCHAR2(38),
FEC_FACT DATE,
VAL_ORIG VARCHAR2(26),
COD_CLIE VARCHAR2(26),
COD_REGI VARCHAR2(38),
COD_ZONA VARCHAR2(38),
COD_SECC CHAR(1),
SAL_DEUD_ANTE NUMBER(38,2),
VAL_MONT_ESTI NUMBER(38,2),
VAL_MONT_SOLI NUMBER(38,2),
VAL_ESTA_PEDI VARCHAR2(26),
MOT_RECH VARCHAR2(26),
VAL_MONT_FLET VARCHAR2(26),
VAL_UNID_LBEL NUMBER(38,2),
VAL_UNID_CYZO NUMBER(38,2),
VAL_UNID_ESIK NUMBER(38,2)
);

-- insertamos los valores correspondientes para la tabla_pedidos con los valores de
-- del inciso 4.1.A

--Parte 2 - TABLA PEDIDOS
-- Al analizar la tabla, observamos que hay valores nulos en excel, por lo que se 
-- Coloca el uso de nvl para reemplazarlo a NULL, al no existir valores

Insert INTO tabla_pedidos(FEC_SOLI,COD_PERI,VAL_NUME_SOLI,FEC_FACT,VAL_ORIG,COD_CLIE,COD_REGI,COD_ZONA,COD_SECC,SAL_DEUD_ANTE,VAL_MONT_ESTI,VAL_MONT_SOLI,VAL_ESTA_PEDI,MOT_RECH,VAL_MONT_FLET,VAL_UNID_LBEL,VAL_UNID_CYZO,VAL_UNID_ESIK)

SELECT FEC_SOLI,COD_PERI,VAL_NUME_SOLI,FEC_FACT,VAL_ORIG,COD_CLIE,COD_REGI,COD_ZONA,COD_SECC,SAL_DEUD_ANTE,nvl(VAL_MONT_ESTI, NULL),nvl(VAL_MONT_SOLI,NULL),VAL_ESTA_PEDI,nvl(MOT_RECH,NULL),nvl(VAL_MONT_FLET,NULL),VAL_UNID_LBEL,VAL_UNID_CYZO, VAL_UNID_ESIK FROM pedidoscorregido ;

--ejecutamos commit para la correcta ejecucion
commit;

--ejecutamos rollback en caso que queramos retroceder 
rollback ;

--renombramos la tabla final a Clientes y ejecutamos commit:
RENAME tabla_pedidos TO pedidos;
commit;

--comprobamos que coincide la cantidad de filas con la cantidad de filas del archivo inicial del inciso 3
select count(1) from pedidoscorregido;
select * from pedidoscorregido;


select count(1) from pedidos;
select * from pedidos;

DECLARE
  total_pedidos NUMBER;
BEGIN
  SELECT COUNT(*) INTO total_pedidos FROM pedidos;
  DBMS_OUTPUT.PUT_LINE('Hay ' || total_pedidos || ' pedidos.');
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;


