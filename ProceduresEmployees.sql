USE employees;

#Procedures

DROP PROCEDURE IF EXISTS select_employees;

DELIMITER $$
CREATE PROCEDURE select_employees()
BEGIN
	SELECT * FROM employees
	LIMIT 1000;
END$$
DELIMITER ;

CALL employees.select_employees();

CALL select_employees();

DROP PROCEDURE IF EXISTS average_salary;

DELIMITER $$
CREATE PROCEDURE average_salary()
BEGIN
	SELECT AVG(salary)
    FROM salaries;
END$$
DELIMITER ;

CALL employees.average_salary();

DELIMITER $$
CREATE PROCEDURE select_salaries()
BEGIN
	SELECT * FROM salaries
    LIMIT 1000;
END$$
DELIMITER ;

CALL employees.select_salaries();

DELIMITER $$
CREATE PROCEDURE emp_salary(IN p_emp_no INTEGER)
BEGIN
	SELECT 
		e.first_name, e.last_name, s.salary, s.from_date, s.to_date
	FROM
		employees e
			JOIN
		salaries s ON e.emp_no = s.emp_no
	WHERE
		e.emp_no = p_emp_no;
END$$
DELIMITER ;

CALL employees.emp_salary(11300);

DELIMITER $$
CREATE PROCEDURE emp_avg_salary(IN p_emp_no INTEGER)
BEGIN
	SELECT 
		e.first_name, e.last_name, AVG(s.salary)
	FROM
		employees e
			JOIN
		salaries s ON e.emp_no = s.emp_no
	WHERE
		e.emp_no = p_emp_no;
END$$
DELIMITER ;

CALL employees.emp_avg_salary(11300);

DELIMITER $$
CREATE PROCEDURE emp_avg_salary_out(IN p_emp_no INTEGER, OUT p_avg_salary DECIMAL(10,2))
BEGIN
	SELECT 
		AVG(s.salary)
	INTO p_avg_salary FROM
		employees e
			JOIN
		salaries s ON e.emp_no = s.emp_no
	WHERE
		e.emp_no = p_emp_no;
END$$
DELIMITER ;

CALL employees.emp_avg_salary_out(11300, @p_avg_salary);

DELIMITER $$
CREATE PROCEDURE emp_info(IN p_first_name VARCHAR(255), IN p_last_name VARCHAR(255), OUT p_emp_no INTEGER)
BEGIN
	SELECT
		e.emp_no
	INTO p_emp_no FROM
		employees e
	WHERE
		e.first_name = p_first_name AND e.last_name = p_last_name;
END$$
DELIMITER ;

# Variables

SET @v_avg_salary = 0;
CALL employees.emp_avg_salary_out(11300,@v_avg_salary);
SELECT @v_avg_salary;

SET @v_emp_no = 0;
CALL employees.emp_info('Aruna','Journel',@v_emp_no);
SELECT @v_emp_no;

