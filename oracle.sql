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
--*******************************************************************************************************
--*                         CLASE 79 : FUNCIONES NUMERICAS : ROUND - TRUNC - MOD - POWER                *
--*******************************************************************************************************
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

SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE MOD(EMPLOYEE_ID, 2) <> 0;



--*******************************************************************************************************
--*                         CLASE 81 : FUNCIONES FECHAS                                        *
--*******************************************************************************************************

SELECT FIRST_NAME, HIRE_DATE
FROM EMPLOYEES;

SELECT SYSDATE
FROM DUAL;


--*******************************************************************************************************
--*                         CLASE 82 : FUNCIONES FECHAS ARITMETICA DE FECHAS                                    *
--*******************************************************************************************************

SELECT FIRST_NAME, HIRE_DATE
FROM EMPLOYEES;

SELECT SYSDATE
FROM DUAL;

--SUMAR UN NUMERO
SELECT SYSDATE + 2
FROM DUAL;
-- SUMA 2 DIAS
--RESTAR UN NUMERO
SELECT SYSDATE - 2
FROM DUAL;
-- RESTA 2 DIAS
-- RESTAR FECHAS
SELECT HIRE_DATE, SYSDATE - HIRE_DATE AS "DIAS TRABAJADOS"
FROM EMPLOYEES;


--*******************************************************************************************************
--*                         CLASE 83 : MONTHS-BETWEEN-NEXT_DAY-ADD_MONTHS                               *
--*******************************************************************************************************

-- MONTHS_BETWEEN(FECHA1,FECHA2)
SELECT HIRE_DATE, MONTHS_BETWEEN(SYSDATE, HIRE_DATE) AS "MESES TRABAJADOS"
FROM EMPLOYEES;

-- ADD_MONTHS(FECHA,NUMERO_MESES)
SELECT SYSDATE, ADD_MONTHS(SYSDATE, 3), SYSDATE + 90
FROM DUAL;

-- NEXT_DAY(FECHA,'DIA_DE_LA_SEMANA')
SELECT NEXT_DAY(SYSDATE, 'MIÉRCOLES')
FROM DUAL;

--*******************************************************************************************************
--*                         CLASE 84 : LAST_DAY-ROUND-TRUNC                                             *
--*******************************************************************************************************
--LAST_DAY(FECHA) ES UNA FUNCION NOS DEVUELVE LA FECHA DEL ULTIMO DIA DEL MES QUE CONTIENE LA FECHA
SELECT SYSDATE, LAST_DAY(SYSDATE)
FROM DUAL;

-- ROUND(FECHA,'FORMATO')  -  TRUNC(FECHA,'FORMATO')
-- ROUND ME REDONDEA LA FECHA AL FORMATO INDICADO
-- TRUNC ME TRUNCA LA FECHA AL FORMATO INDICADO

SELECT SYSDATE, ROUND(SYSDATE, 'MONTH'), ROUND(SYSDATE, 'YEAR')
FROM DUAL;
SELECT SYSDATE, TRUNC(SYSDATE, 'MONTH'), TRUNC(SYSDATE, 'YEAR')
FROM DUAL;

--*******************************************************************************************************
--*                         PRACTICA FUNCIONES                                                          *
--*******************************************************************************************************
/**
  1. Funciones de fecha
• Indicar el número de días que los empleados llevan en la empresa
• Indicar la fecha que será dentro de 15 días
• ¿Cuántos MESES faltan para la navidad? La cifra debe salir
redondeada, con 1 decimal
• Indicar la fecha de entrada de un empleado y el último día del mes que
entró
• Utilizando la función ROUND, indicar los empleados que entraron en los
últimos 15 días de cada mes

 */

-- SOLCION :

-- • Indicar el número de días que los empleados llevan en la empresa

SELECT FIRST_NAME, HIRE_DATE - SYSDATE AS "DIAS EN LA EMPRESA"
FROM EMPLOYEES;

-- • Indicar la fecha que será dentro de 15 días

SELECT SYSDATE + 15 AS "FECHA DENTRO DE 15 DIAS"
FROM DUAL;
-- 2025-11-07 21:21:02

--• ¿Cuántos MESES faltan para la navidad? La cifra debe salir
-- redondeada, con 1 decimal

SELECT ROUND(MONTHS_BETWEEN('25-12-2025', SYSDATE), 1)
FROM DUAL;
-- 2

-- • Indicar la fecha de entrada de un empleado y el último día del mes que
-- entró

SELECT FIRST_NAME, HIRE_DATE, LAST_DAY(HIRE_DATE) AS "ULTIMO DIA DEL MES DE ENTRADA"
FROM EMPLOYEES;

-- Steven,2003-06-17,2003-06-30

-- • Utilizando la función ROUND, indicar los empleados que entraron en los
-- últimos 15 días de cada mes

SELECT FIRST_NAME, HIRE_DATE, ROUND(HIRE_DATE, 'MONTH') AS "ULTIMOS 15 DIAS"
FROM EMPLOYEES
WHERE ROUND(HIRE_DATE, 'MONTH') > HIRE_DATE;

--*******************************************************************************************************
--                           CLASE 86 : LAST_DAY-ROUND-TRUNC                                            *
--                          **** FUNCIONES DE CONVERSION ****                                           *
--*******************************************************************************************************

--TO CHAR
--TO_DATE
--TO_NUMBER

SELECT '10' + 10
FROM DUAL;

--RESULTADO : 20

SELECT MONTHS_BETWEEN(SYSDATE, '10-10-18')
FROM DUAL;

--RESPUESTA : 84.4490961021505376344086021505376344086

SELECT 10 || '10'
FROM DUAL;

-- RESULTADO : 1010

SELECT 'HOY ES:' || SYSDATE
FROM DUAL;

--RPTA:HOY ES:23/10/25

--*******************************************************************************************************
--                           CLASE 87 : COMVERTIR FECHAS A CARACTER : TO_CHAR                            *
--*******************************************************************************************************
--TO_CHAR(DATE/NUMBER,'FORMATO') CONVIERTELO Y DALE UN FORMATO

--TO_CHAR(DATE,'FORMATO')
/*
 YYYY AÑO 4 NUMEROS
 YEAR AÑO (INGLES)
 MM MES 2 DIGITOS
 MONTH MES EN TEXTO
 MON ABREVIATURA DEL MES
 DY ABREVIATURA DEL DIA
 DAY DIA EN TEXTO
 DD NUMERO DEL DIA
 */
SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY')
FROM DUAL;
--RPTA : 2025

SELECT SYSDATE, TO_CHAR(SYSDATE, 'MONTH')
FROM DUAL;

--RPTA :OCTUBRE

SELECT SYSDATE, TO_CHAR(SYSDATE, 'YEAR')
FROM DUAL;
--RPTA :TWENTY TWENTY-FIVE

SELECT SYSDATE, TO_CHAR(SYSDATE, 'DAY')
FROM DUAL;
--RPTA : JUEVES
--*******************************************************************************************************
--                           CLASE 88 : COMVERTIR FECHAS A CARACTER : TO_CHAR PARTE 2                   *
--*******************************************************************************************************

--TO_CHAR(DATE,'FORMATO')
/*
AM PM MERIDIAN
HH FORMATO 12 HORAS
HH24 FORMATO 24 HORAS
MI MINUTOS
SS SEGUNDOS
 */

SELECT SYSDATE, TO_CHAR(SYSDATE, 'HH')
FROM DUAL;
--RPTA : 10

SELECT SYSDATE, TO_CHAR(SYSDATE, 'HH24')
FROM DUAL;
-- RPTA : 22

SELECT SYSDATE, TO_CHAR(SYSDATE, 'MI')
FROM DUAL;
-- RPTA : 21

SELECT SYSDATE, TO_CHAR(SYSDATE, '"Son las" HH24:MI " del dia de hoy" YYYY')
FROM DUAL;
-- RPTA : Son las 22:24  del dia de hoy 2025


--*******************************************************************************************************
--                           CLASE 89 : COMVERTIR NUMEROS A CARACTER : TO_CHAR                          *
--*******************************************************************************************************
--TO_CHAR(NUMERO,'FORMATO')
/*
9 POSICION DE UN NUMERO
0 POSICION DE UN NUMERO CON RELLENO DE CEROS
D SEPARADOR DE DECIMALES
, SEPARADOR DE MILES
$ SIMBOLO DE MONEDA
L MONEDA ACTUAL
. PUNTO DECIMAL
 */
SELECT SALARY, TO_CHAR(SALARY, '99999')
FROM EMPLOYEES;
--RPTA : 24000.00, 24000

SELECT SALARY
     , TO_CHAR(SALARY, '99999')
     , TO_CHAR(SALARY, '00000')
     , TO_CHAR(SALARY, 'L00009.99')
FROM EMPLOYEES;
--RPTA :  24000,24000,S/24000.00


--*******************************************************************************************************
--                           CLASE 91 : COMVERTIR CARACTERES A FECHAS : TO_DATE             *
--*******************************************************************************************************
--TO_DATE(STRING,'FORMATO')

SELECT TO_DATE('10-01-89')
FROM DUAL;--1989-01-10
SELECT TO_DATE('10-01-1989')
FROM DUAL;--1989-01-10
SELECT TO_DATE('10-JAN-89')
FROM DUAL;--ERROR
SELECT TO_DATE('12-22-1989', 'mm-dd-yy')
FROM DUAL;--2089-12-22
SELECT TO_DATE('JAN-22-89', 'MON-DD-YY', 'NLS_DATE_LANGUAGE=ENGLISH')
FROM DUAL;
-- FORZAMOS AL INGLES 2089-01-22

SELECT TO_DATE('ENE-22-89', 'MON-DD-YY')
FROM DUAL;

--RR FORMATO NOS PERMITE DETERMINAR EN QUE SENTURIA ESTAMOS

/*
YY FORMATO 2 DIGITOS AÑO SIGLO ACTUAL
RR FORMATO 2 DIGITOS AÑO SIGLO ACTUAL O SIGLO ANTERIOR
0-49  2000
50-59 1900

*/
SELECT TO_CHAR(TO_DATE('10-01-89', 'DD-MM-RR'), 'DD-MM-YYYY')
FROM DUAL;
-- 10-01-1989

--*******************************************************************************************************
--                           CLASE 92 : CONVERTIR CARACTERES A NUMEROS                                   *
--*******************************************************************************************************
--TO_NUMBER(STRING,'FORMATO')

SELECT TO_NUMBER('1000.89', '9999.99')
FROM DUAL;--1000.89

SELECT TO_NUMBER('S/1000', 'L9999')
FROM DUAL;

--                           PRACTICA  DE CONVERTIR CARACTERES A NUMERO-                                *
--*******************************************************************************************************


--*******************************************************************************************************
--                           CLASE 94 : OTRAS FUNCIONES SQL NULOS - TRATAR NULOS NVL                    *
--*******************************************************************************************************
-- TRATAR NULOS NVL ->

SELECT NVL(NULL, 'ADIOS')
FROM DUAL;

SELECT FIRST_NAME, COMMISSION_PCT
FROM EMPLOYEES;

SELECT FIRST_NAME, NVL(COMMISSION_PCT, 0)
FROM EMPLOYEES;

SELECT FIRST_NAME, COMMISSION_PCT * SALARY, NVL(COMMISSION_PCT, 0) * SALARY
FROM EMPLOYEES;

--*******************************************************************************************************
--                           CLASE 95 : TRATAR NULOS NVL2                                               *
--*******************************************************************************************************
-- TRATAR NULOS NVL2 -> FUNGE COMO UN TERNARIO.

-- NVL2 (EXPRESION,VALOR1,VALOR2)

SELECT FIRST_NAME, SALARY, COMMISSION_PCT, NVL2(COMMISSION_PCT, SALARY * COMMISSION_PCT, SALARY * 0.1) AS CM
FROM EMPLOYEES;

--*******************************************************************************************************
--                           CLASE 96 : TRATAR NULOS NULLIF                                             *
--*******************************************************************************************************

--NULLIF(V1,V2)

SELECT NULLIF(1, 10)
FROM DUAL;--RPTA : 1
SELECT NULLIF(1, 1)
FROM DUAL;--RPTA : NULL

SELECT COUNTRY_ID, SUBSTR(COUNTRY_NAME, 1, 2)
FROM COUNTRIES;
--RPTA AR,Ar

-- LO PONEMOS EN MAYUSCULAS Y SI ES IGUAL A COUNTRY_ID ME DEVUELVE NULL
SELECT COUNTRY_ID,
       UPPER(SUBSTR(COUNTRY_NAME, 1, 2)),--RPTA AR,AR
       NULLIF(COUNTRY_ID, UPPER(SUBSTR(COUNTRY_NAME, 1, 2)))
FROM COUNTRIES;
--RPTA EG,EG,NULL O  DK,DE,DK

--*******************************************************************************************************
SELECT COUNTRY_ID,
       UPPER(SUBSTR(COUNTRY_NAME, 1, 2)),--RPTA AR,AR
       NULLIF(COUNTRY_ID, UPPER(SUBSTR(COUNTRY_NAME, 1, 2))),--RPTA ES NULL O UN COUNTRY_ID
       NVL2(NULLIF(COUNTRY_ID, UPPER(SUBSTR(COUNTRY_NAME, 1, 2))), 'SON IGUALES', 'SON DISTINTOS') AS COMPARACION--SON DISTINTOS O SON IGUALES
FROM COUNTRIES;
--RPTA

--*******************************************************************************************************
--                           CLASE 97 : TRATAR NULOS COALESCE                                           *
--*******************************************************************************************************

SELECT COALESCE(NULL, NULL, 'VALOR3')
FROM DUAL;

SELECT FIRST_NAME, COMMISSION_PCT, TO_CHAR(COMMISSION_PCT)
FROM EMPLOYEES;--RPTA John,0.40,",4"

SELECT FIRST_NAME, MANAGER_ID, TO_CHAR(COMMISSION_PCT), TO_CHAR(MANAGER_ID)
FROM EMPLOYEES;

SELECT FIRST_NAME, COALESCE(TO_CHAR(COMMISSION_PCT), TO_CHAR(MANAGER_ID), 'SIN JEFE NI COMISION')
FROM EMPLOYEES;

--*******************************************************************************************************
--                           PRACTICA                                          *
--*******************************************************************************************************

/*
FUNCIONES DE NULOS
• De la tabla LOCATIONS visualizar el nombre de la ciudad y el estadoprovincia.
En el caso de que no tenga que aparezca el texto “No tiene”*/

--SOLUCION :
SELECT CITY, NVL(CITY, 'No tiene') AS "ESTADO PROVINCIA"
FROM LOCATIONS;

/*
• Visualizar el salario de los empleados incrementado en la comisión
(PCT_COMMISSION). Si no tiene comisión solo debe salir el salario
*/

SELECT FIRST_NAME,
       COMMISSION_PCT,
       SALARY + NVL2(COMMISSION_PCT, SALARY + SALARY * COMMISSION_PCT / 100, SALARY)
           AS TOTAL
FROM EMPLOYEES;

/*
• Seleccionar el nombre del departamento y el manager_id. Si no tiene,
debe salir un -1 */

SELECT JOB_ID, MANAGER_ID, NVL(MANAGER_ID, -1) AS "JEFE"
FROM EMPLOYEES;

/*
• De la tabla LOCATIONS, devolver NULL si la ciudad y la provincia son
iguales. Si no son iguales devolver la C
*/

SELECT CITY,
       STATE_PROVINCE,
       NULLIF(CITY, STATE_PROVINCE)
FROM LOCATIONS;

--*******************************************************************************************************
--                           CLASE 99 : CASE                                                            *
--*******************************************************************************************************

-- CASE CLAUSULA QUE NOS PERMITE COMPROBAR DISTINTAS CONDICIONES Y DEVOLVER UN VALOR SEGUN CADA CONDICION
-- FORMATO :
/*
CASE
    WHEN CONDICION1 THEN VALOR1
    WHEN CONDICION2 THEN VALOR2
    ...
    ELSE VALOR_POR_DEFECTO
END
 */
SELECT FIRST_NAME,
       JOB_ID,
       CASE JOB_ID
           WHEN 'SH_CLERK' THEN 'TIPO 1'
           WHEN 'ST_MAN' THEN 'TIPO 2'
           WHEN 'ST_CLERK' THEN 'TIPO 3'
           ELSE 'SIN TIPO'
           END AS "TIPO DE TRABAJO"
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 50;


--*******************************************************************************************************
--                           CLASE 100 : CASE SEARCHED                                                           *
--*******************************************************************************************************

-- DIREFENCIA CON CASE SIMPLE Y EL CASE SEARCHED ES POR QUE PUEDO PONER CONDICIONES MAS COMPLEJAS
-- FORMATO :

SELECT FIRST_NAME,
       SALARY,
       CASE
           WHEN SALARY BETWEEN 0 AND 3000 THEN 'GANAS POCO'
           WHEN SALARY BETWEEN 3001 AND 5000 THEN 'GANAS COMO LA MEDIA'
           WHEN SALARY > 5001 THEN 'GANAS BASTANTE'
           ELSE 'NO GANAS'
           END AS "RANGO SALARIAL"
FROM EMPLOYEES;

--*******************************************************************************************************
--                           CLASE 101 : DECODE                                                         *
--*******************************************************************************************************
--DECODE ES UNA FUNCION QUE SIMULA UN CASE SIMPLE
-- FORMATO :
/*
DECODE(EXPRESION,VALOR1,RESULTADO1,VALOR2,RESULTADO2,...,VALOR_POR_DEFECTO)

 */

SELECT FIRST_NAME,
       DEPARTMENT_ID,
       DECODE(DEPARTMENT_ID, 50, 'INFORMATICA', 10, 'VENTAS', 'OTRO TRABAJO') AS "DEPARTAMENTO"
FROM EMPLOYEES;

--*******************************************************************************************************
--                           CLASE 102 : EXPRESIONES CONDICIONALES-PRACTICA                             *
--*******************************************************************************************************

/**
• Visualizar los siguientes datos con CASE.
o Si el departamento es 50 ponemos Transporte
o Si el departamento es 90 ponemos Dirección
o Cualquier otro número ponemos “Otro departamento”
*/
SELECT FIRST_NAME,
       DEPARTMENT_ID,
       DECODE(DEPARTMENT_ID, 50, 'TRANSPORTE', 90, 'DIRECCION', 'OTRO DEPARTAMENTO') AS "DEPARTAMENTO"
FROM EMPLOYEES;

/*
• Mostrar de la tabla LOCATIONS, la ciudad y el país. Ponemos los
siguientes datos dependiendo de COUNTRY_ID.
o Si es US y CA ponemos América del Norte
o Si es CH, UK, DE,IT ponemos Europa
o Si es BR ponemos América del Sur
o Si no es ninguno ponemos ‘Otra zona’

• Realizar el primer ejercicio con DECODE en vez de con CASE
 */

SELECT CITY,
       COUNTRY_ID,
       CASE
           WHEN COUNTRY_ID IN ('US', 'CA') THEN 'AMERICA DEL NORTE'
           WHEN COUNTRY_ID IN ('CH', 'UK') THEN 'EUROPA'
           WHEN COUNTRY_ID = 'BR' THEN 'AMERICA DEL SUR'
           ELSE 'OTRA ZONA'
           END AS "ZONA"
FROM LOCATIONS;

--*******************************************************************************************************
--                           CLASE 103 : FUNCIONES DE GRUPO AVG,MAX,MIN                                 *
--*******************************************************************************************************

SELECT AVG(SALARY) AS PROMEDIO
FROM EMPLOYEES;

SELECT MAX(SALARY) AS "MAXIMO_SALARIO"
FROM EMPLOYEES;

SELECT MIN(SALARY) AS "MINIMO_SALARIO"
FROM EMPLOYEES;

SELECT AVG(SALARY), MAX(SALARY), MIN(SALARY)
FROM EMPLOYEES;
-- NO SE PUEDE MEZCLAR FUNCIONES DE GRUPO (SOLO TE SACAN UN VALOR)CON FUNCIONES O VALORES SIMPLES(TE SACAN VARIOS VALORES)
-- POR ESO NO SE PUEDEN MEZCLAR.
-- POR EJEMPLO :
-- SELECT FIRST_NAME, AVG(SALARY), MAX(SALARY), MIN(SALARY)
-- FROM EMPLOYEES;-- RPTA : ERROR

-- PERO LO QUE SI PODEMOS USAR ES WHERE, POR QUE ESTAMOS LIMITANDO A ESTOS DEPARTMENT_ID.
SELECT AVG(SALARY), MAX(SALARY), MIN(SALARY)
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 50;

SELECT MAX(HIRE_DATE), MIN(HIRE_DATE)
FROM EMPLOYEES;

SELECT MAX(FIRST_NAME), MIN(FIRST_NAME)
FROM EMPLOYEES;

--*******************************************************************************************************
--                           CLASE 104 : FUNCIONES DE GRUPO COUNT Y OTROS                               *
--*******************************************************************************************************
--COUNT ME CUENTA EL NUMERO DE FILAS QUE CUMPLEN UNA DETERMINADA CONDICION
-- CUENTA TODO INCLUYENDO LAS FILAS DUPLICADAS

SELECT COUNT(FIRST_NAME)
FROM EMPLOYEES;

SELECT COUNT(SALARY), COUNT(COMMISSION_PCT)
FROM EMPLOYEES;

-- PODEMOS ASEGURARNOS CONTANDO REALMENTE CON EL ID DE UNA TABLA
SELECT COUNT(EMPLOYEE_ID)
FROM EMPLOYEES;--RPTA : 107

SELECT COUNT(*)
FROM EMPLOYEES;
-- EL"*" INDICA TODO

-- CON ALGUNA CONDICION
SELECT COUNT(*)
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60;--RPTA : 5

SELECT COUNT(*)
FROM EMPLOYEES
WHERE SALARY > 6000;
--RPTA : 55

-- USO DE LA CLAUSULA DISCTINCT
SELECT COUNT(DISTINCT FIRST_NAME)
FROM EMPLOYEES;--RPTA : 91

SELECT COUNT(DISTINCT DEPARTMENT_ID)
FROM EMPLOYEES;
--RPTA :11 COUNT POR DEFECTO NO CUENTA NULOS
/**
  El DISTINCT en esta consulta implica que solo se cuentan los valores
  únicos de la columna DEPARTMENT_ID en la tabla EMPLOYEES. Es decir,
  si hay varios empleados en el mismo departamento, ese departamento
  solo se cuenta una vez. El resultado es el número total de departamentos
  diferentes presentes en la tabla.
  Hay más de 11 departamentos en total, pero en la tabla `EMPLOYEES` solo **11 de
  esos departamentos tienen empleados asignados**.
  El `COUNT(DISTINCT DEPARTMENT_ID)` cuenta únicamente los departamentos que aparecen
  en la tabla `EMPLOYEES`, no todos los departamentos que existen en la base de datos.
  Es probable que algunos departamentos no tengan empleados o que los empleados estén
  asignados solo a 11 de todos los departamentos disponibles.
  Para verificar esto, puedes ejecutar:

```sql
SELECT DISTINCT DEPARTMENT_ID
FROM EMPLOYEES
ORDER BY DEPARTMENT_ID;
```

Esto te mostrará exactamente cuáles son esos 11 departamentos que tienen empleados.
 */

SELECT DISTINCT DEPARTMENT_ID
FROM EMPLOYEES
ORDER BY DEPARTMENT_ID;

SELECT DISTINCT DEPARTMENT_ID
FROM EMPLOYEES;
--RPTA : 12 AQUI SI CUENTA NULL

--*******************************************************************************************************
--                           CLASE 106 : FUNCIONES DE GRUPO SUM Y OTROS                                 *
--*******************************************************************************************************

-- SUM

SELECT SUM(SALARY)      AS "SALARY",
       SUM(SALARY) * 12 AS "SUMA SALARIOS ANUALES",
       COUNT(*)         AS "NUMERO DE EMPLEADOS",
       AVG(SALARY)      AS "PROMEDIO"
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 50;
--rpta : 156400

-- ************** OTRO EJERCICIO CON MAX Y MIN ****************

SELECT MAX(SALARY) - MIN(SALARY)
FROM EMPLOYEES;

--*******************************************************************************************************
--                           CLASE 107 : GROUP BY                                                       *
--*******************************************************************************************************

SELECT DEPARTMENT_ID
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;
-- SIEMPRE VA AL FINALIZAR UNA CONSULTA CON FUNCIONES DE GRUPO ES COMO HACER UN DISTINCT

-- AQUI VIENE LO INTERESANTE HACER UN COUNT(*)
SELECT DEPARTMENT_ID,
       JOB_ID,
       COUNT(*),
       SUM(SALARY) AS "SUM SALARIO "-- PERO QUE RARO NO SE PODIA APLICAR FUNCIONES SIMPLES CON FUNCIONES DE GRUPO
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID, JOB_ID
ORDER BY DEPARTMENT_ID;
-- ESTA ES LA ULTIMA CLAUSULA

--*******************************************************************************************************
--                           CLASE 108 : HAVING                                                         *
--*******************************************************************************************************
-- NOTA WHERE SOLO FUNCIONA CON LAS FILAS CONCRETAS OSEA FILAS UNA CONTRA UNA
-- HAVING ES EL WHERE DE LOS GROUP BY OSEA SE HACE CONDICIONES CON LOS GRUPOS

SELECT DEPARTMENT_ID,
       JOB_ID,
       COUNT(*),
       SUM(SALARY) AS "SUM SALARIO "
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID, JOB_ID
HAVING SUM(SALARY) > 25000
   AND COUNT(*) > 10-- HAVING ME PERMITE HACER CONDICIONES PERO SOBRE EL GRUPO
ORDER BY DEPARTMENT_ID;

--*******************************************************************************************************
--                           CLASE 109 : PRACTICAS GRUPO                                                *
--*******************************************************************************************************
-- •Indicar el número de empleados del departamento 50

SELECT DEPARTMENT_ID AS "DEPARTAMENTO", COUNT(*) AS "NUMERO DE EMPLEADOS"
FROM EMPLOYEES
HAVING DEPARTMENT_ID = 50
GROUP BY DEPARTMENT_ID;

-- O ESTA FORMA
SELECT COUNT(*) AS "NUMERO DE EMPLEADOS"
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 50;

-- •Indicar el número de empleados que entraron en el año 2007 a trabajar

