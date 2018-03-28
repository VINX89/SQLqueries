USE employees;

SELECT
	*
FROM
	salaries
ORDER BY salary DESC
LIMIT 10;

SELECT
	COUNT(salary)
FROM salaries;

SELECT
	COUNT(DISTINCT from_date)
FROM salaries;

#Count also null records
SELECT
	COUNT(*)
FROM salaries;

SELECT
	*
FROM
	dept_emp;

SELECT
	COUNT(DISTINCT dept_no)
FROM dept_emp;

SELECT
	SUM(salary)
FROM 
	salaries
WHERE
	from_date > '1997-01-01';
    
SELECT
	MAX(salary)
FROM
	salaries;
    
SELECT
	MAX(emp_no)
FROM
	employees;
    
SELECT
	ROUND(AVG(salary),2)
FROM
	salaries
WHERE
	from_date > '1997-01-01';
    
SELECT
	*
FROM
	department_dup
ORDER BY dept_no;

SELECT
	dept_no, dept_name, COALESCE(dept_no, dept_name) AS dept_info
FROM
	department_dup
ORDER BY dept_no ASC;

SELECT
	*
FROM
	department_dup
ORDER BY dept_no;

SELECT
	IFNULL(dept_no,'N/A') AS dept_no, 
	IFNULL(dept_name, 'Department name not provided') AS dept_name, 
    COALESCE(dept_no, dept_name) AS dept_info
FROM
	department_dup
ORDER BY dept_no ASC;