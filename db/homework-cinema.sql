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


-- What is the distance (in days) of the 1st and the last film
SELECT (MAX(length_min) - MIN(length_min))/1440 AS diff_days
FROM film;

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
-- WHAT film have show the biggest number of room?
-- Show number of film that show in every day of week and order descending
-- show total length of each film that showed in 28/5/2022
-- What film has showing time above and below average show time of all film
-- what room have least number of seat?
-- what room have number of seat bigger than average number of seat of all rooms
-- Ngoai nhung seat mà Ong Dung booking duoc o booking id = 1 thi ong CÓ THỂ (CAN) booking duoc nhung seat nao khac khong?
-- Show Film with total screening and order by total screening. BUT ONLY SHOW DATA OF FILM WITH TOTAL SCREENING > 10
-- TOP 3 DAY OF WEEK based on total booking
-- CALCULATE BOOKING rate over screening of each film ORDER BY RATES.
-- CONTINUE Q15 -> WHICH film has rate over/below/equal average ?.
-- TOP 2 people who enjoy the least TIME (in minutes) in the cinema based on booking info - only count who has booking info (example : Dũng book film tom&jerry 4 times -> Dũng enjoy 90 mins x 4)