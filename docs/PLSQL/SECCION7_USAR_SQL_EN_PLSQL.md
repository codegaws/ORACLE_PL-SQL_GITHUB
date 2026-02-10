## 🔍🗂️Seccion07 USAR SQL EN PLSQL📌

## 🔍🗂️Clase59 : SELECTS DENTRO DE PLSQL📌

- Deseo saber el salario del empleado con ID 100, para eso puedo usar un SELECT 
- dentro de un bloque PL/SQL, y almacenar el resultado en una variable.
- No olvidar el INTO para almacenar el resultado del SELECT en una variable.
- Cuando uses SELECT dentro de PL/SQL, el resultado se almacena en una variable usando INTO.

```sql
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
END; --RPTA 24000 - STEVEN

```
![img](images/img_7.png)

## 🔍🗂️Clase60 : %ROWTYPE📌
