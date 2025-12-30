# 🔍🗂️Seccion17 : Tablas_en_indices_particionados📌

## 🧮 CLASE 165 — Introduccion al particionamiento
Tipos de particionamiento soportados en tablas e indices
------------------------------------------------------------
> #  📉RANGO
> - Clausula "MAXVALUE"
> - Habitual basado en fechas

> #  📉LISTA
> - lista de valores para cada particion
> - Podemos tener una particion de tipo DEFAULT a donde
> - van a parar las filas que no encajan en otra.

> #  📉HASH
> - Basado en una funcion hash
> - Numero fijo de particiones
> - Las filas acaban siempre en una particion

> #  📉COMPUESTO
> - Combinacion de los anteriores
> - Ejemplo: RANGO + HASH
> - Ejemplo: LISTA + HASH
> - Ejemplo: RANGO + LISTA
> - Ejemplo: RANGO + LISTA + HASH

## 🧮 CLASE 166 — CREAR TABLAS PARTICIONADAS DE TIPO RANGO

´´´sql
CREATE TABLE "RANGO"
(
CODIGO NUMBER NOT NULL,
DATOS  VARCHAR2(100)
)
PARTITION BY RANGE (codigo)
(
PARTITION P1 VALUES LESS THAN (10),
PARTITION P2 VALUES LESS THAN (20),
PARTITION P3 VALUES LESS THAN (30),
PARTITION P4 VALUES LESS THAN (40)
);

SELECT * FROM RANGO;

SELECT * FROM USER_PART_TABLES;-- VER LA TABLA PARTICIONADA
SELECT * FROM USER_TAB_PARTITIONS WHERE TABLE_NAME='RANGO';-- VER LAS PARTICIONES DE LA TABLA

´´´

## 🧮 CLASE 167 — Inserts y selects en tablas particionadas

´´´sql

INSERT INTO RANGO
VALUES (21, 'aaaa');

SELECT *
FROM RANGO;-- AQUI SE VE EL DATO INSERTADO

SELECT *
FROM RANGO PARTITION (P3);-- AQUI SE VE EL DATO INSERTADO EN LA PARTICION P3

INSERT INTO RANGO
VALUES (8, 'bbbb');

SELECT *
FROM RANGO PARTITION (P1);-- AQUI SE VE EL DATO INSERTADO EN LA PARTICION P1

SELECT *
FROM RANGO
WHERE CODIGO = 21;-- AQUI SE VE EL DATO INSERTADO

SELECT *
FROM RANGO
WHERE CODIGO > 21;
-- AQUI SE VE EL DATO INSERTADO MAYOR A 21

´´´

## 🧮 CLASE 168 — AÑADIR PARTICIONES EN PARTICIONES POR RANGO - MAXVALUE
> Oracle asigna los valores a las particiones por rango usando el criterio **"menos que"** (`LESS THAN`).  
>La partición `P5 VALUES LESS THAN (50)` incluye todos los valores menores a 50, es decir, desde 40 hasta 49. Por eso, cuando insertas el valor 40, cae en la partición `P5`.
>No es "hasta 49", sino "menor que 50", así que cualquier valor menor a 50 (incluyendo 40) va a esa partición. No cuenta -1, simplemente es menor que el valor especificado.

´´´sql
-- AHORA SI INSERTAMOS EL DATO
INSERT INTO RANGO
VALUES (40, 'KKKK');

SELECT *
FROM RANGO PARTITION (P5);-- AQUI SE VE EL DATO INSERTADO EN LA PARTICION P5



´´´
## 🧮 CLASE 169 — 