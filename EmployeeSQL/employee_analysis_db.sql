-- GENERAL OBSERVATIONS
   -- The frequency of employees sharing last names is high. It is therefore essential to use employee no for references or business matters
   -- There are some employees who work for more than one department
   -- The minimum salary for both genders is $ 40,000
   

-- List the following details of each employee: 
   ---employee number, last name, first name, gender, and salary.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salary
FROM employees
JOIN salaries
ON employees.emp_no = salaries.emp_no;


-- List employees who were hired in 1986.
select employees.last_name,employees.first_name,employees.hire_date
from employees
WHERE hire_date BETWEEN '1986-01-01' AND '1987-01-01';


--List the manager of each department with the following information: 
    ---department number, department name, the manager's employee number, 
	---last name, first name, and start and end employment date

SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, 
employees.first_name, dept_manager.from_date, dept_manager.to_date
FROM departments
JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no
JOIN employees
ON dept_manager.emp_no = employees.emp_no;

--List the department of each employee with the following information: 
  ---employee number, last name, first name, and department name.

SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no;

--List all employees whose first name is "Hercules" and last names begin with "B."

SELECT first_name, last_name
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

--List all employees in the Sales department, 
  ---including their employee number, 
  ---last name, first name, and department name.
  
select dept_emp.emp_no,employees.last_name,employees.first_name,departments.dept_name 

FROM departments
JOIN dept_emp
ON dept_emp.dept_no = departments.dept_no
JOIN employees
ON dept_emp.emp_no = employees.emp_no
Where dept_name = 'Sales';


--List all employees in the Sales and Development departments, 
  ---including their employee number, last name, first name, and department name.


select dept_emp.emp_no,employees.last_name,employees.first_name,departments.dept_name 

FROM departments
JOIN dept_emp
ON dept_emp.dept_no = departments.dept_no
JOIN employees
ON dept_emp.emp_no = employees.emp_no
Where dept_name = 'Sales'
OR dept_name = 'Development';

--In descending order, list the frequency count of employee last names, 
  ---i.e., how many employees share each last name.
 
select last_name,
COUNT(last_name)AS "frequency"
FROM employees
GROUP BY last_name
ORDER BY "frequency" DESC;



