USE galaxy_cinema;

-- Q1: Show film over 100 mins --
SELECT * 
FROM film 
WHERE length_min > 100;


-- Q2: Which film over average length of all films --
SELECT * 
FROM film 
WHERE length_min > (SELECT AVG(length_min) AS avgLen FROM film);

-- Which film has name start with letter 't'
SELECT * 
FROM film 
WHERE LOWER(name) LIKE 't%';

-- Which film contain letter 'a'
SELECT * 
FROM film 
WHERE LOWER(name) LIKE '%a%';

-- How many film in US?
SELECT COUNT(*) AS US_film_count
FROM film 
WHERE country_code = 'US';


-- what is the longest, and shortest length of all film
SELECT MAX(length_min) AS longest_length, MIN(length_min) AS shortest_length
FROM film;


-- Show unique film types of all film (NO DUPLICATE)
SELECT DISTINCT type
FROM film;


-- Q8. What is the distance (in days) of the 1st and the last film
SELECT f.id, f.name, IFNULL(MAX(DATE(start_time)) - MIN(DATE(start_time)), 0)  AS diff
FROM screening s
RIGHT JOIN film f ON s.film_id = f.id
GROUP BY f.id;



-- Show all Screening Information including film name, room name, time of film "Tom&Jerry"
SELECT * 
FROM screening s 
INNER JOIN film f ON s.film_id = f.id
WHERE f.name = 'Tom&Jerry';


-- show all screening in 2 day '2022-05-25' and '2022-05-25'
SELECT *
FROM screening s 
WHERE s.start_time >= '2022-05-24' OR s.start_time <= '2022-05-25 23:59:59';

-- 1. Show film which dont have any screening
SELECT f.id, f.name
FROM film f
LEFT JOIN screening s ON f.id = s.film_id
GROUP BY f.id
HAVING COUNT(*) = 0;

-- Who book more than 1 seat in 1 booking
SELECT c.first_name, rs.booking_id, COUNT(rs.id) AS seat_count  
FROM reserved_seat rs
LEFT JOIN booking b ON rs.booking_id = b.id
LEFT JOIN customer c ON c.id = b.customer_id
GROUP BY rs.booking_id
HAVING COUNT(*) > 1;

-- Show room show more than 2 film in one day
SELECT DISTINCT room_id
FROM screening s
GROUP BY room_id, DATE(start_time)
HAVING COUNT(DISTINCT film_id) > 2;

-- which room show the least film ?
SELECT *
FROM 
	(SELECT room_id, COUNT(DISTINCT film_id) AS film_count
	FROM screening s
	GROUP BY room_id) AS tbl
ORDER BY film_count ASC
LIMIT 1;

-- what film don't have booking
SELECT f.id, f.name
FROM film f
LEFT JOIN screening s ON f.id = s.film_id 
LEFT JOIN booking b ON s.id = b.screening_id
GROUP BY f.id
HAVING COUNT(*) = 0;


-- WHAT film have show the biggest number of room?
-- Show number of film that show in every day of week and order descending


-- q17: show total length of each film that showed in 28/5/2022
SELECT f.name, SUM(IF(s.id IS NULL, 0, f.length_min))
FROM film f 
LEFT JOIN screening s ON f.id = s.film_id AND DATE(s.start_time) = '2022-05-28'
GROUP BY f.id;


-- What film has showing time above and below average show time of all film
with count_showing_time as (
select 
	f.id as film_id, 
    count(s.film_id) as count_showing_time
from film f left join screening s on f.id = s.film_id
group by f.id
)
, 
avg_showing_time as (
select avg(count_showing_time) as avg_showing_time
from count_showing_time
)
select 
	c.film_id, 
    c.count_showing_time, 
    (case 
		when c.count_showing_time > (select avg_showing_time from avg_showing_time) then 'above' 
        when c.count_showing_time < (select avg_showing_time from avg_showing_time) then 'below'
        else 'equal' 
	end) as 'status'
from count_showing_time c ;


-- what room have least number of seat?
-- what room have number of seat bigger than average number of seat of all rooms
-- Q21 Ngoai nhung seat mà Ong Dung booking duoc o booking id = 1 thi ong CÓ THỂ (CAN) booking duoc nhung seat nao khac khong?

# 1 seats of room showing screening of booking id 1
with cte_seats_of_screening_bk1 as (SELECT se.*
FROM booking b 
JOIN screening s ON b.screening_id = s.id
JOIN room r ON r.id = s.room_id
JOIN seat se ON se.room_id = r.id
WHERE b.id = 1),


# reserved seats of screening of booking 1
# screeing of booking 1
cte_screening_id_of_booking_1 as (
SELECT s.id
FROM  booking b JOIN screening s ON b.screening_id = s.id
WHERE b.id = 1),


cte_all_rs_of_booking1_screening as (
SELECT rs.seat_id
FROM booking b JOIN reserved_seat rs ON rs.booking_id = b.id
WHERE b.screening_id = (SELECT id FROM cte_screening_id_of_booking_1))



SELECT * 
FROM cte_seats_of_screening_bk1
WHERE id NOT IN (SELECT seat_id FROM cte_all_rs_of_booking1_screening);


-- Q22. Show Film with total screening and order by total screening. BUT ONLY SHOW DATA OF FILM WITH TOTAL SCREENING > 10
SELECT f.id, COUNT(s.id) AS total_screening
FROM screening s 
RIGHT JOIN film f ON s.film_id = f.id
GROUP BY f.id
HAVING COUNT(s.id) > 10; 


-- Q23. TOP 3 DAY OF WEEK based on total booking
SELECT DAYNAME(start_time) as weekday, COUNT(b.id) as count_screening
FROM booking b
LEFT JOIN screening s ON b.screening_id = s.id
GROUP BY DAYNAME(start_time);

-- Q24. CALCULATE BOOKING rate over screening of each film ORDER BY RATES.
-- Q25. CONTINUE Q15 -> WHICH film has rate over/below/equal average ?.
-- Q26. TOP 2 people who enjoy the least TIME (in minutes) in the cinema based on booking info - only count who has booking info (example : Dũng book film tom&jerry 4 times -> Dũng enjoy 90 mins x 4)
SELECT customer_id, c.first_name, SUM(length_min) AS total_length
FROM booking b
LEFT JOIN screening s ON b.screening_id = s.id
LEFT JOIN film f ON s.film_id = f.id
LEFT JOIN customer c ON c.id = b.customer_id
GROUP BY customer_id
ORDER BY total_length 
LIMIT 2;

