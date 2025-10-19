![Mi Base de Datos](assets/title.svg)

# 📖 SQL — Consultas, Operadores y Funciones

Un archivo con estilo para tu GitHub, manteniendo todo tu contenido original y enriqueciéndolo con títulos, secciones, y emojis para facilitar su lectura y uso.

---

## 📝 Cambiar Formato de Columnas

```sql
-- Entre comillas si deseas cambiar el formato ""
SELECT FIRST_NAME, last_name, salary AS "Salario Empleado" FROM EMPLOYEES;
```

---

## ➕ Operadores Básicos

```
+ SUMA
- RESTA
* MULTIPLICACION
/ DIVISION
```

```sql
SELECT FIRST_NAME, SALARY, SALARY*12 AS "Salario Anual", 20*10 AS "EJEMPLO" FROM EMPLOYEES;
```

---

## 🏷️ CLASE 45 — LITERALES

```sql
SELECT 'NOMBRE:', FIRST_NAME FROM EMPLOYEES;

SELECT 'NOMBRE:' || FIRST_NAME || ' ' || LAST_NAME AS "NOMBRE EMPLEADO" FROM EMPLOYEES;
```

---

## 🧮 CLASE 47 — TABLA DUAL

```sql
SELECT 4+3, FIRST_NAME FROM EMPLOYEES;

SELECT 4+3, 'ES EL RESULTADO' FROM DUAL;

DESC DUAL;
```

---

## ⚠️ CLASE 48 — NULOS (NULL)

```sql
SELECT FIRST_NAME, SALARY, COMMISSION_PCT, SALARY*COMMISSION_PCT AS "SALARIO TOTAL" FROM EMPLOYEES;
```

---

## 🔁 CLASE 49 — DISTINCT (Agrupa datos duplicados)

```sql
SELECT * FROM EMPLOYEES;

SELECT FIRST_NAME, DEPARTMENT_ID FROM EMPLOYEES;

SELECT DISTINCT DEPARTMENT_ID FROM EMPLOYEES;

SELECT DISTINCT DEPARTMENT_ID, JOB_ID FROM EMPLOYEES;
```

---

## 🔍 CLASE 52 — WHERE (Filtrar filas por condición)

/*
OPERADORES DE COMPARACION MAS COMUNES:
= , >=, <, >, <=, <>
*/

```sql
SELECT * FROM EMPLOYEES WHERE DEPARTMENT_ID = 50;

SELECT FIRST_NAME, SALARY FROM EMPLOYEES WHERE SALARY = 4000;

SELECT FIRST_NAME FROM EMPLOYEES WHERE DEPARTMENT_ID <> 50;
```

---

## 🔢 CLASE 53 — Condiciones con Literales

```sql
SELECT FIRST_NAME, LAST_NAME FROM EMPLOYEES WHERE FIRST_NAME = 'John';
```

---

## 📆 CLASE 54 — Comparar Fechas

```sql
SELECT * FROM EMPLOYEES;

SELECT * FROM EMPLOYEES WHERE HIRE_DATE = '21-09-05';

SELECT * FROM EMPLOYEES WHERE HIRE_DATE > '21-09-05';
```

---

## 🔁 CLASE 56 — BETWEEN (Rangos en Comparación)

```sql
SELECT * FROM EMPLOYEES WHERE SALARY BETWEEN 5000 AND 6000;

SELECT * FROM EMPLOYEES WHERE HIRE_DATE BETWEEN '01-01-07' AND '01-01-09';

SELECT * FROM EMPLOYEES WHERE FIRST_NAME BETWEEN 'Douglas' AND 'Steven';
```

---

## 🎯 CLASE 57 — IN (Buscar valores en una lista)

```sql
SELECT * FROM EMPLOYEES WHERE DEPARTMENT_ID IN(50,60);

SELECT * FROM EMPLOYEES WHERE JOB_ID IN ('SH_CLERK','ST_CLERK','ST_MAN');
```

### 🧪 Práctica BETWEEN & IN

```sql
SELECT * FROM EMPLOYEES WHERE DEPARTMENT_ID BETWEEN 50 AND 60;

SELECT * FROM EMPLOYEES WHERE HIRE_DATE BETWEEN '01-01-02' AND '31-12-04';

SELECT * FROM EMPLOYEES WHERE LAST_NAME BETWEEN 'D' AND 'H';

SELECT * FROM EMPLOYEES WHERE DEPARTMENT_ID IN(30,60,90);

SELECT * FROM EMPLOYEES WHERE JOB_ID IN('IT_PROG','PU_CLERK');

SELECT * FROM LOCATIONS;

SELECT * FROM LOCATIONS WHERE COUNTRY_ID IN('UK','JP');
```

---

## 🔎 CLASE 59 — LIKE (Buscar patrones en cadenas)

```
LIKE 'PATRON'
% (cualquier número de caracteres)
_ (un solo caracter)
```

```sql
SELECT * FROM EMPLOYEES WHERE FIRST_NAME LIKE 'J%';

SELECT * FROM EMPLOYEES WHERE FIRST_NAME LIKE '_e%';

SELECT * FROM EMPLOYEES WHERE FIRST_NAME LIKE '%te%';
```

> **Nota:** LIKE consume mucha memoria, úsalo con cuidado.

### 🧪 Práctica LIKE

```sql
SELECT * FROM EMPLOYEES WHERE FIRST_NAME LIKE 'J%';
SELECT * FROM EMPLOYEES WHERE FIRST_NAME LIKE 'S%n';
SELECT * FROM COUNTRIES;
SELECT * FROM COUNTRIES WHERE COUNTRY_NAME LIKE '_r%';
```

---

## ❓ CLASE 61 — IS NULL / IS NOT NULL

```sql
SELECT * FROM EMPLOYEES WHERE COMMISSION_PCT = NULL; -- No tiene sentido

SELECT * FROM EMPLOYEES WHERE COMMISSION_PCT IS NULL;

SELECT * FROM LOCATIONS;
SELECT * FROM LOCATIONS WHERE STATE_PROVINCE IS NULL;

SELECT * FROM EMPLOYEES;
SELECT FIRST_NAME, SALARY, COMMISSION_PCT, SALARY+(SALARY*COMMISSION_PCT) AS "Salario Total"
FROM EMPLOYEES WHERE COMMISSION_PCT IS NOT NULL;
```

---

## 🔗 CLASE 63 — AND, OR, NOT (Múltiples condiciones)

/*
AND C1 AND C2 --> TRUE
OR  C1 OR C2  --> TRUE
NOT C1 --> TRUE para negar una condición
*/

```sql
SELECT * FROM EMPLOYEES WHERE SALARY > 5000 AND DEPARTMENT_ID = 50;

SELECT * FROM EMPLOYEES WHERE SALARY > 5000 OR DEPARTMENT_ID = 50;

SELECT * FROM EMPLOYEES WHERE DEPARTMENT_ID NOT IN(50,60);
```

---

## 🔀 CLASE 64 — Combinaciones de AND / OR

/*
C1 AND C2 TRUE TRUE   --> TRUE
C1 AND C2 TRUE FALSE  --> FALSE
C1 AND C2 FALSE FALSE --> FALSE
C1 OR C2  TRUE TRUE   --> TRUE
C1 OR C2  TRUE FALSE  --> TRUE
C1 OR C2 FALSE FALSE  --> FALSE
*/

```sql
SELECT FIRST_NAME, SALARY, DEPARTMENT_ID, HIRE_DATE FROM EMPLOYEES
WHERE SALARY > 5000 AND DEPARTMENT_ID = 50 AND HIRE_DATE > '01-01-05';
```

### 🧪 Práctica AND / OR / NOT

```sql
SELECT * FROM EMPLOYEES;
SELECT FIRST_NAME, HIRE_DATE, JOB_ID FROM EMPLOYEES WHERE JOB_ID = 'IT_PROG' AND SALARY > 6000;

SELECT * FROM EMPLOYEES WHERE FIRST_NAME LIKE 'S%' AND SALARY > 3000 AND (DEPARTMENT_ID = 50 OR DEPARTMENT_ID = 80);

SELECT * FROM EMPLOYEES WHERE JOB_ID = 'IT_PROG' AND PHONE_NUMBER LIKE '5%' AND HIRE_DATE BETWEEN '01-01-07' AND '31-12-07';
```

---

## 🧩 CLASE 66 — ORDER BY (Ordenar resultados)

```sql
SELECT * FROM EMPLOYEES ORDER BY SALARY DESC;

SELECT FIRST_NAME, LAST_NAME, SALARY FROM EMPLOYEES
WHERE FIRST_NAME = 'David'
ORDER BY FIRST_NAME, LAST_NAME;

SELECT FIRST_NAME, LAST_NAME, SALARY FROM EMPLOYEES
WHERE FIRST_NAME = 'David'
ORDER BY FIRST_NAME, SALARY DESC;

SELECT FIRST_NAME, SALARY*12 AS SALARIO FROM EMPLOYEES
ORDER BY SALARIO;

SELECT FIRST_NAME, SALARY*12 FROM EMPLOYEES
ORDER BY 2;

SELECT FIRST_NAME, SALARY*12 AS TOTAL FROM EMPLOYEES
ORDER BY TOTAL DESC;
```

---

## 🎯 CLASE 68 — FETCH (Limitar el número de filas)

```sql
SELECT FIRST_NAME, SALARY FROM EMPLOYEES;

SELECT FIRST_NAME, SALARY FROM EMPLOYEES ORDER BY SALARY DESC FETCH FIRST 5 ROWS ONLY;

SELECT FIRST_NAME, SALARY FROM EMPLOYEES ORDER BY SALARY DESC FETCH FIRST 7 ROWS WITH TIES;

SELECT FIRST_NAME, SALARY FROM EMPLOYEES ORDER BY SALARY DESC OFFSET 5 ROWS FETCH FIRST 5 ROWS WITH TIES;

SELECT * FROM EMPLOYEES FETCH FIRST 20 PERCENT ROWS ONLY;
```

---

## 📚 CLASE 69 — FUNCIONES

```
- Permiten operaciones y expresiones en SQL
- Tipos: numéricas, de cadenas, fechas, propósito general
- Formato: SELECT COLUMNA, FUNCION(PARAMETRO) FROM TABLA
- Sin parámetros: SYSDATE, USER
- Varios argumentos: SUBSTR(CADENA,POSICION,LONGITUD)
- Anidamiento: se pueden anidar funciones
- Ejemplo: 
    SUBSTR('hola',1,2) -> ho
    UPPER(SUBSTR('hola',1,2)) -> HO
```

---

## 🔡 CLASE 70 — Funciones UPPER, LOWER, INITCAP

```sql
SELECT EMAIL, LOWER(EMAIL) FROM EMPLOYEES;

SELECT FIRST_NAME, UPPER(FIRST_NAME) FROM EMPLOYEES;

SELECT INITCAP('ESTO ES UNA PRUEBA') FROM DUAL; -- Pone de tipo oración
```

---

## 🗃️ CLASE 71 — Funciones en la cláusula WHERE

```sql
SELECT FIRST_NAME, LAST_NAME FROM EMPLOYEES
WHERE UPPER(FIRST_NAME) = 'DAVID';
```

---

## 🔗 CLASE 72 — Funciones CONCAT y anidamiento

```sql
SELECT FIRST_NAME || ' ' || LAST_NAME FROM EMPLOYEES;

SELECT CONCAT(FIRST_NAME, LAST_NAME) FROM EMPLOYEES;

SELECT CONCAT(FIRST_NAME, CONCAT(' ', LAST_NAME)) FROM EMPLOYEES;
```

---

## 🔢 CLASE 73 — Función LENGTH (Longitud de cadenas)

```sql
SELECT FIRST_NAME, LENGTH(FIRST_NAME) FROM EMPLOYEES;

SELECT FIRST_NAME FROM EMPLOYEES WHERE LENGTH(FIRST_NAME) = 6;
```

---

## ✂️ CLASE 74 — Función SUBSTR (Subcadenas)

```sql
SELECT FIRST_NAME, SUBSTR(FIRST_NAME, 1, 3) FROM EMPLOYEES;

SELECT FIRST_NAME, SUBSTR(FIRST_NAME, 3) FROM EMPLOYEES;

SELECT FIRST_NAME, SUBSTR(FIRST_NAME, LENGTH(FIRST_NAME), 1) FROM EMPLOYEES;
```

---

## 📍 CLASE 75 — Función INSTR (Posición de subcadena)

```sql
SELECT FIRST_NAME, INSTR(FIRST_NAME, 'a') FROM EMPLOYEES;

SELECT FIRST_NAME, INSTR(FIRST_NAME, 'a') FROM EMPLOYEES
WHERE INSTR(FIRST_NAME, 'a') <> 0;

SELECT FIRST_NAME, INSTR(LOWER(FIRST_NAME), 'a') FROM EMPLOYEES
WHERE INSTR(LOWER(FIRST_NAME), 'a') <> 0;

/* 
Explicación: 
- Busca empleados cuyo nombre contiene 'a' (minúscula o mayúscula)
- Muestra la posición donde aparece por primera vez
- LOWER() permite buscar sin importar mayúsculas/minúsculas
*/
SELECT FIRST_NAME, INSTR(UPPER(FIRST_NAME), 'A') FROM EMPLOYEES
WHERE INSTR(FIRST_NAME, 'A') <> 0;

SELECT FIRST_NAME, INSTR(LOWER(FIRST_NAME), 'a', 4) FROM EMPLOYEES
WHERE INSTR(LOWER(FIRST_NAME), 'a', 4) <> 0;
```

---

## ⬅️➡️ CLASE 76 — LPAD/RPAD (Rellenar cadenas)

```sql
SELECT FIRST_NAME FROM EMPLOYEES;
SELECT RPAD(FIRST_NAME, 20, '*') FROM EMPLOYEES; -- derecha
SELECT LPAD(FIRST_NAME, 20, '*') FROM EMPLOYEES; -- izquierda
```

---

## 🧼 CLASE 77 — Funciones REPLACE, LTRIM, RTRIM

```sql
SELECT REPLACE(FIRST_NAME, 'a', '*') FROM EMPLOYEES;

SELECT RTRIM('HOLA         ') || ' ADIOS' FROM DUAL;

SELECT 'ALBERTO ' || LTRIM('                 PEREZ') FROM DUAL;

SELECT FIRST_NAME, RTRIM(FIRST_NAME, 'm') FROM EMPLOYEES;
```

---

## 📝 PRÁCTICA — Funciones de tipo carácter

*(Agrega aquí tus propias consultas de práctica)*

-- • En la tabla LOCATIONS, averiguar las ciudades que son de Canada o
-- Estados unidos (Country_id=CA o US) y que la longitud del nombre de la
-- calle sea superior a 15.

SELECT CITY,COUNTRY_ID
FROM LOCATIONS
WHERE COUNTRY_ID IN('CA','US')
AND LENGTH(STREET_ADDRESS) >15;

/*
• Muestra la longitud del nombre y el salario anual (por 14) para los
empleados cuyo apellido contenga el carácter 'b' después de la 3ª
posición.
*/
SELECT FIRST_NAME, LENGTH(FIRST_NAME), LAST_NAME, SALARY * 14 AS "SALARIO ANUAL"
FROM EMPLOYEES
WHERE INSTR(LAST_NAME, 'b') > 3;

/*
Averiguar los empleados que ganan entre 4000 y 7000 euros y que
tienen alguna 'a' en el nombre. (Debemos usar INSTR y da igual que sea
mayúscula que minúsculas) y que tengan comisión.
*/

SELECT *
FROM EMPLOYEES
WHERE SALARY BETWEEN 4000 AND 7000
AND INSTR(LOWER(FIRST_NAME), 'a') <> 0
AND COMMISSION_PCT IS NOT NULL;

# EXPLICACION
Si no pones `<> 0` en la función INSTR, obtienes un resultado diferente:

## Sin `<> 0`:
```sql
SELECT *
FROM EMPLOYEES
WHERE SALARY BETWEEN 4000 AND 7000
  AND INSTR(LOWER(FIRST_NAME), 'a')
  AND COMMISSION_PCT IS NOT NULL;
```

## ¿Qué ocurre?

**INSTR** devuelve:
- **0** = La letra 'a' NO está en el nombre
- **Número positivo** = La posición donde está la letra 'a'

En Oracle, las condiciones se evalúan como:
- **0** = FALSE
- **Cualquier número distinto de 0** = TRUE

## Resultado práctico:

**CON `<> 0`**: Busca empleados que tienen la letra 'a' en el nombre
**SIN `<> 0`**: También busca empleados que tienen la letra 'a' en el nombre

En este caso específico, **el resultado es el mismo** porque:
- Si INSTR encuentra 'a', devuelve posición (1,2,3...) = TRUE
- Si INSTR no encuentra 'a', devuelve 0 = FALSE

## Diferencia importante:

```sql
-- Estas dos consultas dan el mismo resultado:
WHERE INSTR(LOWER(FIRST_NAME), 'a') <> 0  -- Explícito
WHERE INSTR(LOWER(FIRST_NAME), 'a')       -- Implícito
```

La versión `<> 0` es más clara y explícita para entender qué estás buscando, pero funcionalmente son equivalentes en Oracle.


- Visualizar las iniciales de nombre y apellidos separados por puntos. Por
### ejemplo:

![imagen](./images/img.png)

### Solucion :

```sql
SELECT FIRST_NAME,
       LAST_NAME,
       SUBSTR(FIRST_NAME, 1, 1) || '.' || SUBSTR(LAST_NAME, 1, 1) || '.' AS "INICIALES"
FROM EMPLOYEES;


```
![imagen](images/2.png)

---

- MOSTRAR EMPLEADOS DONDE EL NOMBRE O APELLIDO COMIENZA CON 'S'

```sql
SELECT * FROM EMPLOYEES
WHERE FIRST_NAME LIKE 'S%' OR LAST_NAME LIKE 'S%';


```

![imagen](images/3.png)

-- Visualizar el nombre del empleado, su salario, y con asteriscos, el
-- número miles de dólares que gana. Se asocia ejemplo. (PISTA: se
-- puede usar RPAD. Ordenado por salario

```sql

SELECT FIRST_NAME,
       SALARY,
       RPAD('*', SALARY / 1000, '*') AS RANKING
FROM EMPLOYEES
ORDER BY SALARY DESC;

```

### EXPLICACION

La función `RPAD` rellena una cadena por la derecha hasta alcanzar una longitud específica. Te explico cada parámetro:

## Sintaxis de RPAD:
```sql
RPAD(cadena_original, longitud_total, carácter_relleno)
```

## En tu ejemplo:
```sql
RPAD('*', SALARY / 1000, '*')
```

### Parámetros:
1. **`'*'`** - Cadena original (un asterisco)
2. **`SALARY / 1000`** - Longitud total deseada (salario dividido entre 1000)
3. **`'*'`** - Carácter para rellenar (asterisco)

### Funcionamiento:
- Si un empleado gana **5000**, entonces `SALARY / 1000 = 5`
- RPAD toma el primer `'*'` y lo rellena hasta llegar a 5 caracteres usando `'*'`
- Resultado: `*****` (5 asteriscos)

- Si gana **12000**, entonces `SALARY / 1000 = 12`
- Resultado: `************` (12 asteriscos)

## Ejemplo práctico:
```sql
-- Si SALARY = 8000
RPAD('*', 8000/1000, '*') = RPAD('*', 8, '*') = '********'

-- Si SALARY = 3500  
RPAD('*', 3500/1000, '*') = RPAD('*', 3, '*') = '***'
```

## Propósito:
Crear una representación visual del salario donde cada asterisco representa 1000 dólares, facilitando comparar salarios de forma gráfica.

![imagen](images/4.png)

---

## ⬅️➡️ CLASE 79 — FUNCIONES NUMERICAS : ROUND - TRUNC - MOD - POWER

-- ROUND REDONDEAR
SELECT ROUND(50.920, 2)
FROM DUAL;
--50.92

-- TRUNC TRUNCAR
SELECT TRUNC(50.9790, 2)
FROM DUAL;
--50.90

--MOD(A,B)
SELECT MOD(10, 3)
FROM DUAL;

-- POWER(A,B)
SELECT POWER(10, 2)
FROM DUAL;
--10^2=100
--*******************************************************************************************************
/*
PRACTICA -->
1. Funciones numéricas
   • Visualizar el nombre y salario de los empleados de los que el número de
   empleado es impar (PISTA: MOD)
   • Prueba con los siguientes valores aplicando las funciones TRUNC y
   ROUND, con 1 y 2 decimales.

*/

```sql

SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE MOD(EMPLOYEE_ID, 2) <> 0;

```

![imagen](images/5.png)

![imagen](images/6.png)

---
# 📅 SQL — Práctica de Funciones Numéricas y de Fechas

---

## 🧮 1. Funciones Numéricas

> Visualizar el nombre y salario de los empleados cuyo número de empleado es **impar** (`MOD`).

```sql
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE MOD(EMPLOYEE_ID, 2) <> 0;
```

> Prueba con los siguientes valores aplicando las funciones `TRUNC` y `ROUND`, con 1 y 2 decimales.

*(Agrega aquí tus valores de prueba y ejemplos de TRUNC/ROUND)*

---

## 📆 CLASE 81 : Funciones de Fechas

```sql
SELECT FIRST_NAME, HIRE_DATE
FROM EMPLOYEES;

SELECT SYSDATE
FROM DUAL;
```

---

## ➕➖ CLASE 82 : Aritmética de Fechas

```sql
SELECT FIRST_NAME, HIRE_DATE
FROM EMPLOYEES;

SELECT SYSDATE
FROM DUAL;

-- Sumar días
SELECT SYSDATE + 2 FROM DUAL; -- Suma 2 días

-- Restar días
SELECT SYSDATE - 2 FROM DUAL; -- Resta 2 días

-- Restar fechas
SELECT HIRE_DATE, SYSDATE - HIRE_DATE AS "DIAS TRABAJADOS"
FROM EMPLOYEES;
```

---

## 📅 CLASE 83 : MONTHS_BETWEEN, NEXT_DAY, ADD_MONTHS

```sql
-- MONTHS_BETWEEN(FECHA1, FECHA2)
SELECT HIRE_DATE, MONTHS_BETWEEN(SYSDATE, HIRE_DATE) AS "MESES TRABAJADOS"
FROM EMPLOYEES;

-- ADD_MONTHS(FECHA, NUMERO_MESES)
SELECT SYSDATE, ADD_MONTHS(SYSDATE, 3), SYSDATE + 90
FROM DUAL;

-- NEXT_DAY(FECHA, 'DIA_DE_LA_SEMANA')
SELECT NEXT_DAY(SYSDATE, 'MIÉRCOLES')
FROM DUAL;
```

---

## ⏳ CLASE 84 : LAST_DAY, ROUND, TRUNC

```sql
-- LAST_DAY(FECHA): último día del mes de la fecha
SELECT SYSDATE, LAST_DAY(SYSDATE)
FROM DUAL;

-- ROUND(FECHA, 'FORMATO'), TRUNC(FECHA, 'FORMATO')
SELECT SYSDATE, ROUND(SYSDATE, 'MONTH'), ROUND(SYSDATE, 'YEAR')
FROM DUAL;

SELECT SYSDATE, TRUNC(SYSDATE, 'MONTH'), TRUNC(SYSDATE, 'YEAR')
FROM DUAL;
```

---

> 🚀 **¡Sigue practicando y dominando funciones en SQL!**






