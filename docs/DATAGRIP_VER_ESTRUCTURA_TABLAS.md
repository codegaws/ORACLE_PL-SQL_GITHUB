# 📊 Cómo Ver la Estructura de Tablas en DataGrip

## 🎯 Objetivo
Aprender a visualizar la estructura completa de una tabla en DataGrip (similar al comando `DESCRIBE` en Oracle SQL*Plus).

---

## 📋 Método 1: Panel de Estructura (Structure)

### Pasos:

1. **Localiza tu tabla en el panel izquierdo**
   - Expande tu conexión de base de datos
   - Expande el esquema (por ejemplo, `HR`)
   - Expande la carpeta `Tables`
   - Busca tu tabla (por ejemplo, `ALUMNOS`)

2. **Haz clic en la tabla**
   - Simplemente haz clic en el nombre de la tabla para seleccionarla

3. **Busca la pestaña "Structure" o "Columns"**
   - En la parte **inferior** o **lateral derecha** de DataGrip
   - Verás pestañas como: `Data`, `DDL`, `Structure`, `Indexes`, etc.
   - Haz clic en la pestaña **"Structure"** o **"Columns"**

4. **Visualiza la información**
   
   Verás una tabla con las siguientes columnas:
   
   | Columna        | Descripción                                    |
   |----------------|------------------------------------------------|
   | **Name**       | Nombre de la columna                           |
   | **Type**       | Tipo de dato (NUMBER, VARCHAR2, DATE, etc.)    |
   | **Size**       | Tamaño del campo (para VARCHAR2, NUMBER, etc.) |
   | **Not Null**   | Si la columna permite valores nulos o no       |
   | **Default**    | Valor por defecto de la columna                |
   | **Primary Key**| Si es clave primaria (PK)                      |
   | **Foreign Key**| Si es clave foránea (FK) y a qué tabla apunta  |
   | **Comment**    | Comentarios sobre la columna                   |

---

## 📋 Método 2: Ver DDL (Script de Creación)

### Pasos:

1. **Haz clic derecho sobre la tabla** en el panel izquierdo
2. Selecciona **"SQL Scripts"** > **"SQL Generator"** o **"DDL"**
3. Se abrirá una pestaña con el script completo de creación

**Ejemplo de DDL:**
```sql
create table ALUMNOS
(
    COD_ALUMNO NUMBER        not null
        primary key,
    NOMBRE     VARCHAR2(100) not null,
    APELLIDOS  VARCHAR2(100),
    COD_CURSO  NUMBER
        references CURSOS
)
/
```

---

## 📋 Método 3: Usar Query (Consulta SQL)

Si prefieres ver la estructura mediante SQL, puedes ejecutar:

### Opción A: Ver columnas de la tabla
```sql
SELECT COLUMN_NAME, 
       DATA_TYPE, 
       DATA_LENGTH, 
       NULLABLE, 
       DATA_DEFAULT,
       COLUMN_ID
FROM USER_TAB_COLUMNS
WHERE TABLE_NAME = 'ALUMNOS'
ORDER BY COLUMN_ID;
```

### Opción B: Ver restricciones (constraints)
```sql
SELECT CONSTRAINT_NAME, 
       CONSTRAINT_TYPE, 
       SEARCH_CONDITION, 
       R_CONSTRAINT_NAME
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'ALUMNOS';
```

**Tipos de constraints:**
- `P` = Primary Key
- `R` = Foreign Key (Reference)
- `C` = Check constraint
- `U` = Unique constraint
- `V` = View constraint

### Opción C: Ver índices
```sql
SELECT INDEX_NAME, 
       INDEX_TYPE, 
       UNIQUENESS, 
       TABLESPACE_NAME
FROM USER_INDEXES
WHERE TABLE_NAME = 'ALUMNOS';
```

---

## 📋 Método 4: Panel de Base de Datos (Database Explorer)

### Pasos:

1. En el panel izquierdo, **haz doble clic** sobre la tabla
2. Se abrirá automáticamente la vista de datos con varias pestañas
3. Navega entre las pestañas disponibles:
   - **Data**: Ver los datos de la tabla
   - **Structure**: Ver la estructura (columnas, tipos, restricciones)
   - **Indexes**: Ver los índices
   - **DDL**: Ver el script de creación
   - **Constraints**: Ver las restricciones (PK, FK, CHECK, etc.)
   - **Triggers**: Ver los triggers asociados
   - **Grants**: Ver los permisos de la tabla

---

## 🔍 Información Detallada que Puedes Ver

### En la pestaña "Structure" o "Columns":

Para la tabla `ALUMNOS`, verás algo como:

| Name       | Type         | Size | Not Null | Default | PK | FK           | Comment |
|------------|--------------|------|----------|---------|----|--------------|---------|
| COD_ALUMNO | NUMBER       | -    | ✓        | -       | ✓  | -            | -       |
| NOMBRE     | VARCHAR2     | 100  | ✓        | -       | -  | -            | -       |
| APELLIDOS  | VARCHAR2     | 100  | -        | -       | -  | -            | -       |
| COD_CURSO  | NUMBER       | -    | -        | -       | -  | CURSOS(CODIGO)| -      |

### En la pestaña "Constraints":

Verás las restricciones como:

| Constraint Name  | Type        | Columns    | Reference Table | Status  |
|------------------|-------------|------------|-----------------|---------|
| SYS_C008xxx      | PRIMARY KEY | COD_ALUMNO | -               | ENABLED |
| SYS_C008xxx      | FOREIGN KEY | COD_CURSO  | CURSOS          | ENABLED |
| SYS_C008xxx      | NOT NULL    | NOMBRE     | -               | ENABLED |

---

## 💡 Consejos y Atajos

### Atajos de teclado útiles:

| Atajo                  | Acción                                      |
|------------------------|---------------------------------------------|
| `Ctrl + B`             | Ir a la definición (Jump to Definition)     |
| `Ctrl + Q`             | Ver documentación rápida                    |
| `F4`                   | Editar la tabla (estructura)                |
| `Ctrl + F12`           | Ver estructura de archivo/objeto            |
| `Alt + 7`              | Abrir panel de estructura                   |

### Tips adicionales:

1. **Vista rápida**: Mantén presionado `Ctrl` y pasa el mouse sobre el nombre de la tabla en el código SQL para ver un popup con la estructura.

2. **Diagrama ER**: Haz clic derecho sobre la tabla > **"Diagrams"** > **"Show Visualization"** para ver un diagrama de relaciones.

3. **Comparar estructuras**: Puedes comparar dos tablas haciendo clic derecho > **"Compare With..."**.

4. **Exportar estructura**: Haz clic derecho > **"SQL Scripts"** > **"SQL Generator"** y elige qué exportar (CREATE, ALTER, DROP, etc.).

---

## 🎨 Personalizar la Vista

### Configurar columnas visibles:

1. En la pestaña "Structure", haz clic derecho en los encabezados de columna
2. Selecciona **"Configure Columns"** o **"Configurar columnas"**
3. Marca/desmarca las columnas que quieres ver

### Cambiar el tema visual:

1. Ve a **File** > **Settings** (o `Ctrl + Alt + S`)
2. Busca **Appearance & Behavior** > **Appearance**
3. Cambia el tema a tu preferencia

---

## 📌 Equivalencia con Oracle SQL*Plus

### En SQL*Plus usarías:
```sql
DESCRIBE ALUMNOS;
```

### En DataGrip (visualmente):
1. Clic en la tabla
2. Pestaña "Structure"

### En DataGrip (por consulta):
```sql
SELECT COLUMN_NAME, DATA_TYPE, NULLABLE, DATA_DEFAULT
FROM USER_TAB_COLUMNS
WHERE TABLE_NAME = 'ALUMNOS'
ORDER BY COLUMN_ID;
```

---

## ✅ Resumen

| Método              | Ventaja                                    | Cuándo usar                          |
|---------------------|--------------------------------------------|------------------------------------- |
| **Structure Tab**   | Visual, completo, fácil de navegar        | Exploración general de la tabla      |
| **DDL Tab**         | Código de creación, copiar/pegar          | Documentación, replicar estructura   |
| **SQL Query**       | Automatizable, personalizable             | Scripts, reportes, análisis masivos  |
| **Database Panel**  | Acceso rápido a todo (datos, estructura)  | Trabajo diario con la tabla          |

---

## 🚀 Ejemplo Práctico

Para tu tabla `ALUMNOS`:

```sql
-- auto-generated definition
create table ALUMNOS
(
    COD_ALUMNO NUMBER        not null
        primary key,
    NOMBRE     VARCHAR2(100) not null,
    APELLIDOS  VARCHAR2(100),
    COD_CURSO  NUMBER
        references CURSOS
)
/
```

**Información visible en Structure:**
- `COD_ALUMNO`: NUMBER, NOT NULL, PRIMARY KEY
- `NOMBRE`: VARCHAR2(100), NOT NULL
- `APELLIDOS`: VARCHAR2(100), NULLABLE
- `COD_CURSO`: NUMBER, NULLABLE, FOREIGN KEY → CURSOS

---

## 📚 Recursos Adicionales

- [DataGrip Documentation - Table Editor](https://www.jetbrains.com/help/datagrip/table-editor.html)
- [Oracle Data Dictionary Views](https://docs.oracle.com/en/database/oracle/oracle-database/19/refrn/about-static-data-dictionary-views.html)

---

**¡Ahora ya sabes cómo ver la estructura completa de tus tablas en DataGrip! 🎉**

