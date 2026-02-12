## 🔍🗂️Seccion07 USAR SQL EN PLSQL📌

### 🗂️Clase59 : SELECTS DENTRO DE PLSQL📌

- Deseo saber el salario del empleado con ID 100, para eso puedo usar un SELECT
- dentro de un bloque PL/SQL, y almacenar el resultado en una variable.
- No olvidar el INTO para almacenar el resultado del SELECT en una variable.
- Cuando uses SELECT dentro de PL/SQL, el resultado se almacena en una variable usando INTO.

```sql
SET
SERVEROUTPUT ON;
DECLARE
SALARIO NUMBER;
    NOMBRE
EMPLOYEES.FIRST_NAME%type;
BEGIN
SELECT SALARY, FIRST_NAME-- solo puede devolver una fila select
INTO SALARIO,NOMBRE
from EMPLOYEES
WHERE EMPLOYEE_ID = 100;
DBMS_OUTPUT
.
PUT_LINE
(SALARIO);
    DBMS_OUTPUT.PUT_LINE
(NOMBRE);
END; --RPTA 24000 - STEVEN

```

![img](images/img_7.png)

---

### 🗂️Clase63 : INSERT📌

```SQL
DECLARE
COL1 TEST.C1%type;
BEGIN
    COL1 := 10;
INSERT INTO TEST (C1, C2)
VALUES (20, 'BBBB');
COMMIT;
END;

```
![img](images/img_9.png)

---
### 🗂️Clase64 : UPDATE📌

```SQL
DECLARE
T TEST.C1%type;
BEGIN
    T := 10;
    UPDATE TEST SET C2='CCCCC'
    WHERE C1 = T;
    COMMIT;
END;
```

![img](images/img_10.png)

---



### 🗂️Clase64 - DELETE

```sql
DECLARE
    T TEST.C1%type;
BEGIN
    T := 20;
    DELETE FROM TEST WHERE C1 = T;
    COMMIT;
END;
/

SELECT *
FROM TEST;
```

### 📝 Explicación:
- Se declara una variable `T` del mismo tipo que la columna `C1` de la tabla `TEST`
- Se asigna el valor `20` a la variable
- Se elimina el registro donde `C1 = 20`
- Se confirma la transacción con `COMMIT`

---

### 🗂️ 65 - PRÁCTICA

#### 📋 Ejercicio 1: Insertar nuevo departamento

#### 📖 Enunciado:
Crear un bloque que inserte un nuevo departamento en la tabla `DEPARTMENTS`. Para saber el `DEPARTMENT_ID` que debemos asignar al nuevo departamento primero debemos averiguar el valor mayor que hay en la tabla `DEPARTMENTS` y sumarle uno para la nueva clave.

**Requisitos:**
- `LOCATION_ID` debe ser 1000
- `MANAGER_ID` debe ser 100
- `DEPARTMENT_NAME` debe ser "INFORMATICA"

**NOTA**: En PL/SQL debemos usar `COMMIT` y `ROLLBACK` de la misma forma que lo hacemos en SQL. Por tanto, para validar definitivamente un cambio debemos usar `COMMIT`.

#### ✅ Solución:

```sql
DECLARE
    MAX_ID NUMBER;
BEGIN
    SELECT MAX(DEPARTMENT_ID) INTO MAX_ID FROM DEPARTMENTS;
    MAX_ID := MAX_ID + 1;
    INSERT INTO DEPARTMENTS(DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, LOCATION_ID)
    VALUES (MAX_ID, 'INFORMATICA', 100, 1000);
    COMMIT;
END;
/
```

---

#### 📋 Ejercicio 2: Modificar LOCATION_ID

#### 📖 Enunciado:
Crear un bloque PL/SQL que modifique la `LOCATION_ID` del nuevo departamento a 1700. En este caso usemos el `COMMIT` dentro del bloque PL/SQL.

#### ✅ Solución:

```sql
BEGIN
    UPDATE DEPARTMENTS
    SET LOCATION_ID = 1700
    WHERE DEPARTMENT_NAME = 'INFORMATICA';
    COMMIT;
END;
/
```

---

#### 📋 Ejercicio 3: Eliminar departamento

#### 📖 Enunciado:
Por último, hacer otro bloque PL/SQL que elimine ese departamento nuevo.

#### ✅ Solución:

```sql
BEGIN
    DELETE
    FROM DEPARTMENTS
    WHERE DEPARTMENT_NAME = 'INFORMATICA';
    COMMIT;
END;
/
```

---

### 🎓 Resumen de conceptos aplicados

#### 🔑 Conceptos clave:

| Concepto | Descripción | Ejemplo |
|----------|-------------|---------|
| `DECLARE` | Declara variables | `MAX_ID NUMBER;` |
| `SELECT INTO` | Asigna resultado de query a variable | `SELECT MAX(ID) INTO MAX_ID` |
| `INSERT` | Inserta registros | `INSERT INTO tabla VALUES (...)` |
| `UPDATE` | Modifica registros | `UPDATE tabla SET columna = valor` |
| `DELETE` | Elimina registros | `DELETE FROM tabla WHERE ...` |
| `COMMIT` | Confirma transacción | `COMMIT;` |

#### ⚠️ Buenas prácticas:

- ✅ Siempre usar `COMMIT` después de operaciones DML
- ✅ Usar variables con tipos basados en columnas (`%type`)
- ✅ Validar datos antes de operaciones destructivas
- ✅ Usar `WHERE` en `DELETE` y `UPDATE` para evitar cambios masivos accidentales
