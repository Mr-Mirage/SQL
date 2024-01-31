-- hw 3

-- Создайте таблицу staff
CREATE TABLE staff (
id serial primary key,
name varchar(50),
surname varchar(50),
age int,
position varchar(20)
);

-- Заполните таблицу значениями из 10 строк
INSERT INTO staff (name, surname, age, position) VALUES

	('Alex', 'Alexeev', 24, 'worker'),
    ('Oleg', 'Olegov', 36, 'administration'),
    ('Ivan', 'Ivanov', 45, 'security'),
    ('Maria', 'Petrova', 50, 'worker'),
    ('Elena', 'Sidorova', 30, 'administration'),
    ('Sergei', 'Sergeev', 42, 'security'),
    ('Dmitri', 'Dmitriev', 38, 'worker'),
    ('Natalia', 'Nikolaeva', 55, 'administration'),
    ('Pavel', 'Pavlov', 28, 'worker'),
    ('Viktor', 'Viktorov', 48, 'security');
    
-- Добавьте в уже готовую и заполненную таблицу поле salary - целое число.
ALTER TABLE staff ADD COLUMN salary INT;

-- Проставьте значение поля salary следующим образом :
-- если сотрудник категории worker - 1000
-- если сотрудник категории administration - 5000
-- если сотрудник категории security - 2000
SET SQL_SAFE_UPDATES = 0;
UPDATE staff SET salary = CASE
	WHEN position = 'worker' THEN 1000
	WHEN position = 'administration' THEN 5000
    WHEN position = 'security' THEN 2000
    ELSE 0
    END;
    
-- Увеличьте всем сотрудникам зарплату в два раза.
UPDATE staff SET salary = salary * 2;

-- Удалите из таблицы сотрудников, чей возраст больше чем 45.
DELETE FROM staff WHERE age > 45;

-- Создайте три представления(view) : первое - хранит только сотрудников типа worker, второй - security, третье administration
CREATE VIEW workers_view AS 
	SELECT *
    FROM staff
	WHERE position = 'worker';
CREATE VIEW security_view AS 
	SELECT *
    FROM staff
	WHERE position = 'security';
CREATE VIEW administration_view AS 
	SELECT *
    FROM staff
    WHERE position = 'administration';

-- Создайте новую таблицу на основе выборки из таблицы staff , которая будет хранить только name,surname,position
-- сотрудников , которые относятся к administration
CREATE TABLE administratio_table AS 
	SELECT name, surname, position
    FROM staff
    WHERE position = 'administration';

ALTER TABLE administratio_table 
	DROP COLUMN position;

