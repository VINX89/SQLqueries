USE employees;

SELECT 
    first_name, last_name
FROM
    employees;

SELECT 
    *
FROM
    employees;
    
SELECT
	dept_no
FROM
	departments;
    
SELECT
	*
FROM
	departments;
    
SELECT
	*
FROM
	employees
WHERE first_name = 'Denis';

SELECT
	*
FROM
	employees
WHERE first_name = 'Elvis';

SELECT
	*
FROM
	employees
WHERE first_name = 'Denis' AND gender = 'M';

SELECT
	*
FROM
	employees
WHERE first_name = 'Kellie' AND gender = 'F';

SELECT
	*
FROM
	employees
WHERE first_name = 'Denis' OR first_name = 'Elvis';

SELECT
	*
FROM
	employees
WHERE first_name = 'Kellie' OR first_name = 'Aruna';

SELECT
	*
FROM
	employees
WHERE last_name = 'Denis' AND (gender = 'M' OR gender = 'F');

SELECT
	*
FROM
	employees
WHERE gender = 'F' AND (first_name = 'Kellie' OR first_name = 'Aruna');

SELECT
	*
FROM
	employees
WHERE first_name IN ('Cathie', 'Mark', 'Nathan');

SELECT
	*
FROM
	employees
WHERE first_name NOT IN ('Cathie', 'Mark', 'Nathan');

SELECT
	*
FROM
	employees
WHERE first_name IN ('Denis', 'Elvis');

SELECT
	*
FROM
	employees
WHERE first_name NOT IN ('John', 'Mark', 'Jacob');

# All names starting with Mar
SELECT
	*
FROM
	employees
WHERE first_name LIKE ( 'Mar%' );

# All names with 4 chars only starting with Mar
SELECT
	*
FROM
	employees
WHERE first_name LIKE ( 'Mar_' );

SELECT
	*
FROM
	employees
WHERE first_name NOT LIKE ( '%Mar%' );

SELECT
	*
FROM
	employees
WHERE first_name LIKE ( 'Mark%' );

SELECT
	*
FROM
	employees
WHERE hire_date LIKE('2000%');

SELECT
	*
FROM
	employees
WHERE emp_no LIKE('1000_');

SELECT
	*
FROM
	employees
WHERE first_name LIKE ( '%Jack%' );

SELECT
	*
FROM
	employees
WHERE first_name NOT LIKE ( '%Jack%' );

# Extremes included in the interval
SELECT
	*
FROM
	employees
WHERE hire_date BETWEEN '1990-01-01' AND '2000-01-01';

# Extremes NOT included in the interval
SELECT
	*
FROM
	employees
WHERE hire_date NOT BETWEEN '1990-01-01' AND '2000-01-01';

SELECT
	*
FROM
	salaries
WHERE salary BETWEEN 66000 AND 70000;

SELECT
	*
FROM
	employees
WHERE emp_no NOT BETWEEN 10004 AND 10012;

SELECT
	dept_name
FROM
	departments
WHERE dept_no BETWEEN 'd003' AND 'd006';

SELECT
	*
FROM
	employees
WHERE first_name IS NOT NULL;

SELECT
	*
FROM
	employees
WHERE first_name IS NULL;

SELECT
	dept_name
FROM
	departments
WHERE dept_no IS NOT NULL;

SELECT
	*
FROM
	employees
WHERE hire_date > '2000-01-01';

SELECT
	*
FROM
	employees
WHERE gender = 'F' AND hire_date >= '2000-01-01';

SELECT
	salary
FROM
	salaries
WHERE salary > 150000;

SELECT DISTINCT
	gender
FROM
	employees;
    
SELECT DISTINCT
	hire_date
FROM
	employees;
    
SELECT
	COUNT(emp_no)
FROM
	employees;
    
SELECT
	COUNT(DISTINCT first_name)
FROM
	employees;
    
SELECT
	COUNT(*)
FROM
	salaries
WHERE
	salary > 100000;
    
SELECT
	COUNT(*)
FROM
	titles
WHERE title LIKE('Manager');

SELECT
	*
FROM
	employees
ORDER BY first_name;

SELECT
	*
FROM
	employees
ORDER BY first_name ASC;

SELECT
	*
FROM
	employees
ORDER BY first_name DESC;

SELECT
	*
FROM
	employees
ORDER BY first_name, last_name ASC;

SELECT
	*
FROM
	employees
ORDER BY hire_date DESC;

SELECT
	first_name
FROM
	employees
GROUP BY
	first_name;
    
SELECT
	first_name, COUNT(first_name)
FROM
	employees
GROUP BY 
	first_name
ORDER BY
	first_name DESC;
    
SELECT
	first_name, COUNT(first_name) AS names_count
FROM
	employees
GROUP BY 
	first_name
ORDER BY
	first_name;

SELECT 
	salary, COUNT(emp_no) AS emps_with_same_salary
FROM
	salaries
WHERE
	salary > 80000
GROUP BY
	salary
ORDER BY
	salary;
    
# WHERE is applied before GROUP BY, while HAVING is applied after
    
SELECT
	first_name, COUNT(first_name) AS names_count
FROM
	employees
GROUP BY
	first_name
HAVING
	COUNT(first_name) > 250
ORDER BY
	first_name;
    
SELECT
	*, AVG(salary) AS average_salary
FROM
	salaries
GROUP By
	emp_no
HAVING
	AVG(salary) > 120000
ORDER By
	emp_no;
    
SELECT
	*, AVG(salary) AS average_salary
FROM
	salaries
WHERE
	salary > 120000
GROUP By
	emp_no
ORDER By
	emp_no;
    
SELECT
	first_name, COUNT(first_name) AS names_count
FROM
	employees
WHERE
	hire_date > '1999-01-01'
GROUP BY
	first_name
HAVING
	COUNT(first_name) < 200
ORDER BY
	first_name DESC;
    
SELECT
	emp_no, COUNT(emp_no) AS contracts_count
FROM
	dept_emp
WHERE
	from_date > '2000-01-01'
GROUP BY
	emp_no
HAVING
	COUNT(emp_no) > 1
ORDER By
	emp_no;
    
SELECT
	*
FROM
	salaries
ORDER BY 
	salary DESC
LIMIT 10;

SELECT 
    *
FROM
    dept_emp
LIMIT 100;