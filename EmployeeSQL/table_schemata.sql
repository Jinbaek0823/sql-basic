-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/NYRG3X
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS employees;

	

CREATE TABLE Departments (
    dept_no VARCHAR(50)  NOT NULL ,
    dept_name VARCHAR(50)  NOT NULL ,
    PRIMARY KEY (
        dept_no
    )
);

CREATE TABLE dept_emp (
    emp_no INT NOT NULL ,
    dept_no VARCHAR(250) NOT NULL ,
    PRIMARY KEY (
        emp_no
    )
);


CREATE TABLE dept_manager (
    dept_no VARCHAR(50)  NOT NULL ,
    emp_no int  NOT NULL ,
    PRIMARY KEY (
        emp_no
    )
);

CREATE TABLE employees (
    emp_no int  NOT NULL ,
    emp_title_id VARCHAR(50)  NOT NULL ,
    birth_date date  NOT NULL ,
    first_name VARCHAR(50)  NOT NULL ,
    last_name VARCHAR(50)  NOT NULL ,
    sex VARCHAR(50)  NOT NULL ,
    hire_date date  NOT NULL ,
    PRIMARY KEY (
        emp_no
    )
);

CREATE TABLE salaries (
    emp_no int  NOT NULL ,
    salary int  NOT NULL ,
    PRIMARY KEY (
        emp_no
    )
);

CREATE TABLE titles (
    title_id VARCHAR(50)  NOT NULL ,
    title VARCHAR(50)  NOT NULL ,
    PRIMARY KEY (
        title_id
    )
);

ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_dept_no FOREIGN KEY(dept_no)
REFERENCES departments (dept_no);

ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_dept_no FOREIGN KEY(dept_no)
REFERENCES Departments (dept_no);

ALTER TABLE employees ADD CONSTRAINT fk_employees_emp_title_id FOREIGN KEY(emp_title_id)
REFERENCES titles (title_id);

select * from departments
select * from dept_emp
select * from dept_manager
select * from employees
select * from salaries 
select * from titles

