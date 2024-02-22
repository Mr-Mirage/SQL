use hr;

SELECT
manager_id,
COUNT(employee_id) AS employee_cnt
FROM employees
GROUP BY manager_id;

SELECT
t1.first_name,
t1.last_name,
COUNT(t2.employee_id) AS employees_cnt
FROM employees AS t2
JOIN employees AS t1 ON t2.manager_id = t1.employee_id
GROUP BY t1.first_name, t1.last_name;

SELECT
department_id,
MAX(salary) AS max_salary
FROM employees
GROUP BY department_id;