--List the employee number, last name, first name, sex, and salary of each employee
SELECT e.emp_no,e.last_name,e.first_name,sex,s.salary
FROM employees e
INNER JOIN salaries s ON e.emp_no=s.emp_no

--List the first name, last name, and hire date for the employees who were hired in 1986
SELECT first_name,last_name,hire_date
FROM employees
WHERE hire_date LIKE '%/1986'

--List the manager of each department along with their department number, department name, employee number, last name, and first name
SELECT j.dept_no, d.dept_name, j.emp_no, e.last_name, e.first_name
FROM dept_manager j
LEFT JOIN employees e ON e.emp_no=j.emp_no
LEFT JOIN departments d ON d.dept_no=j.dept_no

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name
SELECT e.emp_no,d.dept_no,e.last_name,e.first_name,dp.dept_name
FROM employees e
INNER JOIN dept_emp d ON e.emp_no=d.emp_no
INNER JOIN departments dp ON d.dept_no=dp.dept_no

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'

--List each employee in the Sales department, including their employee number, last name, and first name
SELECT emp_no, last_name, first_name
FROM employees
WHERE emp_no IN (SELECT emp_no
	 			FROM dept_emp
	 			WHERE dept_no = (SELECT dept_no
		 						FROM departments
		 						WHERE dept_name='Sales'
								)
	 			)

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
SELECT e.emp_no, e.last_name, e.first_name, dp.dept_name
FROM employees e
INNER JOIN dept_emp d ON e.emp_no = d.emp_no
INNER JOIN (SELECT * 
			FROM departments
			WHERE dept_name = 'Sales' OR dept_name = 'Development'
		   ) dp ON d.dept_no=dp.dept_no

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)
SELECT last_name, count(last_name) as "Frequency"
FROM employees
GROUP BY last_name
ORDER BY "Frequency" DESC
