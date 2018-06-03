USE employees_mod;

# Task 1

SELECT
	YEAR(de.from_date) AS calendar_year,
    e.gender,
    COUNT(e.emp_no) AS num_of_employees
FROM
	t_employees e
		JOIN
	t_dept_emp de ON e.emp_no = de.emp_no
GROUP BY calendar_year, gender
HAVING calendar_year >= 1990;

# Task 2

SELECT
	d.dept_name,
    ee.gender,
    dm.emp_no,
    dm.from_date,
    dm.to_date,
    e.calendar_year,
    CASE
		WHEN YEAR(dm.to_date) >= e.calendar_year AND YEAR(dm.to_date) <= e.calendar_year THEN 1
        ELSE 0
	END AS active
FROM
	(SELECT
		YEAR(hire_date) AS calendar_year
	FROM
		t_employees
	GROUP BY calendar_year) e
		CROSS JOIN
	t_dept_manager dm
		JOIN
	t_departments d ON dm.dept_no = d.dept_no
		JOIN
	t_employees ee ON dm.emp_no = ee.emp_no
ORDER BY dm.emp_no, calendar_year;

# Task 3

SELECT
	e.gender,
	d.dept_name,
    ROUND(AVG(s.salary),2) AS salary,
    YEAR(de.from_date) AS calendar_year
FROM
	t_salaries s
		JOIN
	t_employees e ON e.emp_no = s.emp_no
		JOIN
	t_dept_emp de ON e.emp_no = de.emp_no
		JOIN
	t_departments d ON de.dept_no = d.dept_no
GROUP BY d.dept_no, e.gender, calendar_year
HAVING calendar_year <= 2002
ORDER BY d.dept_no;

# Task 4

DELIMITER $$
CREATE PROCEDURE filter_salary(IN p_min_salary FLOAT, IN p_max_salary FLOAT)
BEGIN
	SELECT
		d.dept_name,
		e.gender,
        AVG(s.salary) AS avg_salary
	FROM
		t_salaries s
			JOIN
		t_employees e ON s.emp_no = e.emp_no
			JOIN
		t_dept_emp de ON de.emp_no = e.emp_no
			JOIN
		t_departments d ON d.dept_no = de.dept_no
	WHERE salary BETWEEN p_min_salary AND p_max_salary
	GROUP BY d.dept_no, e.gender;
END$$
DELIMITER ;

CALL employees_mod.filter_salary(50000,90000);