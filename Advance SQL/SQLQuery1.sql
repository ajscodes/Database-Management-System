use CSE_4B_342;

-- Create Tables 
CREATE TABLE Artists ( 
Artist_id INT PRIMARY KEY, 
Artist_name NVARCHAR(50) 
); 

CREATE TABLE Albums ( 
Album_id INT PRIMARY KEY, 
Album_title NVARCHAR(50), 
Artist_id INT, 
Release_year INT, 
FOREIGN KEY (Artist_id) REFERENCES Artists(Artist_id) 
); 

CREATE TABLE Songs ( 
Song_id INT PRIMARY KEY, 
Song_title NVARCHAR(50), 
Duration DECIMAL(4, 2), 
Genre NVARCHAR(50), 
Album_id INT, 
FOREIGN KEY (Album_id) REFERENCES Albums(Album_id) 
);

-- Insert Data into Artists Table 
INSERT INTO Artists (Artist_id, Artist_name) VALUES 
(1, 'Aparshakti Khurana'), 
(2, 'Ed Sheeran'), 
(3, 'Shreya Ghoshal'), 
(4, 'Arijit Singh'), 
(5, 'Tanishk Bagchi'); 

-- Insert Data into Albums Table 
INSERT INTO Albums (Album_id, Album_title, Artist_id, Release_year) VALUES (1007, 'Album7', 1, 2015), 
(1001, 'Album1', 1, 2019), 
(1002, 'Album2', 2, 2015), 
(1003, 'Album3', 3, 2018), 
(1004, 'Album4', 4, 2020), 
(1005, 'Album5', 2, 2020), 
(1006, 'Album6', 1, 2009); 

-- Insert Data into Songs Table 
INSERT INTO Songs (Song_id, Song_title, Duration, Genre, Album_id) VALUES 
(101, 'Zaroor', 2.55, 'Feel good', 1001), 
(102, 'Espresso', 4.10, 'Rhythmic', 1002), 
(103, 'Shayad', 3.20, 'Sad', 1003), 
(104, 'Roar', 4.05, 'Pop', 1002), 
(105, 'Everybody Talks', 3.35, 'Rhythmic', 1003), 
(106, 'Dwapara', 3.54, 'Dance', 1002), 
(107, 'Sa Re Ga Ma', 4.20, 'Rhythmic', 1004), 
(108, 'Tauba', 4.05, 'Rhythmic', 1005), 
(109, 'Perfect', 4.23, 'Pop', 1002), 
(110, 'Good Luck', 3.55, 'Rhythmic', 1004);

SELECT * FROM Artists;
SELECT * FROM Albums;
SELECT * FROM Songs;


--Part – A 
--1. Retrieve a unique genre of songs. 
SELECT distinct genre
FROM Songs

--2. Find top 2 albums released before 2010. 
SELECT TOP 2 *
FROM Albums
WHERE Release_year < 2010

--3. Insert Data into the Songs Table. (1245, ‘Zaroor’, 2.55, ‘Feel good’, 1005) 
INSERT INTO Songs VALUES (1245, 'Zaroor', 2.55, 'Feel good', 1005);

--4. Change the Genre of the song ‘Zaroor’ to ‘Happy’ 
UPDATE Songs
SET Genre = 'Happy'
WHERE Song_title = 'Zaroor'

--5. Delete an Artist ‘Ed Sheeran’ 
DELETE 
FROM Songs
WHERE Album_id IN (
	SELECT Album_id 
	FROM Albums
	WHERE Artist_id IN (
		SELECT Artist_id
		FROM Artists
		WHERE Artist_name = 'Ed Sheeran'
		)
	)

DELETE 
FROM Albums
WHERE Artist_id IN (
	SELECT Artist_id 
	FROM Artists
	WHERE Artist_name = 'Ed Sheeran'
	)

DELETE
FROM Artists
WHERE Artist_name = 'Ed SHeeran'

SELECT * FROM Artists WHERE Artist_name = 'Ed Sheeran';

--6. Add a New Column for Rating in Songs Table. [Ratings decimal(3,2)] 
ALTER TABLE Songs
ADD Rating decimal(3,2)

select * from Songs;

--7. Retrieve songs whose title starts with 'S'. 
SELECT *
FROM Songs
WHERE Song_title LIKE 'S%'

--8. Retrieve all songs whose title contains 'Everybody'. 
SELECT *
FROM Songs
WHERE Song_title LIKE '%EVERYBODY%'

--9. Display Artist Name in Uppercase. 
SELECT UPPER(Artist_name)
FROM Artists

--10. Find the Square Root of the Duration of a Song ‘Good Luck’ 
SELECT SQRT(Duration)
FROM Songs
WHERE Song_title = 'Good Luck'

--11. Find Current Date. 
SELECT GETDATE() AS 'Current_Date';

--12. Find the number of albums for each artist. 


--13. Retrieve the Album_id which has more than 5 songs in it. 
--14. Retrieve all songs from the album 'Album1'. (using Subquery) 
