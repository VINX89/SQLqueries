USE employees;

DROP TABLE IF EXISTS department_dup;

CREATE TABLE department_dup
(
	dept_no CHAR(4) NULL,
    dept_name VARCHAR(40) NULL
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
    
INSERT INTO department_dup
(
	dept_name
) VALUES 
(
	"Public Relations"
);

DELETE FROM department_dup
WHERE dept_no = 'd002';

INSERT INTO department_dup
(
	dept_no
) VALUES 
('d010'), ('d011');


SELECT * FROM department_dup;


DROP TABLE IF EXISTS dept_manager_dup;

CREATE TABLE dept_manager_dup (

  emp_no int(11) NOT NULL,

  dept_no char(4) NULL,

  from_date date NOT NULL,

  to_date date NULL

  );

 

INSERT INTO dept_manager_dup

select * from dept_manager;

 

INSERT INTO dept_manager_dup (emp_no, from_date)

VALUES                (999904, '2017-01-01'),

                                (999905, '2017-01-01'),

                               (999906, '2017-01-01'),

                               (999907, '2017-01-01');

 

DELETE FROM dept_manager_dup

WHERE

    dept_no = 'd001';

   

INSERT INTO department_dup (dept_name)

VALUES                ('Public Relations');

 

DELETE FROM department_dup

WHERE

    dept_no = 'd002';
    
    
SELECT
	*
FROM
	dept_manager_dup
ORDER BY dept_no;

SELECT
	*
FROM
	department_dup
ORDER BY dept_no;

#Examples of inner joins
SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        INNER JOIN
    department_dup d ON m.dept_no = d.dept_no
ORDER BY m.dept_no;

SELECT * FROM employees;
SELECT * FROM dept_manager;
SELECT 
    e.emp_no, e.first_name, e.last_name, m.dept_no, e.hire_date
FROM
    employees e
        JOIN
    dept_manager m ON e.emp_no = m.emp_no;
    
#Deal with duplicate records
INSERT INTO dept_manager_dup
VALUES ('110228', 'd003', '1992-03-21', '9999-01-01');    

INSERT INTO department_dup
VALUES ('d009', 'Customer Service');

SELECT
	*
FROM
	dept_manager_dup
ORDER BY dept_no ASC;

SELECT
	*
FROM
	department_dup
ORDER BY dept_no ASC;

#To avoid duplicates in the join
SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        JOIN
    department_dup d ON m.dept_no = d.dept_no
GROUP BY m.emp_no
ORDER BY m.dept_no;

#Left join
DELETE FROM dept_manager_dup
WHERE emp_no = '110228';

DELETE FROM department_dup
WHERE dept_no = 'd009';

INSERT INTO dept_manager_dup
VALUES ('110228', 'd003', '1992-03-21', '9999-01-01');    

INSERT INTO department_dup
VALUES ('d009', 'Customer Service');

SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        LEFT JOIN
    department_dup d ON m.dept_no = d.dept_no
GROUP BY m.emp_no
ORDER BY m.dept_no;

#The order matters!
SELECT 
    d.dept_no, m.emp_no, d.dept_name
FROM
    department_dup d
        LEFT JOIN
    dept_manager_dup m ON m.dept_no = d.dept_no
ORDER BY d.dept_no;

#Get left part, no intersection
SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        LEFT JOIN
    department_dup d ON m.dept_no = d.dept_no
WHERE
	dept_name IS NULL
ORDER BY m.dept_no;

SELECT * FROM employees;
SELECT * FROM dept_manager;
SELECT
	e.emp_no, e.first_name, e.last_name, dm.dept_no, dm.from_date
FROM
    employees e
		LEFT JOIN
	dept_manager dm ON e.emp_no = dm.emp_no
WHERE
	e.last_name = 'Markovitch'
ORDER BY
	dm.dept_no DESC, e.emp_no;

#In simple cases, WHERE = JOIN
SELECT
	e.emp_no, e.first_name, e.last_name, dm.dept_no, e.hire_date
FROM
	employees e, dept_manager dm
WHERE
	e.emp_no = dm.emp_no;
    
    
SELECT * from titles;
SELECT e.first_name, e.last_name, e.hire_date, t.title
	FROM employees e
		LEFT JOIN
	titles t ON e.emp_no = t.emp_no
WHERE
	e.first_name = 'Margareta' AND e.first_name = 'Markovitch';
    
#Using aggregate functions
SELECT * from employees;
SELECT * from salaries;
SELECT
	e.gender, AVG(s.salary) AS average_salary
FROM
	employees e
		JOIN
	salaries s ON e.emp_no = s.emp_no
GROUP BY gender;

#Joining more than one table
SELECT
	e.first_name,
    e.last_name,
    e.hire_date,
    m.from_date,
    d.dept_name
FROM
	employees e
		JOIN
	dept_manager m ON e.emp_no = m.emp_no
		JOIN
	departments d ON m.dept_no = d.dept_no;
    
SELECT * from departments;
SELECT * from dept_emp;
SELECT * from dept_manager;
SELECT * from titles;
SELECT * from employees;
SELECT e.first_name, e.last_name, e.hire_date, t.title, dm.from_date, d.dept_name
FROM
    employees e
		JOIN
	titles t ON e.emp_no = t.emp_no
		JOIN
	dept_manager dm ON t.emp_no = dm.emp_no
		JOIN
	departments d ON dm.dept_no = d.dept_no
WHERE
	t.title = 'Manager';