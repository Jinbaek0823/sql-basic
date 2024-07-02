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


--List the employee number, last name, first name, sex, and salary of each employee.
select e.emp_no, e.last_name, e.first_name, e.sex, s.salary from employees as e
join salaries as s on e.emp_no = s.emp_no

--List the first name, last name, and hire date for the employees who were hired in 1986.
select first_name, last_name, hire_date from employees
where hire_date between '1986-01-01' and '1986-12-31'

--List the manager of each department along with their department number, department name, employee number, last name, and first name.
select d.dept_no, d.dept_name, dm.emp_no, e.emp_no, e.last_name, e.first_name 
FROM departments as d
JOIN dept_manager as dm ON d.dept_no = dm.dept_no
JOIN employees as e ON dm.emp_no = e.emp_no;

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
select d.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name 
from employees as e
join dept_emp as de on e.emp_no = de.emp_no
join departments as d on de.dept_no = d.dept_no;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
select first_name, last_name, sex from employees
where first_name = 'Hercules' and last_name like 'B%';

--List each employee in the Sales department, including their employee number, last name, and first name.
select e.emp_no, e.last_name, e.first_name from employees as e
join dept_emp as de on e.emp_no = de.emp_no
join departments as d on de.dept_no = d.dept_no
where d.dept_name = 'Sales';

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e
join dept_emp as de on e.emp_no = de.emp_no
join departments as d on de.dept_no = d.dept_no
where d.dept_name IN ('Sales', 'Development');

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
select last_name, count (*) as frequency
from employees
group by last_name
order by frequency desc;
