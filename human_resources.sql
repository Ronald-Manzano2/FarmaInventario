SELECT * FROM Employees WHERE salary >= 2500 AND salary <= 3000;

SELECT * FROM Employees WHERE salary BETWEEN 2500 AND 3000;

SELECT emp.Employee_id, emp.first_name, emp.last_name, dep.department_name FROM Employees emp INNER JOIN Departments dep ON dep.department_id = emp.department_id WHERE dep.department_name IN('Marketing','Purchasing','Shipping');

SELECT * FROM employees;

SELECT emp.Employee_id, emp.first_name, emp.last_name, dep.department_name FROM Employees emp INNER JOIN Departments dep ON dep.department_id = emp.department_id WHERE dep.department_name IN(SELECT department_name FROM Departments WHERE location_id = 1800);

SELECT * FROM Employees WHERE commission_pct IS NULL;