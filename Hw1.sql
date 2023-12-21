use homework_1;
use airport;
--  Выбрать всех клиентов, чей возраст больше чем 40;
SELECT
*
FROM clients
WHERE age > 40;

-- 2) Выбрать всех клиентов, у которых в фамилии есть вхождение 'Egor';

SELECT
*
FROM clients
WHERE name LIKE '%Egor%';

-- 3) Выбрать все билеты, которые относятся к классу Economy или PremiumEconomy и цена больше 40000;

SELECT 
*
FROM tickets
WHERE service_class IN ('Economy', 'PremiumEconomy')
AND price > 40000;

-- 4) Выбрать все поездки, у которых статус был отменен или задержан, вывести только коды отправления и прибытия.

SELECT departure, arrival
FROM trips
WHERE status IN ('Cancelled', 'Delayed');

-- 5) Выбрать всех клиентов и отсортировать их по фамилии в алфавитном порядке;

SELECT 
*
FROM clients
ORDER BY name ASC;

-- 6) Выбрать всех клиентов и отсортировать их по возрасту в порядке убывания;

SELECT
*
FROM clients
ORDER BY age DESC;

-- 7) Вывести все билеты НЕ Economy класса и отсортировать их по стоимости в порядке убывания;

SELECT 
*
FROM tickets
WHERE service_class != 'Economy'
ORDER BY price DESC;

-- 8) Разделите самолеты на три класса по возрасту. Если самолет произведен раньше 2000 года, то отнесите его к классу 'Old'. Если самолет произведен между 2000 и 2010 годами включительно, то отнесите его к классу 'Mid'. Более новые самолеты отнесите к классу 'New'. Исключите из выборки дальнемагистральные самолеты с максимальной дальностью полета больше 10000 км. Отсортируйте выборку по классу возраста в порядке возрастания.
-- В выборке должны присутствовать два атрибута — side_number, age.
SELECT side_number,
	CASE
     WHEN production_year < 2000 THEN 'Old'
     WHEN production_year <= 2010 THEN 'Mid'
     ELSE 'New'
    END AS age
FROM airliners
WHERE distance <= 10000
ORDER BY age;

-- 9) Руководство авиакомпании снизило цены на билеты рейсов LL4S1G8PQW, 0SE4S0HRRU и JQF04Q8I9G. Скидка на билет экономкласса (Economy) составила 15%, на билет бизнес-класса (Business) — 10%, а на билет комфорт-класса (PremiumEconomy) — 20%. Определите цену билета в каждом сегменте с учетом скидки.
-- В выборке должны присутствовать три атрибута — id, tripid, newprice.

SELECT id, trips,
	CASE
		WHEN service_class = 'Economy' THEN price - (price * 0.15)
        WHEN service_class = 'Business' THEN price - (price * 0.1)
        ELSE price - (price * 0.2)
	END AS newprice
FROM tickets
WHERE trips IN ('LL4S1G8PQW', '0SE4S0HRRU', 'JQF04Q8I9G');
































