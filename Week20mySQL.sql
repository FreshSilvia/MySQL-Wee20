DROP DATABASE IF EXISTS WEEK20_CHALLENGES;
CREATE DATABASE WEEK20_CHALLENGES;
USE WEEK20_CHALLENGES;

-- VERY EASY
CREATE TABLE DRIFT_CARS(
make VARCHAR (255),
model VARCHAR (255),
year VARCHAR (255)
);

INSERT INTO DRIFT_CARS(make, model, year)
VALUES
("Nissan","S14","1995"),
("Toyota","Supra","1998"),
("Mazda","RX-7","1997");

INSERT INTO DRIFT_CARS(make, model, year)
VALUES
("Nissan","350Z","2008"),
("Toyota","AE86","1985");

SELECT * FROM DRIFT_CARS;

-- EASY

CREATE TABLE UGH_BOOKS(
PRIMARY KEY (ID),
ID INT NOT NULL AUTO_INCREMENT, 
title VARCHAR(255),
publish_date DATE ,
author VARCHAR(255)
);

INSERT INTO UGH_BOOKS (title, publish_date, author)
VALUES
("Of Mice and Men","1937-02-06","John Steinbecks"),
("Because of Winn Dixie","2000-03-10","Kate DiCamillo"),
("The Tale of Despereaux","2003-08-25","Kate DiCamillo"),
("Solo Leveling","2019-09-26","Chu-Gong"),
("Beginning After the End ","2020-02-11","Brandon Lee");

INSERT INTO UGH_BOOKS (title, publish_date, author)
VALUES
("Survival Story of a Sword King in a Fantasy World","2019-08-30","Chou-gu"),
("To Kill a Mockingbird","1960-07-11","Harper Lee");

DELETE FROM UGH_BOOKS ORDER BY publish_date LIMIT 1;

SELECT * FROM UGH_BOOKS; 

-- MEDIUM

CREATE TABLE FAV_MOVIES( 
title VARCHAR(255),
release_date DATE ,
rating VARCHAR(255)
);

INSERT INTO FAV_MOVIES (title, release_date , rating)
VALUES
("Friday","1995-04-26","R"),
("Friday After Next","2002-11-22","R"),
("Men In Black","1997-07-02","PG13"),
("My Hero Academia: Heroes Rising","2019-12-20","PG13"),
("Because of Winn Dixie","2005-02-18","PG13"),
("The fast and the Furious","2001-05-22","M"),
("2 fast 2 Furious","2003-06-06","M"),
("The fast and the Furious:Tokyo Drift","2006-06-16","M"),
("Fast Five","2011-04-29","M"),
("Fast & Furious 6","2013-05-24","M");

SELECT * FROM FAV_MOVIES WHERE title LIKE "%s%" ORDER BY release_date;

-- Hard 

ALTER TABLE FAV_MOVIES ADD fname_director VARCHAR(255);
ALTER TABLE FAV_MOVIES ADD lname_director VARCHAR(255);

UPDATE FAV_MOVIES SET fname_director = "Steve", lname_director = "Carr" WHERE title = "Friday";
UPDATE FAV_MOVIES SET fname_director = "Marcus", lname_director = "Raboy" WHERE title = "Friday After Next";
UPDATE FAV_MOVIES SET fname_director = "Barry", lname_director = "Sonnenfeld" WHERE title = "Men In Black";
UPDATE FAV_MOVIES SET fname_director = "Kenji", lname_director = "Nagasaki" WHERE title = "My Hero Academia: Heroes Rising";
UPDATE FAV_MOVIES SET fname_director = "Wayne", lname_director = "Wang" WHERE title = "Because of Winn Dixie";
UPDATE FAV_MOVIES SET fname_director = "Vin", lname_director = "Diesel" WHERE title = "The fast and the Furious";
UPDATE FAV_MOVIES SET fname_director = "John", lname_director = "Singleton" WHERE title = "2 fast 2 Furious";
UPDATE FAV_MOVIES SET fname_director = "Justin", lname_director = "Lin" WHERE title = "The fast and the Furious:Tokyo Drift";
UPDATE FAV_MOVIES SET fname_director = "Justin", lname_director = "Lin" WHERE title = "Fast Five";
UPDATE FAV_MOVIES SET fname_director = "Justin", lname_director = "Lin" WHERE title = "Fast & Furious 6";

SELECT CONCAT(fname_director, " ", lname_director) AS full_name_director FROM FAV_MOVIES;

DELETE FROM FAV_MOVIES WHERE REGEXP_LIKE(lname_director, "[r-z]$");
SELECT * FROM FAV_MOVIES LIMIT 3;

-- VERY HARD

INSERT INTO DRIFT_CARS(make, model, year)
VALUES
("Nissan","S15","2001"),
("Nissan","Skyline","2000"),
("Mazda","RX-8","2008");

ALTER TABLE DRIFT_CARS ADD color VARCHAR(255);
ALTER TABLE DRIFT_CARS ADD price INT;

UPDATE DRIFT_CARS SET color = "Grey", price = 10000 WHERE model = "S15";
UPDATE DRIFT_CARS SET color = "Blue", price = 15000 WHERE model = "Skyline";
UPDATE DRIFT_CARS SET color = "Red", price = 8000 WHERE model = "RX-8";

SELECT CONCAT(make , " ", model) AS full_car_name FROM DRIFT_CARS;

SELECT * , (SELECT COUNT(*) FROM DRIFT_CARS WHERE make = c.make) AS make_amount FROM DRIFT_CARS AS c;
