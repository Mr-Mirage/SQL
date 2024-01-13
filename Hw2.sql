use learn;

-- Home work 2 
-- Создайте таблицу goods (id, title, quantity)
-- Добавьте несколько строк
-- Добавьте поле price (integer) со значением по умолчанию 0
-- Измените тип поля price на numeric(8, 2)
-- перед изменением типа необходимо очистить поле
-- Измените тип обратно на integer
-- Переименуйте поле на item_price
-- Удалите это поле

CREATE TABLE goods_3 (
id INT AUTO_INCREMENT PRIMARY KEY,
title VARCHAR(128) NOT NULL,
quantity INT
);

INSERT INTO goods_3 (title, quantity) VALUES
('Car', 5),
('Bike', 15),
('Tractor', 2);

ALTER TABLE goods_3
ADD COLUMN price INT DEFAULT 0;

ALTER TABLE goods_3
MODIFY COLUMN price NUMERIC(8, 2);

ALTER TABLE goods_3
MODIFY COLUMN price INT;

ALTER TABLE goods_3
CHANGE COLUMN price item_price INT;

ALTER TABLE goods_3
DROP COLUMN item_price;


