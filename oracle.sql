-- Entre comillas si deseas cambiar el formato ""
SELECT FIRST_NAME, last_name, salary AS "Salario Empleado"
FROM EMPLOYEES;

/*OPERADORES
+ SUMA
- RESTA
* MULTIPLICACION
/ DIVISION
*/

SELECT FIRST_NAME, SALARY, SALARY * 12 AS "Salario Anual", 20 * 10 as "EJEMPLO"
FROM EMPLOYEES;

-- CLASE 45 LITERALES
SELECT 'NOMBRE:', FIRST_NAME
FROM EMPLOYEES;

SELECT 'NOMBRE:' || FIRST_NAME || ' ' || LAST_NAME AS "NOMBRE EMPLEADO"
FROM EMPLOYEES;

--CLASE 47 TABLA DUAL

SELECT 4 + 3, FIRST_NAME
FROM EMPLOYEES;

SELECT 4 + 3, 'ES EL RESULTADO'
FROM DUAL;

DESC DUAL;

--CLASE 48 NULOS-NULL

SELECT FIRST_NAME, SALARY, COMMISSION_PCT, SALARY * COMMISSION_PCT AS "SALARIO TOTAL"
FROM EMPLOYEES;

--CLASE 49 DISINCT : NO APARECEN DUPLICADOS SINO QUE LOS AGRUPA 

SELECT *
FROM EMPLOYEES;

SELECT FIRST_NAME, DEPARTMENT_ID
FROM EMPLOYEES;

-- APLICANDO DISTINC
SELECT DISTINCT DEPARTMENT_ID
FROM EMPLOYEES;

SELECT DISTINCT DEPARTMENT_ID, JOB_ID
FROM EMPLOYEES;

-- CLASE 52 CLAUSULA WHERE 

/*
-- OPERADORES DE COMPARACION MAS COMUNES
= , >=,<,>,<=,<>
*/

-- USAR CONDICIONES , WHERE DICE RECUPERAME LA INFORMACION DE LA CONDICION 
SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 50;

-- EMPLEADOS QUE GANAN MAS DE 4000
SELECT FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY = 4000;

-- QUE EMPLEADOS NO TRABAJAN EN EL DEPARTAMENTO 50 USAS <>
SELECT FIRST_NAME
FROM EMPLOYEES
WHERE DEPARTMENT_ID <> 50;

--CLASE 53 CONDICIONES CON LITERALES
SELECT FIRST_NAME, LAST_NAME
FROM EMPLOYEES
WHERE FIRST_NAME = 'John';

-- CLASE 54 COMPARAR FECHAS
SELECT *
FROM EMPLOYEES;
SELECT *
FROM EMPLOYEES
WHERE HIRE_DATE = '21-09-05';

SELECT *
FROM EMPLOYEES
WHERE HIRE_DATE > '21-09-05';


--*******************************************************************************************************
--*                         CLASE 56 CLAUSULA BETWEEN : OPERADORES DE COMPARACION                       *                                                   *
--*******************************************************************************************************
-- NO PERMITE HACER UNA COMPARACION ENTRE UN VALOR Y OTRO.

SELECT *
FROM EMPLOYEES
WHERE SALARY BETWEEN 5000 AND 6000;

SELECT *
FROM EMPLOYEES
WHERE HIRE_DATE BETWEEN '01-01-07' AND '01-01-09';

SELECT *
FROM EMPLOYEES
WHERE FIRST_NAME BETWEEN 'Douglas' AND 'Steven';
-- operacion que se encuentre entre estos dos nombres

-- CLASE 57 CLAUSULA IN

--IN (VALOR1,VALOR2...) SI EL VALOR QUE BUSCO SE ENCUENTRA EN LA LISTA ME DEVUELVE EL VALOR SI ESTA ME LO DEVUELVE SINO ESTA NO ME LO DEVUELVE

SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (50, 60);

SELECT *
FROM EMPLOYEES
WHERE JOB_ID IN ('SH_CLERK', 'ST_CLERK', 'ST_MAN');

-- PRACTICA BETWEEN ->
--**********************

-- AVERIGUAR LOS EMPLEADOS QUE ESTAN ENTRE EL DEPARAMENTO 40 Y EL 60

SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID BETWEEN 50 AND 60;

-- VISUALIZAR LOS EMPLEADOS QUE ENTRARON ENTRE 2002 Y 2004

SELECT *
FROM EMPLOYEES
WHERE HIRE_DATE BETWEEN '01-01-02' AND '31-12-04';

-- INDICA LOS APELLIDOS DE LOS EMPLEADOS QUE EMPIEZAN DESDE 'D' hasta 'G'

SELECT *
FROM EMPLOYEES
WHERE LAST_NAME BETWEEN 'D' AND 'H';

-- AVERIGUAR LOS EMPLEADOS DE LOS DEPARTAMENTOS 30,60 Y 90  HAY QUE USAR LA CLAUSULA IN

SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (30, 60, 90);

-- AVERIGUAR LOS EMPLEADOS QUE TIENEN EL TIPO DE TRABAJO IT_PROG Y PU_CLERK
SELECT *
FROM EMPLOYEES
WHERE JOB_ID IN ('IT_PROG', 'PU_CLERK');

-- INDICA LAS CIUDADES QUE ESTAN EN INGLATERRA (UK) Y JAPON (JP) TABLA LOCATIONS
SELECT *
FROM LOCATIONS;

SELECT *
FROM LOCATIONS
WHERE COUNTRY_ID IN ('UK', 'JP');

--*******************************************************************************************************
--*                         CLASE 59 CLAUSULA LIKE : OPERADORES PARA CADENA DE CARATENERES              *                                                   *
--*******************************************************************************************************
-- ME PERMITE BUSCAR UN PATRON DE CARACTERES VOY A BUSCAR TODOS AQUELLOS TEXTOS QUE SEAN COMO ESE PATRON.
-- LIKE 'PATRON'
-- %
-- _(IDENTIFICA UN SOLO CARACTER)

--FIRST_NAME QUE EMPIEZA POR 'J'
SELECT *
FROM EMPLOYEES
WHERE FIRST_NAME LIKE 'J%';

--QUE LA SEGUNDA LETRA SEA UNA 'E'
SELECT *
FROM EMPLOYEES
WHERE FIRST_NAME LIKE '_e%';

-- COMO PUEDO SABER TODOS AQUELLOS EMPLEADOS CUYO NOMBRE TIENEN UNA 'te' EN CUALQUIER LUGAR DEL TEXTO
SELECT *
FROM EMPLOYEES
WHERE FIRST_NAME LIKE '%te%';

--CUIDADO CON ESTAS EXPRESIONES POE EL RENDIMIENTO EL LIKE CONSUME MUCHA MEMORIA.

-- ****************************************
-- *     PRACTICA LIKE                    *
-- ****************************************
-- INDICAR LOS DATOS DE LOS EMPLEADOS CUYO FIRST_NAME EMPIEZA POR 'J'
SELECT *
FROM EMPLOYEES
WHERE FIRST_NAME LIKE 'J%';
-- AVERIGUAR LOS EMPLEADOS QUE COMIENZAN POR 'S' Y TERMINAN EN 'N'
SELECT *
FROM EMPLOYEES
WHERE FIRST_NAME LIKE 'S%n';
-- INDICAR LOS PAISES QUE TIENEN UNA 'r' en la segunda letra (Tabla Countries)
SELECT *
FROM COUNTRIES;
SELECT *
FROM COUNTRIES
WHERE COUNTRY_NAME LIKE '_r%';

--*******************************************************************************************************
--*                         CLASE 61 CLAUSULA IS NULL :                                                 *
--*******************************************************************************************************
-- CUANDO COMPARAMOS UN NULO CON NULO ES NULO NO TIENE SENTIDO COMPARARLOS
SELECT *
FROM EMPLOYEES
WHERE COMMISSION_PCT = NULL;
-- NO TIENE SENTIDO

-- APLICANDO IS NULL
SELECT *
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NULL;

-- ****************************************
-- *     PRACTICA IS NULL//NOT NULL       *
-- ****************************************

-- LISTAR LAS CIUDADES DE LA TABLA LOCATIONS NO TIENEN STATE_PROVINCE

SELECT *
FROM LOCATIONS;
SELECT *
FROM LOCATIONS
WHERE STATE_PROVINCE IS NULL;

-- AVERIGUAR EL NOMBRE, SALARIO Y COMISION DE AQUELLOS EMPLEADOS QUE TIENEN COMISION. 
-- TAMBIEN DEBEMOS VISUALIZAR UNA COLUMNA CALCULADA
-- DENOMINADA "SUELDO TOTAL", QUE SEA EL SUELDO MAS LA COMISION.

SELECT *
FROM EMPLOYEES;
SELECT FIRST_NAME, SALARY, COMMISSION_PCT, SALARY + (SALARY * COMMISSION_PCT) AS "Salario Total"
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL;

--*******************************************************************************************************
--*                         CLASE 63 OPERADORES AND OR NOT :  APLICAN PARA MAS DE UNA CODICION          *
--*******************************************************************************************************

/*
AND C1 AND C2 --> TRUE
OR  C1 OR C2  --> TRUE
NOT C1 --> TRUE PARA NEGAR UNA DETERMINADA CONDICION
*/

-- QUIERO SABER TODOS LOS EMPLEADOS QUE GANAN MAS DE UNA DETERMNADA CANTIDAD  Y ADEMAS PERTENECEN AL DEPARTAMENTO 50
SELECT *
FROM EMPLOYEES
WHERE SALARY > 5000
  AND DEPARTMENT_ID = 50;

SELECT *
FROM EMPLOYEES
WHERE SALARY > 5000
   OR DEPARTMENT_ID = 50;

-- EMPLEADOS QUE NO TRABAJAN EN EL DEPARTMENT_ID 50 , 60

SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID NOT IN (50, 60);

--*******************************************************************************************************
--*                         CLASE 64 OPERADORES AND OR NOT :  COMBINACIONES                             *
--*******************************************************************************************************
/*
C1 AND C2 TRUE TRUE   --> TRUE
C1 AND C2 TRUE FALSE  --> FALSE
C1 AND C2 FALSE FALSE --> FALSE
C1 OR C2  TRUE TRUE   --> TRUE
C1 OR C2  TRUE FALSE  --> TRUE
C1 OR C2 FALSE FALSE  --> FALSE
*/

-- SE TIENEN QUE CUMPLIR LAS 3 CONDICIONES ME DAN 3 RESULTADOS PERO SI CAMBIO A OR TE DARAN MAS RESULTADOS.
SELECT FIRST_NAME, SALARY, DEPARTMENT_ID, HIRE_DATE
FROM EMPLOYEES
WHERE SALARY > 5000
  AND DEPARTMENT_ID = 50
  AND HIRE_DATE > '01-01-05';


-- ****************************************
-- *     PRACTICA AND OR NOT              *
-- ****************************************

-- OBTENER EL NOMBRE Y LA FECHA DE LA ENTRADA Y EL TIPO DE TRABAJO DE LOS EMPLEADOS QUE SEAN IT_PROG Y QUE GANEN MENOS DE 6000 DOLARES

SELECT *
FROM EMPLOYEES;
SELECT FIRST_NAME, HIRE_DATE, JOB_ID
FROM EMPLOYEES
WHERE JOB_ID = 'IT_PROG'
  AND SALARY > 6000;

-- SELECCIONAR LOS EMPLEADOS QUE TRABAJEN EN EL DEPARTAMENTO 50 O 80 CUYO NOMBRE COMIENCE POR S Y QUE GANEN MAS DE 3000 DOLARES
SELECT *
FROM EMPLOYEES
WHERE FIRST_NAME LIKE 'S%'
  AND SALARY > 3000
  AND (DEPARTMENT_ID = 50 OR DEPARTMENT_ID = 80);

--¿QUE EMPLEADOS DE JOB_ID IT_PROG TIENEN UN PREFIJO 5 EN EL TELEFONO Y ENTRARON EN LA EMPRESA EN EL AÑO 2007?
SELECT *
FROM EMPLOYEES
WHERE JOB_ID = 'IT_PROG'
  AND PHONE_NUMBER LIKE '5%'
  AND HIRE_DATE BETWEEN '01-01-07' AND '31-12-07';

--*******************************************************************************************************
--*                         CLASE 66 ORDENACION :  CLAUSULA ORDER BY                                    *
--*******************************************************************************************************
-- ORDER BY ME PERMITE ORDENAR POR QUE QUIERO ORDENAR 'DESC' 'ASC'(ESTE ES EL VALOR POR DEFECTO)
SELECT *
FROM EMPLOYEES
ORDER BY SALARY DESC;

SELECT FIRST_NAME, LAST_NAME, SALARY
FROM EMPLOYEES
WHERE FIRST_NAME = 'David'
ORDER BY FIRST_NAME, LAST_NAME;

SELECT FIRST_NAME, LAST_NAME, SALARY
FROM EMPLOYEES
WHERE FIRST_NAME = 'David'
ORDER BY FIRST_NAME, SALARY DESC;

-- PONER UNA POCISION
SELECT FIRST_NAME, SALARY * 12 AS SALARIO
FROM EMPLOYEES
ORDER BY SALARIO;

-- SI DESEO QUE ME ORDENE EN BASE A LA COLUMNA NUMERO '2'
SELECT FIRST_NAME, SALARY * 12
FROM EMPLOYEES
ORDER BY 2;

SELECT FIRST_NAME, SALARY * 12 AS TOTAL
FROM EMPLOYEES
ORDER BY TOTAL DESC;

--*******************************************************************************************************
--*                         CLASE 68 :  FETCH -> LIMITAR EL NUMERO DE FILAS A VISUALIZAR                *
--*******************************************************************************************************

SELECT FIRST_NAME, SALARY
FROM EMPLOYEES;

-- QUIERO SACAR LOS 5 PRIMEROS USANDO FETCH

SELECT FIRST_NAME, SALARY
FROM EMPLOYEES
ORDER BY SALARY DESC FETCH FIRST 5 ROWS ONLY;

-- QUE ME SAQUE OTRO EMPLEADO QUE TENGA EL MISMO VALOR DE SALARY CON WITH TIES
SELECT FIRST_NAME, SALARY
FROM EMPLOYEES
ORDER BY SALARY DESC FETCH FIRST 7 ROWS
WITH TIES;

--OFFSET 5 ROWS ME COGES A PARTIR DEL 5 VALOR OFFSET 5 ROWS
SELECT FIRST_NAME, SALARY
FROM EMPLOYEES
ORDER BY SALARY DESC
OFFSET 5 ROWS FETCH FIRST 5 ROWS
WITH TIES;

-- SE PUEDE PONER UN PORCENTAJE Y TE 20 FILAS
SELECT *
FROM EMPLOYEES FETCH FIRST 20 PERCENT ROWS ONLY;

--*******************************************************************************************************
--*                         CLASE 69 :  FUNCIONES                                                       *
--*******************************************************************************************************
/*
- PERMITEN REALIZAR OPERACIONES O CREAR EXPRESIONES DIRECTAMENTE EN SQL SON DE DISTINTOS TIPOS:
- NUMERICAS 
- DE CADENAS DE CARACTERES
- DE FECHAS
- DE PROPOSITO GENERAL
- FORMATO :
    - SELECT COLUMNA, FUNCION(PARAMETRO)FROM TABLA
    - SE PUEDEN USAR EN CUALQUIER SITIO DONDE APRAEZCA UNA COLUMNA
    - SI LA FUNCION NO LLEVA PARAMETROS OMITIMOS LOS PARENTESIS : SYSDATE,USER
    - SI LA FUNCION LLEVA MAS DE UN ARGUMENTO LOS INDICAMOS ENTRE COMAS 
        * SUBSTR(CADENA,POCISION,LONGITUD)
 - ANIDAMIMENTO DE FUNCIONES
  - SE PUEDEN ANIDARFUNCIONES, PARA PODER CAMBIAR LA EXPRESION DEL VALOR DEVUELTO POR LAS MAS INTERNAS.
  - SE SIGUE EL ORDEN DE PRECEDENCIA TIPICO DE LAS OPERACIONES ARITMETICAS.
   - EJEMPLO : 
    * SUBSTR('hola',1,2)-> ho
    * UPPER(SUBSTR(SUBSTR('hola',1,2)) -> ho -> aplica UPPER -> HO
    
    
    
*/

--*******************************************************************************************************
--*                         CLASE 70 :  FUNCIONES -> UPPER,LOWER,INITCAP                                *
--*******************************************************************************************************

-- LOWER
-- UPPER
-- INITCAP

SELECT EMAIL, LOWER(EMAIL)
FROM EMPLOYEES;

SELECT FIRST_NAME, UPPER(FIRST_NAME)
FROM EMPLOYEES;

SELECT INITCAP('ESTO ES UNA PRUEBA')
FROM DUAL;
--Pone de tipo oracion

--*******************************************************************************************************
--*                         CLASE 71 :  FUNCIONES EN LA CLAUSULA WHERE                                  *
--*******************************************************************************************************

SELECT FIRST_NAME, LAST_NAME
FROM EMPLOYEES
WHERE UPPER(FIRST_NAME) = 'DAVID';


--*******************************************************************************************************
--*                         CLASE 72 :  FUNCIONES CARACTER CONCAT Y ANIDAMIENTO                         *
--*******************************************************************************************************

-- CONCAT

SELECT FIRST_NAME || ' ' || LAST_NAME
FROM EMPLOYEES;

SELECT CONCAT(FIRST_NAME, LAST_NAME)
FROM EMPLOYEES;--SOPORTA SOLO 2 ARGUMENTOS -> StevenKing

SELECT CONCAT(FIRST_NAME, CONCAT(' ', LAST_NAME))
FROM EMPLOYEES;
--AHORA SI ->Steven King

--*******************************************************************************************************
--*                         CLASE 73 :  FUNCIONES CARACTER LENGTH                                       *
--*******************************************************************************************************

-- LENGTH
SELECT FIRST_NAME, LENGTH(FIRST_NAME)
FROM EMPLOYEES;-- RESULTADO -> Steven 6

SELECT FIRST_NAME
FROM EMPLOYEES
WHERE LENGTH(FIRST_NAME) = 6;
--SELECCIONA LAS QUE TIENE 6 CARATERES COMO Daniel

--*******************************************************************************************************
--*                         CLASE 74 :  FUNCIONES CARACTER SUBSTR                                       *
--*******************************************************************************************************
-- SUBSTR(CADENA,POCISION,LONGITUD)

SELECT FIRST_NAME, SUBSTR(FIRST_NAME, 1, 3)
FROM EMPLOYEES;-- ->Steven Ste

SELECT FIRST_NAME, SUBSTR(FIRST_NAME, 3)
FROM EMPLOYEES;
-- ->Steven even SELECCIONA DESDE EL 4

-- QUIERO SACAR LA ULTIMA POCISION
SELECT FIRST_NAME, SUBSTR(FIRST_NAME, LENGTH(FIRST_NAME), 1)
FROM EMPLOYEES;
-- FUNCION ANIDADA


--*******************************************************************************************************
--*                         CLASE 75 :  FUNCIONES INSTR                                                 *
--*******************************************************************************************************
-- INSTR ME PERMITE DEVOLVER LA POCISION QUE OCUPA UNA DETERMINADA CADENA DENTRO DE OTRA CADENA
-- INSTR(C1,C2)

SELECT FIRST_NAME, INSTR(FIRST_NAME, 'a')
FROM EMPLOYEES;-- FUNCION ANIDADA -->Neena 5

SELECT FIRST_NAME, INSTR(FIRST_NAME, 'a')
FROM EMPLOYEES
WHERE INSTR(FIRST_NAME, 'a') <> 0;-- le estoy diciendo seleccioname del nombre la pocision de la letra a en donde sea distinto de 0

SELECT *
FROM EMPLOYEES;

--*******************************************************************************************************
--*                         PRACTICA FUNCIONES CARACTER                                                 *
--*******************************************************************************************************
-- • En la tabla LOCATIONS, averiguar las ciudades que son de Canada o
-- Estados unidos (Country_id=CA o US) y que la longitud del nombre de la
-- calle sea superior a 15.

SELECT CITY, COUNTRY_ID
FROM LOCATIONS
WHERE COUNTRY_ID IN ('CA', 'US')
  AND LENGTH(STREET_ADDRESS) > 15;

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

/*
Visualizar las iniciales de nombre y apellidos separados por puntos. Por
ejemplo:
*/

SELECT FIRST_NAME,
       LAST_NAME,
       SUBSTR(FIRST_NAME, 1, 1) || '.' || SUBSTR(LAST_NAME, 1, 1) || '.' AS "INICIALES"
FROM EMPLOYEES;

-- Mostrar empleados donde el nombre o apellido comienza con S..

SELECT *
FROM EMPLOYEES
WHERE FIRST_NAME LIKE 'S%'
   OR LAST_NAME LIKE 'S%';

-- Visualizar el nombre del empleado, su salario, y con asteriscos, el
-- número miles de dólares que gana. Se asocia ejemplo. (PISTA: se
-- puede usar RPAD. Ordenado por salario

SELECT FIRST_NAME,
       SALARY,
       RPAD('*', SALARY / 1000, '*') AS RANKING
FROM EMPLOYEES
ORDER BY SALARY DESC;




