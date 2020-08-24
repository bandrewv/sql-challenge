-- Data Analysis item #1
-- "List the following details of each employee: employee number, last name, first name, sex, and salary."
SELECT e.emp_no AS "Employee No."
	  ,last_name AS "Last Name"
	  ,first_name AS "First Name"
	  ,sex AS "Sex"
	  ,salary AS "Salary"
-- Providing aliases for easier coding.
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no
;

-- Data Analysis item #2
-- "List first name, last name, and hire date for employees who were hired in 1986."
SELECT first_name AS "First Name"
	  ,last_name AS "Last Name"
	  ,hire_date AS "Hire Date"
FROM employees
-- Utilized the DATE_PART() function to isolate the year.
WHERE DATE_PART('year',hire_date) = 1986
;

-- Data Analysis item #3
-- "List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name."
SELECT d.dept_no AS "Department No."
	  ,dept_name AS "Department"
	  ,e.emp_no AS "Employee No."
 	  ,last_name AS "Last Name"
 	  ,first_name AS "First Name"
FROM departments d
JOIN dept_manager dm ON d.dept_no = dm.dept_no
JOIN employees e ON dm.emp_no = e.emp_no
-- Joining the 'titles' table to ensure that the employees in this table all have the title of 'Manager'.
JOIN titles t ON e.emp_title_id = t.title_id
WHERE title = 'Manager'
;

-- Data Analysis item #4
-- "List the department of each employee with the following information: employee number, last name, first name, and department name."
SELECT e.emp_no AS "Employee No."
	  ,last_name AS "Last Name"
	  ,first_name AS "First Name"
	  ,dept_name AS "Department"
FROM employees e
JOIN dept_employees de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
;

-- Data Analysis item #5
-- "List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B.""
SELECT first_name AS "First Name"
	  ,last_name AS "Last Name"
	  ,sex AS "Sex"
FROM employees
WHERE first_name = 'Hercules'
	  AND last_name LIKE 'B%'
;

-- Data Analysis item #6
-- "List all employees in the Sales department, including their employee number, last name, first name, and department name."
SELECT e.emp_no AS "Employee No."
	  ,last_name AS "Last Name"
	  ,first_name AS "First Name"
	  ,dept_name AS "Department"
FROM employees e
JOIN dept_employees de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE dept_name = 'Sales'
;

-- Data Analysis item #7
-- "List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name."
SELECT e.emp_no AS "Employee Number"
	  ,last_name AS "Last Name"
	  ,first_name AS "First Name"
	  ,dept_name AS "Department"
FROM employees e
JOIN dept_employees de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE dept_name IN ('Sales','Development')
;

-- Data Analysis item #8
-- "In descending order, list the frequency count of employee last names, i.e., how many employees share each last name."
SELECT last_name AS "Last Name"
	  ,count(emp_no) AS "Freq. of Last Name"
FROM employees
GROUP BY last_name
ORDER BY count(emp_no) DESC
;
