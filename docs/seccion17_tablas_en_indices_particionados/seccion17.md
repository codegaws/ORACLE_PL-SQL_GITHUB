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

```sql
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

```

## 🧮 CLASE 167 — Inserts y selects en tablas particionadas

```sql

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

```

## 🧮 CLASE 168 — AÑADIR PARTICIONES EN PARTICIONES POR RANGO - MAXVALUE
> Oracle asigna los valores a las particiones por rango usando el criterio **"menos que"** (`LESS THAN`).  
>La partición `P5 VALUES LESS THAN (50)` incluye todos los valores menores a 50, es decir, desde 40 hasta 49. Por eso, cuando insertas el valor 40, cae en la partición `P5`.
>No es "hasta 49", sino "menor que 50", así que cualquier valor menor a 50 (incluyendo 40) va a esa partición. No cuenta -1, simplemente es menor que el valor especificado.

```sql
-- AHORA SI INSERTAMOS EL DATO
INSERT INTO RANGO
VALUES (40, 'KKKK');

SELECT *
FROM RANGO PARTITION (P5);-- AQUI SE VE EL DATO INSERTADO EN LA PARTICION P5



```

## 🧮 CLASE 169 — MODIFICAR UNA FILA EN PARTICIONES

```sql
SELECT *
FROM RANGO;

UPDATE RANGO
SET CODIGO=22
WHERE CODIGO = 21;

UPDATE RANGO
SET CODIGO=7
WHERE CODIGO = 22;
-- TE VA A DAR UN ERROR SI NO HABILITAS LA OPCION ENABLE ROW MOVEMENT

-- ENABLAMOS LA OPCION
ALTER TABLE RANGO
    ENABLE ROW MOVEMENT;

-- COMPROBAMOS QUE LA OPCION ESTA HABILITADA- NO ES REQUERIDO PERO ES BUENA PRACTICA
SELECT *
FROM RANGO PARTITION (P1);
```

## 🧮 CLASE 170 — FUSIONAR PARTICIONES POR RANGOS

```sql
-- SE PUEDEN FUCiONAR PARTICIONES PARA OPTIMIZAR EL ESPACIO
SELECT *
FROM USER_TAB_PARTITIONS
WHERE TABLE_NAME = 'RANGO';

--FUSIONAMOS LAS PARTICIONES P3 Y P4
ALTER TABLE RANGO
    MERGE PARTITIONS P3,P4 INTO PARTITION P3_P4;

ALTER TABLE RANGO
    MERGE PARTITIONS P3,P6 INTO PARTITION P1_P6;
-- NO SE PUEDE DEBEN SER ADYACENTES

-- FUCIONANDO LAS PARTICIONES P5 A P7
ALTER TABLE RANGO
    MERGE PARTITIONS P5 TO P7 INTO PARTITION P5_P6_P7;
```

![imagen](images/img_2.png)

---
## 🧮 CLASE 171 — CREAR PARTICIONES POR LISTA DE VALORES

```sql
/***
PARTICIONAMIENTO POR LISTA EN TABLAS
------------------------------------
PARTITION BY LIST(columna,columna1)
(
PARTITION P1 VALUES (V1,V2),
PARTITION P2 VALUES (V1,V2),
PARTITION P3 VALUES (V1,V2,V3),
PARTITION P4 VALUES (DEFAULT),
)
*/

CREATE TABLE "LISTA"
(
    CODIGO  NUMBER NOT NULL,
    PAIS    VARCHAR2(100),
    CLIENTE VARCHAR2(100)
)
    PARTITION BY LIST
(
    PAIS
)
(
    PARTITION EUROPA VALUES ('ESPAÑA', 'FRANCIA', 'ITALIA'),
    PARTITION AMERICA VALUES ('ARGENTINA', 'BRASIL', 'CHILE'),
    PARTITION ASIA VALUES ('CHINA', 'JAPON', 'INDIA')
);

SELECT *
FROM USER_TAB_PARTITIONS
WHERE TABLE_NAME = 'LISTA';

-- Insertando datos en la tabla particionada por lista

INSERT INTO LISTA
VALUES (1, 'FRANCIA', 'CLIENTE1');

SELECT *
FROM LISTA;

SELECT *
FROM LISTA PARTITION (EUROPA);
-- TE DA EL RESULTADO DE LA PARTICION EUROPA

-- ACTUALIZANDO TABLA NO OLVIDAR QUE HAY Q HABILITAR ROW MOVEMENT

ALTER TABLE LISTA
    ENABLE ROW MOVEMENT;

UPDATE LISTA
SET PAIS='CHINA'
WHERE PAIS = 'FRANCIA';

```

![imagen](images/p1.png)

---

## 🧮 CLASE 172 — AÑADIR PARTICIONES A LISTAS CLAUSULA DEFAULT

```SQL
-- EN LISTAS CON VALORES DESCONOCIDOS SE USA DEFAULT ADEMAS NO ES COMO RANGOS DE VALORES

INSERT INTO LISTA
VALUES (2, 'USA', 'CLIENTE2');
-- DA ERROR PORQUE NO HAY PARTICION PARA USA

--AGREGAMOS AMERICA DEL NORTE
ALTER TABLE LISTA
ADD PARTITION AMERICA_NORTE VALUES ('USA','CANADA');

SELECT *
FROM LISTA;

SELECT *
FROM LISTA PARTITION (AMERICA_NORTE);

ALTER TABLE LISTA
ADD PARTITION OTROS VALUES (DEFAULT);

INSERT INTO LISTA
VALUES (3, 'NIGERIA', 'CLIENTE3');

SELECT *
FROM LISTA PARTITION (OTROS);

```
----
## 🧮 CLASE 173 — FUCIONAR PARTICIONES EN LISTA

```sql
-- EN RANGOS DEBEN SER ADYACENTES ENCAMBIO CON PARTICIONES DE TIPOS LISTA NO ES NECESARIO

--VER PARTICIONES
SELECT *
FROM USER_TAB_PARTITIONS
WHERE TABLE_NAME = 'LISTA';

--CAMBIAR NOMBRE A PARTICION
-- Renombrar la partición AMERICA a LATINOAMERICA
ALTER TABLE LISTA
RENAME PARTITION AMERICA TO LATINOAMERICA;

-- FUCIONAR PARTICIONES

ALTER TABLE LISTA
MERGE PARTITIONS LATINOAMERICA,AMERICA_NORTE INTO PARTITION AMERICA;
---
```
![images](images/img_1.png)

---
## 🧮 CLASE 174 — CREAR TABLAS HASH
```sql
/**
PARTICIONAMIENTO POR HASH
------------------------------------
PARTITION BY HASH (columna,columna1)
PARTITIONS 4

PARTITIONS
(
PARTITION P1,
PARTITION PS
....)
*/

CREATE TABLE TABLA_HASH
(
CODIGO NUMBER NOT NULL,
DATOS  VARCHAR2(100)
)
PARTITION BY HASH (CODIGO)
PARTITIONS 3;

--VER PARTICIONES
SELECT *
FROM USER_TAB_PARTITIONS
WHERE TABLE_NAME = 'TABLA_HASH';

```
---

## 🧮 CLASE 175 — BORRAR PARTICIONES



```sql
SELECT *
FROM USER_PART_TABLES;
```
![imagen](images/img_3.png)

```sql
select *
from USER_TAB_PARTITIONS
where TABLE_NAME = 'RANGO';
```
![imagen](images/img_4.png)

```SQL
-- BORRAMOS LA TABLA RANGO Y TODAS SUS PARTICIONES
ALTER TABLE
    RANGO
    DROP PARTITION P3_P4;
```

![imagen](images/img_5.png)

```sql
ALTER TABLE
    RANGO
    DROP PARTITION P1;

```

```sql
SELECT * FROM RANGO;

```
![imagen](images/img_6.png)

---
## 🧮 CLASE 177 — PARTICIONES COMPUESTAS RANGO - LISTA
```SQL
CREATE TABLE RANGO_LISTA
(
CODIGO NUMBER NOT NULL,
DATOS  VARCHAR2(100),
FECHA  date,
PAIS   VARCHAR2(50)
)
PARTITION BY RANGE (FECHA)
SUBPARTITION BY LIST
(
PAIS
)
(
PARTITION TRIMESTRE1 VALUES LESS THAN (TO_DATE('01-04-2023', 'dd-mm-yyyy'))
(
SUBPARTITION T1_P1 VALUES ('ESPAÑA', 'FRANCIA', 'ALEMANIA'),
SUBPARTITION T1_P2 VALUES ('ARGENTINA', 'CHILE'),
SUBPARTITION T1_P3 VALUES ('USA', 'CANADA'),
SUBPARTITION T1_P4 VALUES (DEFAULT)
),
PARTITION TRIMESTRE2 VALUES LESS THAN (TO_DATE('01-07-2023', 'dd-mm-yyyy'))
( SUBPARTITION T2_P1 VALUES ('ESPAÑA', 'FRANCIA', 'ALEMANIA'),
SUBPARTITION T2_P2 VALUES ('ARGENTINA', 'CHILE'),
SUBPARTITION T2_P3 VALUES ('USA', 'CANADA'),
SUBPARTITION T2_P4 VALUES (DEFAULT)
),
PARTITION TRIMESTRE3 VALUES LESS THAN (TO_DATE('01-10-2023', 'dd-mm-yyyy'))
( SUBPARTITION T3_P1 VALUES ('ESPAÑA', 'FRANCIA', 'ALEMANIA'),
SUBPARTITION T3_P2 VALUES ('ARGENTINA', 'CHILE'),
SUBPARTITION T3_P3 VALUES ('USA', 'CANADA'),
SUBPARTITION T3_P4 VALUES (DEFAULT)
),
PARTITION TRIMESTRE4 VALUES LESS THAN (TO_DATE('01-01-2024', 'dd-mm-yyyy'))
( SUBPARTITION T4_P1 VALUES ('ESPAÑA', 'FRANCIA', 'ALEMANIA'),
SUBPARTITION T4_P2 VALUES ('ARGENTINA', 'CHILE'),
SUBPARTITION T4_P3 VALUES ('USA', 'CANADA'),
SUBPARTITION T4_P4 VALUES (DEFAULT)
)
);


select *
from user_tab_partitions
where table_name = 'RANGO_LISTA';

select *
from user_tab_subpartitions
where table_name = 'RANGO_LISTA';


INSERT INTO RANGO_LISTA
VALUES (1, 'AAAA', TO_DATE('15-03-2023', 'dd-mm-yyyy'), 'USA');

INSERT INTO RANGO_LISTA
VALUES (2, 'BBBB', TO_DATE('15-03-2025', 'dd-mm-yyyy'), 'CHILE');


SELECT *
FROM RANGO_LISTA;

SELECT *
FROM RANGO_LISTA PARTITION (TRIMESTRE2);

SELECT *
FROM RANGO_LISTA SUBPARTITION (T5_P2);

SELECT *
FROM RANGO_LISTA SUBPARTITION (T1_P3);

--AGREGAR NUEVA PARTICION TRIMESTRE5
ALTER TABLE RANGO_LISTA
ADD PARTITION TRIMESTRE5 VALUES LESS THAN (TO_DATE('01-01-2026', 'dd-mm-yyyy'))
(
SUBPARTITION T5_P1 VALUES ('ESPAÑA', 'FRANCIA', 'ALEMANIA'),
SUBPARTITION T5_P2 VALUES ('ARGENTINA', 'CHILE'),
SUBPARTITION T5_P3 VALUES ('USA', 'CANADA'),
SUBPARTITION T5_P4 VALUES (DEFAULT)
);
```

## 🧮 CLASE 178 — INSERTS Y SELECT EN SUBPARTICIONES

```SQL
INSERT INTO RANGO_LISTA
VALUES (1, 'AAAA', TO_DATE('15-03-2023', 'dd-mm-yyyy'), 'USA');

INSERT INTO RANGO_LISTA
VALUES (2, 'BBBB', TO_DATE('15-03-2025', 'dd-mm-yyyy'), 'CHILE');


SELECT *
FROM RANGO_LISTA;

SELECT *
FROM RANGO_LISTA PARTITION (TRIMESTRE2);

SELECT *
FROM RANGO_LISTA SUBPARTITION (T5_P2);

SELECT *
FROM RANGO_LISTA SUBPARTITION (T1_P3);

```
---

## 🧮 CLASE 179 — INDICES PARTICIONADOS

> Los indices tambien pueden ser particionados
> Al igual que las tablas podemos particionar también los índices
de nuestras tablas
❑Por lo tanto podemos tener índices normales y también
podemos tener índices particionados.
❑Por ejemplo podemos tener una tabla normal pero tener un
índice particionado
❑O al revés tener una tabla particionada y tener índices
normales
❑Todo depende un poco de nuestras necesidades y de nuestros
tipos de consultas.
> Podemos tener dos tipos de índices particionados
❑Globales: que se particionan de forma totalmente independiente a la
tabla
❑Locales que están asociados a cada una de las particiones de la tabla
❑Los índices globales vienen muy bien para aplicaciones de
tipo transaccional (OLTP)
❑Los índices locales se utilizan normalmente para
aplicaciones de tipo data warehouse o de inteligencia de
negocio

---
## 🧮 CLASE 180 — EJEMPLOS INDICES PARTICIONADOS

```SQL
-- Tabla normal e índice particionado

drop table t1;

create table t1
(
    codigo number,
    datos  varchar2(50)
);

create index g1_t1 on t1 (codigo) global partition by hash (codigo) partitions 4;

select *
from user_ind_partitions
where index_name = 'G1_T1';


-- Tabla particionada e índice normal

drop table t2;
create table t2
(
    codigo number,
    datos  varchar2(50)
)
    PARTITION BY RANGE (codigo)
(
    PARTITION P1 VALUES LESS THAN (10),
    PARTITION P2 VALUES LESS THAN (20),
    PARTITION P3 VALUES LESS THAN (30),
    PARTITION P4 VALUES LESS THAN (40)
);

create index t2_i1 on t2 (datos);


-- Tabla particionada e índice global particionado

drop table t3;
create table t3
(
    codigo number,
    datos  varchar2(50)
)
    PARTITION BY RANGE (codigo)
(
    PARTITION P1 VALUES LESS THAN (10),
    PARTITION P2 VALUES LESS THAN (20),
    PARTITION P3 VALUES LESS THAN (30),
    PARTITION P4 VALUES LESS THAN (40)
);

create index g1_t3 on t3 (datos) global partition by hash (datos) partitions 4;

-- indices particionados locales

drop table t4;
create table t4
(
    codigo number,
    datos  varchar2(50)
)
    PARTITION BY RANGE (codigo)
(
    PARTITION P1 VALUES LESS THAN (10),
    PARTITION P2 VALUES LESS THAN (20),
    PARTITION P3 VALUES LESS THAN (30),
    PARTITION P4 VALUES LESS THAN (40)
);
--
create index t4_i1 on t4 (codigo) local;
select *
from user_ind_partitions
where index_name = 'T4_I1';

```