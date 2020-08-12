-- Table Schemata File

-- Create/Import Tables

--drop table employees;
create table employees (
	emp_no int,
	emp_title_id varchar(30),
	birth_date date,
	first_name varchar (50),
	last_name varchar (50),
	sex varchar (10),
	hire_date date
);

--drop table salaries;
create table salaries (
	emp_no int,
	salary int
);

--drop table dept_manager;
create table dept_manager (
	dept_no varchar (30),
	emp_no int
);

--drop table dept_emp;
create table dept_emp (
	emp_no int,
	dept_no varchar (30)
);

--drop table dept;
create table dept (
	dept_no varchar (30),
	dept_name varchar (50)
);

--drop table titles
create table titles (
	title_id varchar (30),
	title varchar (50)
);