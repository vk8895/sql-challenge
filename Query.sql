-- 1) List details of each employee: employee #, last name, first name, sex, salary
-- Method: Use employees tables and join with salaries table (join on emp#)

select employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
from employees inner join salaries
on employees.emp_no=salaries.emp_no;

----------------------------------------------------------------------------------------------------------

-- 2) List first name, last name, and hire date for employees who were hired in 1986
-- Method: Use query on where in the employees table

select last_name, first_name, hire_date
from employees
where(hire_date BETWEEN '1986-01-01' AND '1986-12-31')
order by hire_date;

----------------------------------------------------------------------------------------------------------

-- 3) List the managers of each department with the following information: department number, 
-- department name, the manager's employee number, last name, first name.
-- Method: Display appropriate columns after joining 3 tables

select employees.last_name, employees.first_name, dept_manager.emp_no, dept_manager.dept_no, 
dept.dept_name
from employees inner join dept_manager
on employees.emp_no=dept_manager.emp_no 
inner join dept
on dept.dept_no=dept_manager.dept_no;

---------------------------------------------------------------------------------------------------------

-- 4) List the employees of each department with the following information: department number, 
-- department name, the manager's employee number, last name, first name.
-- Method: Display appropriate columns after joining 3 tables

select employees.emp_no, employees.last_name, employees.first_name, dept_emp.dept_no, dept.dept_name
from employees inner join dept_emp
on employees.emp_no=dept_emp.emp_no
inner join dept
on dept.dept_no=dept_emp.dept_no; 

---------------------------------------------------------------------------------------------------------

-- 5) List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
-- Method: use query on where in employees table

select last_name, first_name, sex
from employees
where first_name = 'Hercules' and last_name like 'B%';

---------------------------------------------------------------------------------------------------------

-- 6) List all employees in the Sales department, including their employee number, 
-- last name, first name, and department name
-- Method: Use subquery, first to create desired table, then use where to isolate rows of interest

select emp_no, last_name, first_name, dept_no, dept_name from 
	(select employees.emp_no, employees.last_name, employees.first_name, dept_emp.dept_no, dept.dept_name 
	from employees inner join dept_emp
	on employees.emp_no=dept_emp.emp_no
	inner join dept
	on dept.dept_no=dept_emp.dept_no) sub6
where dept_no = 'd007'; 

---------------------------------------------------------------------------------------------------------

-- 7) List all employees in the Sales and Development departments, including their employee number, 
-- last name, first name, and department name
-- Method: Use subquery, first to create desired table, then use where to isolate rows of interest

select emp_no, last_name, first_name, dept_no, dept_name from 
	(select employees.emp_no, employees.last_name, employees.first_name, dept_emp.dept_no, dept.dept_name 
	from employees inner join dept_emp
	on employees.emp_no=dept_emp.emp_no
	inner join dept
	on dept.dept_no=dept_emp.dept_no) sub7
where dept_no = 'd007' or dept_no = 'd005';

---------------------------------------------------------------------------------------------------------

-- 8) In descending order, list the frequency count of employee last names, 
-- i.e., how many employees share each last name.
-- Method: Combine count, groupby, and orderby

select last_name, count(*)
from employees
group by last_name
order by "count" desc;

