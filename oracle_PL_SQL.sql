--*******************************************************************************************************
--*                         CLASE 30 :  BEGIN - END BLOQUES ANONIMOS

BEGIN
    dbms_output.put_line(100);
    dbms_output.put_line('AAAA' || 'XXXX');
END;
--*******************************************************************************************************
BEGIN
    NULL;-- NO HAGAS NADA

END;
--*******************************************************************************************************
--*                         CLASE 31 :  VISUALIZAR SALIDA POR PANTALLA DBMS_OUTPUT                      *
--*******************************************************************************************************
--SET SERVEROUTPUT ON

BEGIN
    dbms_output.put_line(100);
    dbms_output.put_line('AAAA' || 'XXXX');-- CONCATENACION
END;
--*******************************************************************************************************
--*                         CLASE 32 :  PRACTICA BLOQUES ANONIMOS                                       *
--*******************************************************************************************************
--SET SERVEROUTPUT ON
BEGIN
    dbms_output.put_line('GEORGE');
    dbms_output.put_line('CHINCHAYAN');
    dbms_output.put_line('GEORGE'
        || ' '
        || 'CHINCHAYAN');
END;
--*******************************************************************************************************
--*                         CLASE 33 :  VARIABLES                                                       *
--*******************************************************************************************************
--SET SERVEROUTPUT ON

DECLARE
    name     VARCHAR2(100);
    lastname VARCHAR2(100);
BEGIN
    name := 'GEORGE';
    lastname := 'CHINCHAYAN';
    dbms_output.put_line(name
        || ' '
        || lastname);
END;

--*******************************************************************************************************
--*                         CLASE 34 :  CONSTANTES - NULL                                               *
--*******************************************************************************************************
--SET SERVEROUTPUT ON

DECLARE
    x CONSTANT NUMBER          := 10;-- ES CONSTANTE
    z          NUMBER NOT NULL := 20;--NO ES CONSTANTE
BEGIN
    dbms_output.put_line(x);
    z := 30;
    dbms_output.put_line(z);
END;
--*******************************************************************************************************
--*                         CLASE 35 :  VARIABLE BOOLEAN                                                *
--*******************************************************************************************************    
--SET SERVEROUTPUT ON

DECLARE
    b1 BOOLEAN;
BEGIN
    b1 := TRUE;
    b1 := FALSE;
    b1 := NULL;
    dbms_output.put_line(b1);-- NO SE PUEDE IMPRIMIR BOOLEAN
END;
-- TRANSFORMANDO BOOLEAN A STRING
-- SET SERVEROUTPUT ON

DECLARE
    b1 BOOLEAN := TRUE;
BEGIN
    -- Opción 1: Con IF-ELSIF-ELSE
    IF b1 IS NULL THEN
        dbms_output.put_line('NULL');
    ELSIF b1 THEN
        dbms_output.put_line('TRUE');
    ELSE
        dbms_output.put_line('FALSE');
    END IF;
END;

--***************************************************************************************************
--*                         CLASE 37 :  %TYPE es del tipo                                               *
--******************************************************************************************************* 
SET SERVEROUTPUT ON

DECLARE
    x     NUMBER;
    z     x%TYPE;
    emple employees.salary%TYPE;--TABLA + COLUMNA Y TIPO
BEGIN
    emple := 100;
    dbms_output.put_line(emple);
END;
--*******************************************************************************************************
--*                         CLASE 38 :  Operadores                                                      *
--******************************************************************************************************* 
/*

+ SUMA
- RESTA
/ DIVISION
* MULTIPLICACION
** EXPONENTE
|| CONCATENAR

CONSIDERAR QUE CUALQUIER VARIABLE QUE NO SE INICIALICE VA A DEVOLVER UN NULL
*/
SET SERVEROUTPUT ON

DECLARE
    x NUMBER        := 5;
    z NUMBER        := 10;
    a VARCHAR2(100) := 'EXAMPLE';
    d DATE          := '10-01-1990';
BEGIN
    dbms_output.put_line(x * z);
    dbms_output.put_line(a || ' HELLO');
    dbms_output.put_line(d + 1);
    dbms_output.put_line(sysdate);
END;
--*******************************************************************************************************
--                     CLASE 41 :  BLOQUES ANIDADOS                                                     *
--******************************************************************************************************* 
-- ES UN BLOQUE HIJO PRACTICAMENTE UN BLOQUE ANIDADO-
SET SERVEROUTPUT ON;

BEGIN
    dbms_output.put_line('EN EL PRIMER BLOQUE');
    DECLARE
        x NUMBER := 10;
    BEGIN
        dbms_output.put_line(x);
    END;
END;
--*******************************************************************************************************
--                     CLASE 42 :  AMBITOS DE VARIABLES EN BLOQUES ANIDADOS                             *
--*******************************************************************************************************

SET SERVEROUTPUT ON;

DECLARE
    x NUMBER := 20; --GLOBAL
    z NUMBER := 30; --GLOBAL
BEGIN
    dbms_output.put_line('X:=' || x);
    DECLARE
        x NUMBER := 10; --LOCAL
        z NUMBER := 100;
        y NUMBER := 200; -- LAS VARIABLES LOCALES NO TIENEN ACCESO LOS PADRES PERO SI ALREVEZ
    BEGIN
        dbms_output.put_line('X:=' || x);
        dbms_output.put_line('Z:=' || z);
    END;

    --dbms_output.put_line('Y:=' || y); no puede imprimirse por que es una variable hija
END;

--*******************************************************************************************************
--                     CLASE 43 :  USO DE FUNCIONES SQL DENTRO DE PL/SQL                                  *
--*******************************************************************************************************
SET SERVEROUTPUT ON;

DECLARE
    x     VARCHAR(50);
    mayus VARCHAR(100);
    fecha DATE;
    z     NUMBER := 109.80;
BEGIN
    x := 'Ejemplo';
    dbms_output.put_line(substr(x, 2, 4));
    mayus := upper(x);
    dbms_output.put_line(mayus);
    fecha := sysdate;
    dbms_output.put_line(fecha);
    dbms_output.put_line(floor(z));
END;

--*******************************************************************************************************
--                     CLASE46  :  OPERADORES LOGICOS Y RELACIONALES                                    *
--*******************************************************************************************************
-- COMANDO IF
DECLARE
    x NUMBER := 10;
BEGIN
    IF x = 10 THEN
        dbms_output.put_line('X:=10');
    ELSE
        dbms_output.put_line('X:=OTHER VALUE');
    END IF;
END;

-- COMANDO ELSIF
DECLARE
    sales NUMBER := 51000;
    bonus NUMBER := 0;
BEGIN
    IF sales > 50000 THEN
        bonus := 1500;
    ELSIF sales > 35000 THEN
        bonus := 500;
    ELSIF sales > 20000 THEN
        bonus := 1500;
    ELSE
        bonus := 100;
    END IF;

    dbms_output.put_line('Sales ='
        || sales
        || ', bonus= '
        || bonus
        || '.');

END;
--*******************************************************************************************************
--                       PRACTICA COMANDO IF                                                            *
--*******************************************************************************************************
-- 1. PRÁCTICA 1
-- • Debemos hacer un bloque PL/SQL anónimo, donde declaramos una variable
-- NUMBER y la ponemos algún valor.
-- • Debe indicar si el número es PAR o IMPAR. Es decir debemos usar IF..... ELSE
-- para hacer el ejercicio
-- • Como pista, recuerda que hay una función en SQL denominada MOD, que
-- permite averiguar el resto de una división.
-- • Por ejemplo MOD(10,4) nos devuelve el resto de dividir 10 por 4.

-- SOLUCION :
DECLARE
    x NUMBER := 3;
BEGIN
    IF MOD(X, 2) = 0 THEN
        dbms_output.put_line('EL NUMERO ES PAR');
    ELSE
        dbms_output.put_line('EL NUMERO ES IMPAR');
    END IF;
END;

--2. PRÁCTICA 2
--• Crear una variable CHAR(1) denominada TIPO_PRODUCTO.
--• Poner un valor entre "A" Y "E"
--• Visualizar el siguiente resultado según el tipo de producto
--o 'A' --> Electronica
--o 'B' --> Informática
--o 'C' --> Ropa
--o 'D' --> Música
--o 'E' --> Libros
--o Cualquier otro valor debe visualizar "El código es incorrecto
-- SOLUCION :

DECLARE
    TIPO_PRODUCTO CHAR(1);
BEGIN
    TIPO_PRODUCTO := UPPER('A');
    IF TIPO_PRODUCTO = 'A' THEN
        DBMS_OUTPUT.PUT_LINE('ELECTRÓNICA');
    ELSIF TIPO_PRODUCTO = 'B' THEN
        DBMS_OUTPUT.PUT_LINE('INFORMÁTICA');
    ELSIF TIPO_PRODUCTO = 'C' THEN
        DBMS_OUTPUT.PUT_LINE('ROPA');
    ELSIF TIPO_PRODUCTO = 'D' THEN
        DBMS_OUTPUT.PUT_LINE('MÚSICA');
    ELSIF TIPO_PRODUCTO = 'E' THEN
        DBMS_OUTPUT.PUT_LINE('LIBRO');
    ELSE
        DBMS_OUTPUT.PUT_LINE('EL CÓDIGO ES INCORRECTO');
    END IF;
END;
--*******************************************************************************************************
--                       CLASE 49 COMANDO CASE                                                       *
--*******************************************************************************************************
-- SET SERVEROUTPUT ON;
DECLARE
    v1 CHAR(1);
BEGIN
    v1 := 'B';
    CASE v1
        WHEN 'A' THEN dbms_output.put_line('EXCELLENT');
        WHEN 'B' THEN dbms_output.put_line('VERY GOOD');
        WHEN 'C' THEN dbms_output.put_line('GOOD');
        WHEN 'D' THEN dbms_output.put_line('FAIR');
        WHEN 'E' THEN dbms_output.put_line('POOR');
        ELSE dbms_output.put_line('NO SUCH VALUE');
        END CASE;
END;
--*******************************************************************************************************
--                       CLASE 50 SEARCHED CASE : NOS PERMITE HACER BUSQUEDAS MAS COMPLEJAS             *
--*******************************************************************************************************
-- SET SERVEROUTPUT ON;

DECLARE
    bonus NUMBER;
BEGIN
    bonus := 100;
    CASE
        WHEN bonus > 500 THEN DBMS_OUTPUT.PUT_LINE('EXCELLENT');
        WHEN bonus <= 500 AND bonus > 250 THEN DBMS_OUTPUT.PUT_LINE('VERY GOOD');
        WHEN bonus <= 250 AND bonus > 100 THEN DBMS_OUTPUT.PUT_LINE('GOOD');
        ELSE DBMS_OUTPUT.PUT_LINE('POOR!!!');
        END CASE;
END;
--*******************************************************************************************************
--                       PRACTICA CON CASE                                                              *
--*******************************************************************************************************
SET SERVEROUTPUT ON;

DECLARE
    usuario VARCHAR2(40);
BEGIN
    usuario := user;
    CASE
        WHEN usuario = 'SYS' THEN dbms_output.put_line('USUARIO SUPERADMINISTRADOR');
        WHEN usuario = 'SYSTEM' THEN dbms_output.put_line('ERES ADMINISTRADOR NORMAL');
        WHEN usuario = 'HR' THEN dbms_output.put_line('ERES RECURSOS HUMANOS');
        ELSE dbms_output.put_line('USUARIO NO AUTORIZADO');
        END CASE;
END;
--*********** PARA SABER TU USUARIO ACTUAL CONECTADO ES HR
SELECT USER
FROM DUAL;
--*********** PARA SABER TU USUARIO ACTUAL CONECTADO ES HR USANDO BLOQUE PLSQL
-- En un bloque PL/SQL
DECLARE
    usuario VARCHAR2(128);
BEGIN
    usuario := USER;
    DBMS_OUTPUT.PUT_LINE('Usuario actual: ' || usuario);
END;

--*******************************************************************************************************
--                       CLASE 52 BUCLE LOOP                                                            *
--*******************************************************************************************************
DECLARE
    X NUMBER := 1;
BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE('VALOR DE X: ' || X);
        X := X + 1;
        /*IF X = 11
        THEN
            EXIT;
        END IF;*/
        EXIT WHEN X = 11;
    END LOOP;
END;
--*******************************************************************************************************
--                       CLASE 53 BUCLE LOOP ANIDADO - ETIQUETAS                                                   *
--*******************************************************************************************************
DECLARE
    s PLS_INTEGER := 0;
    i PLS_INTEGER := 0;
    j PLS_INTEGER ;
BEGIN
    <<parent>>
    LOOP
        -- Print Parent
        i := i + 1;
        j := 100;
        DBMS_OUTPUT.PUT_LINE('PARENT LOOP ITERATION: ' || i);
        <<child>>
        LOOP
            -- Print Child
            EXIT parent WHEN (i > 3);
            DBMS_OUTPUT.PUT_LINE('Child:' || j);
            j := j + 1;
            EXIT child WHEN (j > 105);
        END LOOP child;
    END LOOP parent;
    DBMS_OUTPUT.PUT_LINE('FINISH!!!');
END;
/*     explicacion
El error principal en el código es un **error tipográfico** en la última línea:

## ❌ Error encontrado

```sql
DBMS_OUPUT.PUT_LINE('FINISH!!!');
```

**Falta la letra 'T'** en `DBMS_OUTPUT`. Debería ser:

```sql
DBMS_OUTPUT.PUT_LINE('FINISH!!!');
```

## ✅ Código corregido

```sql
DECLARE
    s PLS_INTEGER := 0;
    i PLS_INTEGER := 0;
    j PLS_INTEGER;
BEGIN
    <<parent>>
    LOOP
        -- Print Parent
        i := i + 1;
        j := 100;
        DBMS_OUTPUT.PUT_LINE('PARENT LOOP ITERATION: ' || i);
        <<child>>
        LOOP
            -- Print Child
            EXIT parent WHEN (i > 3);
            DBMS_OUTPUT.PUT_LINE('Child:' || j);
            j := j + 1;
            EXIT child WHEN (j > 105);
        END LOOP child;
    END LOOP parent;
    DBMS_OUTPUT.PUT_LINE('FINISH!!!'); -- ✅ Corregido: agregada la 'T'
END;
/
```

## 📋 Otros problemas menores

- La variable `s` se declara pero nunca se usa
- Falta el separador `/` al final del bloque para ejecutarlo correctamente en Oracle

Este error tipográfico causará un **error de compilación** porque Oracle no reconocerá el procedimiento `DBMS_OUPUT` (sin la 'T').

*/

--*******************************************************************************************************
--                       CLASE 54 COMANDO CONTINUE                                              *       *
--*******************************************************************************************************
DECLARE
    x NUMBER := 0;
BEGIN
    LOOP
        -- con continue saltamos aqui
        DBMS_OUTPUT.PUT_LINE('LOOP: x = ' || TO_CHAR(x));
        x := x + 1;
        /*IF x < 3 THEN
            CONTINUE;
        end if;*/
        CONTINUE WHEN x < 3;
        DBMS_OUTPUT.PUT_LINE('DESPUES DEL CONTINUE: x = ' || TO_CHAR(x));
        EXIT WHEN x = 5;
    end loop;
    DBMS_OUTPUT.PUT_LINE(' DESPUES DEL LOOP : x = ' || TO_CHAR(x));
end;
--*******************************************************************************************************
--                       CLASE 55 BUCLE FOR                                                     *       *
--*******************************************************************************************************
-- SET SERVEROUTPUT ON;
DECLARE
    I VARCHAR2(100) := 'aaaa';
BEGIN
    FOR i IN 5..15
        LOOP
            -- PLS INTEGER IMPLICITO NO SE DECLARA LA i
            DBMS_OUTPUT.PUT_LINE('VALOR DE I: ' || TO_CHAR(i));
            EXIT WHEN i = 10;-- aqui sale del loop
        end loop;
    DBMS_OUTPUT.PUT_LINE(i);-- ERROR PORQUE i NO ES VISIBLE FUERA DEL LOOP
end;
--*******************************************************************************************************
--                       CLASE 56 WHILE                                                         *       *
--*******************************************************************************************************
-- WHILE NOS PERMITE HACER BUCLES MIENTRAS UNA CONDICION SEA VERDADERA
-- SET SERVEROUTPUT ON;
DECLARE
    done BOOLEAN := FALSE;
    x    NUMBER  := 0;
BEGIN
    WHILE x < 10
        LOOP
            DBMS_OUTPUT.PUT_LINE('VALOR DE X: ' || TO_CHAR(x));
            x := x + 1;
            EXIT WHEN x = 5;-- AQUI SALE DEL LOOP
        end loop;
    WHILE done
        LOOP
            dbms_output.put_line('NO IMPRIME ESTO');
            done := TRUE;-- CAMBIAMOS LA CONDICION PARA QUE NO SEA VERDADERA Y SALGA DEL LOOP
        end loop;

    WHILE NOT done
        LOOP
            DBMS_OUTPUT.PUT_LINE('HE PASADO POR AQUI');
            done := TRUE;-- CAMBIAMOS LA CONDICION PARA QUE NO SEA VERDADERA Y SALGA DEL LOOP
        end loop;
end;

--*******************************************************************************************************
--                       CLASE 57 COMANDO GOTO                                                  *       *
--*******************************************************************************************************
-- NO ES RECOMENDABLE USAR GOTO PORQUE GENERA CODIGO SPAGUETI
SET SERVEROUTPUT ON;
DECLARE
    p VARCHAR2(30);
    n PLS_INTEGER := 5;
BEGIN
    FOR j in 2..ROUND(SQRT(n))
        LOOP
            IF n MOD j = 0 THEN
                p := ' no es un numero primo';
                GOTO print_now;
            end if;
        end loop;
    p := ' es un numero primo';
    <<print_now>>
        DBMS_OUTPUT.PUT_LINE(TO_CHAR(n) || p);
end;

--*******************************************************************************************************
--                       CLASE 59 SELECTS dentro de PLSQL                                       *       *
--*******************************************************************************************************
SET SERVEROUTPUT ON;
DECLARE
    SALARIO NUMBER;
    NOMBRE  EMPLOYEES.FIRST_NAME%type;
BEGIN
    SELECT SALARY, FIRST_NAME-- solo puede devolver una fila select
    INTO SALARIO,NOMBRE
    from EMPLOYEES
    WHERE EMPLOYEE_ID = 100;
    DBMS_OUTPUT.PUT_LINE(SALARIO);
    DBMS_OUTPUT.PUT_LINE(NOMBRE);
END;
--RPTA 24000 - STEVEN

--*******************************************************************************************************
--                       CLASE 60 ROWTYPE                                                      *       *
--*******************************************************************************************************
SET SERVEROUTPUT ON;
DECLARE
    --SALARIO  NUMBER;
    --NOMBRE   EMPLOYEES.FIRST_NAME%type;
    EMPLEADO EMPLOYEES%ROWTYPE;-- TODA LA FILA DE EMPLOYEES
BEGIN
    SELECT *-- solo puede devolver una fila select
    INTO EMPLEADO
    from EMPLOYEES
    WHERE EMPLOYEE_ID = 100;
    DBMS_OUTPUT.PUT_LINE(EMPLEADO.SALARY * 100);
    DBMS_OUTPUT.PUT_LINE(EMPLEADO.FIRST_NAME);
END;
-- RPTA -> 2400000 - Steven

--*******************************************************************************************************
--                        ROWTYPE EJERCICIO                                                      *       *
--*******************************************************************************************************

/**
  1. PRÁCTICA 1
• Crear un bloque PL/SQL que devuelva al salario máximo del
departamento 100 y lo deje en una variable denominada salario_maximo
y la visualice
 */

SET SERVEROUTPUT ON;
DECLARE
    salario_maximo NUMBER;
BEGIN
    SELECT SALARY
    INTO salario_maximo
    FROM EMPLOYEES
    WHERE DEPARTMENT_ID = 100
      AND SALARY = (SELECT MAX(SALARY)
                    FROM EMPLOYEES
                    WHERE DEPARTMENT_ID = 100);
    DBMS_OUTPUT.PUT_LINE('EL SALARIO MÁXIMO DEL DEPARTAMENTO 100 ES: ' || salario_maximo);

END;

-- OTRA SOLUCION
SET SERVEROUTPUT ON;
DECLARE
    salario_maximo EMPLOYEES.SALARY%type;
BEGIN
    SELECT MAX(SALARY)
    INTO salario_maximo
    FROM EMPLOYEES
    WHERE DEPARTMENT_ID = 100;
    DBMS_OUTPUT.PUT_LINE('EL SALARIO MÁXIMO DEL DEPARTAMENTO 100 ES: ' || salario_maximo);
END;

/***
  2. PRÁCTICA2
• Visualizar el tipo de trabajo del empleado número 100
 */
SET SERVEROUTPUT ON;
DECLARE
    TIPO_TRABAJO EMPLOYEES.JOB_ID%type;
BEGIN
    SELECT JOB_ID
    INTO TIPO_TRABAJO
    FROM EMPLOYEES
    WHERE EMPLOYEE_ID = 100;
    DBMS_OUTPUT.PUT_LINE('EL TIPO DE TRABAJO DEL EMPLEADO 100 ES: ' || TIPO_TRABAJO);

    -- RPTA -> EL TIPO DE TRABAJO DEL EMPLEADO 100 ES: AD_PRES
END;

/***
3. PRÁCTICA 3
• Crear una variable de tipo DEPARTMENT_ID y ponerla algún valor, por
ejemplo 10.
• Visualizar el nombre de ese departamento y el número de empleados
que tiene, poniendo. Crear dos variables para albergar los valores.
 */

SET SERVEROUTPUT ON;
DECLARE
    COD_DEPARTMENT      DEPARTMENTS.DEPARTMENT_ID%type := 30;
    NOMBRE_DEPARTAMENTO DEPARTMENTS.DEPARTMENT_NAME%type;
    NUMERO_EMPLEADOS    NUMBER;
BEGIN
    --RECUPERAR EL NOMBRE DEL DEPARTAMENTO
    SELECT DEPARTMENT_NAME
    INTO NOMBRE_DEPARTAMENTO
    FROM DEPARTMENTS
    WHERE DEPARTMENT_ID = COD_DEPARTMENT;
    --RECUPERAR EL NÚMERO DE EMLEADOS DEL DEPARTAMENTO
    SELECT COUNT(*)
    INTO NUMERO_EMPLEADOS
    FROM EMPLOYEES
    WHERE DEPARTMENT_ID = COD_DEPARTMENT;
    --VISUALIZAR LOS RESULTADOS
    DBMS_OUTPUT.PUT_LINE('EL NOMBRE DEL DEPARTAMENTO ' || COD_DEPARTMENT || ' ES: ' || NOMBRE_DEPARTAMENTO);
    DBMS_OUTPUT.PUT_LINE('EL NÚMERO DE EMPLEADOS DEL DEPARTAMENTO ' || COD_DEPARTMENT || ' ES: ' || NUMERO_EMPLEADOS);


    /** RPTA ->
  EL NOMBRE DEL DEPARTAMENTO 30 ES: Purchasing
  EL NÚMERO DE EMPLEADOS DEL DEPARTAMENTO 30 ES: 6
 */
END;


/***
  4. PRÁCTICA 4
• Mediante dos consultas recuperar el salario máximo y el salario mínimo
de la empresa e indicar su diferencia
 */

SET SERVEROUTPUT ON;

DECLARE
    SALARIO_MAX EMPLOYEES.SALARY%TYPE;
    SALARIO_MIN EMPLOYEES.SALARY%TYPE;
    DIFERENCIA  NUMBER;

BEGIN
    SELECT MAX(SALARY), MIN(SALARY)
    INTO SALARIO_MAX,SALARIO_MIN
    FROM EMPLOYEES;
    DIFERENCIA := SALARIO_MAX - SALARIO_MIN;
    DBMS_OUTPUT.PUT_LINE('EL SALARIO MÁXIMO DE LA EMPRESA ES: ' || SALARIO_MAX);
    DBMS_OUTPUT.PUT_LINE('EL SALARIO MÍNIMO DE LA EMPRESA ES: ' || SALARIO_MIN);
    DBMS_OUTPUT.PUT_LINE('LA DIFERENCIA ENTRE EL SALARIO MÁXIMO Y MÍNIMO DE LA EMPRESA ES: ' || DIFERENCIA);
END;

/***+ rpta ->
  EL SALARIO MÁXIMO DE LA EMPRESA ES: 24000
EL SALARIO MÍNIMO DE LA EMPRESA ES: 2100
LA DIFERENCIA ENTRE EL SALARIO MÁXIMO Y MÍNIMO DE LA EMPRESA ES: 21900
 */







