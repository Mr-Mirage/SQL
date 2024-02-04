use hr;

SELECT *
FROM departments;

-- Вывести имя, фамилию и зарплату тех сотрудников, которые работают в городах Oxford и San Francisco
SELECT
t1.city,
t2.country_name
FROM locations t1
INNER JOIN countries t2
ON t1.country_id = t2.country_id;

















