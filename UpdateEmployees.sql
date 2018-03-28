#Here we have "Safe updates" disabled

USE employees;

SELECT 
	* 
FROM 
	employees
WHERE 
	emp_no = 999901;

UPDATE
	employees
SET
	first_name = 'Stella',
    last_name = 'Parkinson',
    birth_date = '1990-12-31',
    gender = 'F'
WHERE
	emp_no = 999901;

SELECT 
	* 
FROM 
	employees
WHERE 
	emp_no = 999901;
    
SELECT
	*
FROM
	department_dup
ORDER BY
	dept_no;
    
COMMIT;

UPDATE
	department_dup
SET
	dept_no = 'd011',
    dept_name = 'Quality Control';
    
SELECT
	*
FROM
	department_dup
ORDER BY
	dept_no;
    
ROLLBACK;

SELECT
	*
FROM
	department_dup
ORDER BY
	dept_no;
    
UPDATE
	department_dup
SET
	dept_name = 'Data Analysis'
WHERE
	dept_name = 'Business Analysis';
    
SELECT
	*
FROM
	department_dup
ORDER BY
	dept_no;
    
COMMIT;

SELECT
	*
FROM
	employees
WHERE
	emp_no = 999903;
    
SELECT
	*
FROM
	titles
WHERE
	emp_no = 999903;
    
DELETE FROM employees
WHERE
	emp_no = 999903;
    
SELECT
	*
FROM
	department_dup
ORDER BY
	dept_no;
    
COMMIT;

DELETE FROM department_dup;

ROLLBACK;

SELECT * FROM departments;

DELETE FROM departments
WHERE
	dept_no = 'd010';