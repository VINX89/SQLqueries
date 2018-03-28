USE employees;

INSERT INTO employees
(
	emp_no,
	birth_date,
    first_name,
    last_name,
    gender,
    hire_date
) VALUES
(
	999901,
    '1986-04-21',
    'John',
    'Smith',
    'M',
    '2011-01-01'
);

SELECT
	*
FROM
	employees
ORDER BY
	hire_date DESC;
    
# We can avoid the column names, but we must keep the order!
INSERT INTO employees
VALUES
(
	999904,
    '1977-09-14',
    'John',
    'Creek',
    'M',
    '1999-01-01'
);

SELECT
	*
FROM
	employees
ORDER BY
	emp_no DESC;
    
SELECT 
	*
FROM
	titles
LIMIT
	10;
    
INSERT INTO titles
(
	emp_no,
    title,
    from_date
) VALUES
(
	999903,
    "Senior Engineer",
    '1997-10-01'
);

SELECT
	*
FROM
	titles
ORDER BY
	emp_no DESC;
    
SELECT
	*
FROM
	dept_emp
LIMIT 10;

INSERT INTO dept_emp
VALUES
(
	999903,
    'd005',
    '1997-10-01',
    '9999-10-01'
);

DROP TABLE department_dup;

CREATE TABLE department_dup
(
	dept_no CHAR(4) NOT NULL,
    dept_name VARCHAR(40) NOT NULL
);

INSERT INTO department_dup
(
	dept_no,
    dept_name
)
SELECT
	*
FROM
	departments;
    
INSERT INTO departments
VALUES
(
	'd010',
    'Business Analysis'
);