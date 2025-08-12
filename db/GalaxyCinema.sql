SHOW DATABASES;

USE galaxy_cinema;

-- Film  table
CREATE TABLE film (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    length_min INT NOT NULL,
    genre VARCHAR(20),
    country VARCHAR(20)
);


INSERT INTO film (name, length_min, genre, country) 
VALUES
	('Movie A', 120, 'Comedy', 'VN'),
    ('Movie B', 125, 'Horror', 'AU'),
    ('Movie C', 162, 'Horror', 'JP');
    
SELECT * FROM film;


-- Room table
CREATE TABLE room (
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(20)
);

INSERT INTO room (name) 
VALUES ('Theater A'), ('Theater B'), ('Theater C');


SELECT * FROM room;


-- Screening table
CREATE TABLE screening (
	id INT AUTO_INCREMENT PRIMARY KEY,
    film_id INT NOT NULL,
    room_id INT NOT NULL,
    start_time DATETIME NOT NULL,
    FOREIGN KEY (film_id) REFERENCES film(id) ON DELETE CASCADE,
    FOREIGN KEY (room_id) REFERENCES room(id) ON DELETE CASCADE
);

INSERT INTO screening (film_id, room_id, start_time) 
VALUES 
	(3, 2, '2025-10-10 10:00:00'),
    (2, 1, '2025-11-10 8:00:00'),
    (2, 1, '2025-12-10 9:00:00'),
    (1, 3, '2025-10-13 18:00:00')
;

SELECT * FROM screening;

-- SEAT 

CREATE TABLE seat (
	id INT AUTO_INCREMENT PRIMARY KEY,
    room_id INT NOT NULL,
    row_char CHAR NOT NULL,
    row_num INT NOT NULL,
    x INT,
    y INT,
    
    FOREIGN KEY (room_id) REFERENCES room(id) ON DELETE CASCADE
);

INSERT INTO seat (room_id, row_char, row_num, x, y) 
VALUES 
	(1, 'A', 1, 1, 1),
    (1, 'A', 5, 1, 3),
    (2, 'G', 4, 1, 1),
    (3, 'F', 6, 2, 1)
;



-- customer 
CREATE TABLE customer (
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE 
); 


INSERT INTO customer (name, email) 
VALUES 
	('Leslie', 'leslie@gmail.com'),
    ('Noah', 'noah@gmail.com'),
    ('Ivy', 'ivy@gmail.com'),
    ('Jayden', 'jayden@gmail.com'),
    ('Jonathan', 'jonathan@gmail.com')
;



-- booking 
CREATE TABLE booking (
	id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    screening_id INT NOT NULL,
    booking_time DATETIME DEFAULT CURRENT_TIMESTAMP, 
    total FLOAT,
    
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (screening_id) REFERENCES screening(id)
);

INSERT INTO booking (customer_id, screening_id) 
VALUES 
	(1, 2),
    (1, 3),
    (3, 4),
    (4, 4)
;


CREATE TABLE reserved_seat (
	id INT AUTO_INCREMENT PRIMARY KEY,
    booking_id INT NOT NULL,
    seat_id INT NOT NULL,
    price FLOAT,
    
	UNIQUE KEY unique_seat (booking_id, seat_id),
    FOREIGN KEY (booking_id) REFERENCES booking(id),
    FOREIGN KEY (seat_id) REFERENCES seat(id)
);

INSERT INTO reserved_seat (booking_id, seat_id) 
VALUES 
	(1, 1),
    (2, 2),
    (3, 4),
    (3, 3),
    (4, 4)
;



--   CREATE INDEX ON movie name for fast searching
USE galaxy_cinema;
CREATE INDEX index_film_name ON film (name);
-- ALTER TABLE film DROP INDEX index_film_name;
SELECT * FROM film WHERE name = 'Movie A';