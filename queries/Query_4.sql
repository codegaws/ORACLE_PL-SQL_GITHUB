CREATE TABLE CURSOS
(
    CODIGO NUMBER PRIMARY KEY,
    NOMBRE VARCHAR2(100) NOT NULL
);

CREATE TABLE ALUMNOS
(
    COD_ALUMNO NUMBER PRIMARY KEY,
    NOMBRE     VARCHAR2(100) NOT NULL,
    APELLIDOS  VARCHAR2(100),
    COD_CURSO  NUMBER REFERENCES CURSOS (CODIGO) -- ← FK directa en ALUMNOS
);

-- Tabla CURSOS
INSERT INTO CURSOS
VALUES (1, 'Matemáticas');
INSERT INTO CURSOS
VALUES (2, 'Programación');
INSERT INTO CURSOS
VALUES (3, 'Base de Datos');

-- Tabla ALUMNOS (cada uno en UN SOLO curso)
INSERT INTO ALUMNOS
VALUES (101, 'Juan', 'Pérez', 1); -- Juan → Matemáticas
INSERT INTO ALUMNOS
VALUES (102, 'María', 'García', 1); -- María → Matemáticas
INSERT INTO ALUMNOS
VALUES (103, 'Pedro', 'López', 2); -- Pedro → Programación
INSERT INTO ALUMNOS
VALUES (104, 'Ana', 'Martínez', 2); -- Ana → Programación
INSERT INTO ALUMNOS
VALUES (105, 'Luis', 'Rodríguez', 3); -- Luis → Base de Datos

select *
from CURSOS;
select *
from ALUMNOS;

SELECT *
FROM CURSOS C
         JOIN ALUMNOS A ON C.CODIGO = A.COD_CURSO;

-- VALIDANDO
INSERT INTO ALUMNOS
VALUES (101, 'Juan', 'Pérez', 2); -- Juan → Programación (PK duplicada)

COMMIT;