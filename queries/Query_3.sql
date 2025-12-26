create table HR.EMPLOYEES
(
    EMPLOYEE_ID    NUMBER(6)    not null
        constraint EMP_EMP_ID_PK
            primary key,
    FIRST_NAME     VARCHAR2(20),
    LAST_NAME      VARCHAR2(25) not null
        constraint EMP_LAST_NAME_NN
            check ("LAST_NAME" IS NOT NULL),
    EMAIL          VARCHAR2(25) not null
        constraint EMP_EMAIL_UK
            unique
        constraint EMP_EMAIL_NN
            check ("EMAIL" IS NOT NULL),
    PHONE_NUMBER   VARCHAR2(20),
    HIRE_DATE      DATE         not null
        constraint EMP_HIRE_DATE_NN
            check ("HIRE_DATE" IS NOT NULL),
    JOB_ID         VARCHAR2(10) not null
        constraint EMP_JOB_NN
            check ("JOB_ID" IS NOT NULL),
    SALARY         NUMBER(8, 2)
        constraint EMP_SALARY_MIN
            check (salary > 0),
    COMMISSION_PCT NUMBER(2, 2),
    MANAGER_ID     NUMBER(6)
        constraint EMP_MANAGER_FK
            references HR.EMPLOYEES,
    DEPARTMENT_ID  NUMBER(4)
        constraint EMP_DEPT_FK
            references HR.DEPARTMENTS
)
/

