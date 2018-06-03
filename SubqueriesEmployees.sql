USE employees;

SELECT 
    e.first_name, e.last_name
FROM
    employees e
WHERE
    e.emp_no IN (SELECT 
            dm.emp_no
        FROM
            dept_manager dm);
       
SELECT 
    e.emp_no, e.first_name, e.last_name, e.hire_date
FROM
    employees e
WHERE
    e.emp_no IN (SELECT 
            dm.emp_no
        FROM
            dept_manager dm)
        AND e.hire_date BETWEEN '1990-01-01' AND '1995-01-01'
		;

SELECT 
    *
FROM
    dept_manager
WHERE
    emp_no IN (SELECT 
            emp_no
        FROM
            employees
        WHERE
            hire_date BETWEEN '1990-01-01' AND '1995-01-01'); 
            
SELECT 
    e.first_name, e.last_name
FROM
    employees e
WHERE
    EXISTS( SELECT 
            *
        FROM
            dept_manager dm
        WHERE
            dm.emp_no = e.emp_no)
ORDER BY e.emp_no
;

SELECT 
    *
FROM
    employees e
WHERE
    emp_no IN (SELECT 
            emp_no
        FROM
            titles t
        WHERE
            t.title = 'Assistant Engineer')
ORDER BY e.emp_no
;

SELECT 
    A.*
FROM
    (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110022) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no <= 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS A 
UNION SELECT 
    B.*
FROM
    (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110039) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no > 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no
    LIMIT 20) AS B;
    
DROP TABLE IF EXISTS emp_manager;
CREATE TABLE emp_manager (
    emp_no INT(11) NOT NULL,
    dept_no CHAR(4) NULL,
    manager_no INT(11) NOT NULL
);

INSERT INTO emp_manager
SELECT
	U.*
FROM
	(SELECT
		A.*
	 FROM
		(SELECT 
			e.emp_no AS employee_ID,
			MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110022) AS manager_ID
		FROM
			employees e
		JOIN dept_emp de ON e.emp_no = de.emp_no
		WHERE
			e.emp_no <= 10020
		GROUP BY e.emp_no
		ORDER BY e.emp_no) AS A
	UNION SELECT
		B.*
	FROM
		(SELECT 
			e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110039) AS manager_ID
		FROM
			employees e
		JOIN dept_emp de ON e.emp_no = de.emp_no
		WHERE
			e.emp_no > 10020
		GROUP BY e.emp_no
		ORDER BY e.emp_no
		LIMIT 20) AS B
	UNION SELECT
		C.*
	FROM
		(SELECT
			e.emp_no AS employee_ID,
			MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110039) AS manager_ID
			FROM
				employees e
			JOIN dept_emp de ON e.emp_no = de.emp_no
			WHERE
				e.emp_no = 110022
			GROUP BY e.emp_no ) AS C
	UNION SELECT
		D.*
	FROM (SELECT
			e.emp_no AS employee_ID,
			MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110022) AS manager_ID
			FROM
				employees e
			JOIN dept_emp de ON e.emp_no = de.emp_no
			WHERE
				e.emp_no = 110039
			GROUP BY e.emp_no 
		) AS D
) 
AS U;

SELECT * FROM emp_manager;