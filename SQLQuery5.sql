CREATE TABLE STUDENT(
	StuID INT,
	FirstName VARCHAR(25),
	LastName VARCHAR(25),
	Website VARCHAR(50),
	City VARCHAR(25),
	Address VARCHAR(100)
);
INSERT INTO STUDENT VALUES (1011,'Keyur','Patel','techonthenet.com','Rajkot','A-303 ''Vasant Kunj'', Rajkot'),
	(1022,'Hardik','Shah','digminecraft.com','Ahmedabad','"Ram krupa", Raiya Road'),
	(1033,'Kajal','Trivedi','bigactivities.com','Baroda','Raj bhavan plot, near garden'),
	(1044,'Bhoomi','Gajera','checkyourmath.com','Ahmedabad','"jig''s home", Narol '),
	(1055,'Harmit','Mitel','@me.darshan.com','Rajkot','B-55, Raj Residency'),
	(1066,'Ashok','Jani',NULL,'Baroda','A502, Club House Building')

SELECT * FROM STUDENT;

--1. Display the name of students whose name starts with ‘k’. 
SELECT * FROM STUDENT WHERE FirstName LIKE 'K%';
--2. Display the name of students whose name consists of five characters. 
SELECT * FROM STUDENT WHERE FirstName LIKE '______';
--3. Retrieve the first name & last name of students whose city name ends with a & contains six characters. 
SELECT FirstName, LastName FROM STUDENT WHERE City LIKE '_____a';
--4. Display all the students whose last name ends with ‘tel’. 
SELECT LASTNAME FROM STUDENT WHERE LastName LIKE '%tel';
--5. Display all the students whose first name starts with ‘ha’ & ends with‘t’. 
SELECT FirstName FROM STUDENT WHERE FirstName LIKE 'HA%T';
--6. Display all the students whose first name starts with ‘k’ and third character is ‘y’. 
SELECT FirstName FROM STUDENT WHERE FirstName LIKE 'K_Y%';
--7. Display the name of students having no website and name consists of five characters. 
SELECT * FROM STUDENT WHERE Website IS NULL AND FirstName LIKE '_____';
--8. Display all the students whose last name consist of ‘jer’.   
SELECT LastName FROM STUDENT WHERE LastName LIKE '%JER';
--9. Display all the students whose city name starts with either ‘r’ or ‘b’. 
SELECT City FROM STUDENT WHERE City LIKE '[R,B]%';
--10. Display all the name students having websites. 
SELECT * FROM STUDENT WHERE Website IS NOT NULL;
--11. Display all the students whose name starts from alphabet A to H. 
SELECT * FROM STUDENT WHERE FirstName LIKE '[A-H]%';
--12. Display all the students whose name’s second character is vowel. 
SELECT * FROM STUDENT WHERE LastName LIKE '_[AEIOU]%';
--13. Display the name of students having no website and name consists of minimum five characters. 
SELECT * FROM STUDENT WHERE Website IS NULL AND FirstName LIKE '_____%';
--14. Display all the students whose last name starts with ‘Pat’.  
SELECT * FROM STUDENT WHERE LastName LIKE '[PAT]%';
--15. Display all the students whose city name does not starts with ‘b’.
SELECT * FROM STUDENT WHERE City NOT LIKE 'B%';

--Part – B: 
--1. Display all the students whose name starts from alphabet A or H. 
SELECT * FROM STUDENT WHERE FirstName LIKE '[AH]%';
--2. Display all the students whose name’s second character is vowel and of and start with H. 
SELECT * FROM STUDENT WHERE FirstName LIKE 'H[AEIOU]%';
--3. Display all the students whose last name does not ends with ‘a’. 
SELECT * FROM STUDENT WHERE LastName NOT LIKE '%[A]';
--4. Display all the students whose first name starts with consonant. 
SELECT * FROM STUDENT WHERE FirstName NOT LIKE '[AEIOU]%';
--5. Display all the students whose website contains .net 
SELECT * FROM STUDENT WHERE Website LIKE '%.NET%';

--Part – C: 
--1. Display all the students whose address consist of -. 
SELECT * FROM STUDENT WHERE Address LIKE '%-%';
--2. Display all the students whose address contains single quote or double quote. 
SELECT * FROM STUDENT WHERE Address LIKE '%[''""]%';
--3. Display all the students whose website contains @. 
SELECT * FROM STUDENT WHERE Website LIKE '%@%';
--4. Display all the names those are either four or five characters. 
SELECT * FROM STUDENT WHERE FirstName LIKE '____' OR FirstName LIKE '_____';

--EXTRE 
--FIND % CONTAINS ADDRESS
SELECT * FROM STUDENT WHERE Address LIKE '%/%%' ESCAPE '/';
--OR
SELECT * FROM STUDENT WHERE Address LIKE '%[%]%';
--OR
SELECT * FROM STUDENT WHERE Address LIKE '%&%%' ESCAPE '&'; --ANY SIGN VALID FOR ESCAPE