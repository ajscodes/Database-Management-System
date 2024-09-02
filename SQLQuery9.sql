--SET OPERATORS:
--PART-A:

CREATE TABLE COMPUTER(
	ROLLNO INT,
	NAME VARCHAR(50)
);

INSERT INTO COMPUTER (ROLLNO,NAME) VALUES 
	(101,'AJAY'),
	(109,'HARESH'),
	(115,'MANISH');

SELECT * FROM COMPUTER;

CREATE TABLE ELECTRICAL(
	ROLLNO INT,
	NAME VARCHAR(15)
);

INSERT INTO ELECTRICAL (ROLLNO,NAME) VALUES 
	(105,'AJAY'),
	(107,'MAHESH'),
	(115,'MANISH')

SELECT * FROM ELECTRICAL;

--1. Display name of students who is either in Computer or in Electrical. 
SELECT NAME FROM COMPUTER
UNION
SELECT NAME FROM ELECTRICAL

--2. Display name of students who is either in Computer or in Electrical including duplicate data. 
SELECT NAME FROM COMPUTER
UNION ALL
SELECT NAME FROM ELECTRICAL

--3. Display name of students who is in both Computer and Electrical. 
SELECT NAME FROM COMPUTER
INTERSECT 
SELECT NAME FROM ELECTRICAL

--4. Display name of students who are in Computer but not in Electrical. 
SELECT NAME FROM COMPUTER
EXCEPT 
SELECT NAME FROM ELECTRICAL

--5. Display name of students who are in Electrical but not in Computer. 
SELECT NAME FROM ELECTRICAL
EXCEPT
SELECT NAME FROM COMPUTER

--6. Display all the details of students who are either in Computer or in Electrical. 
SELECT * FROM COMPUTER
UNION
SELECT * FROM ELECTRICAL

--7. Display all the details of students who are in both Computer and Electrical.
SELECT * FROM COMPUTER
INTERSECT
SELECT * FROM ELECTRICAL


--PART-B:
CREATE TABLE EMP_DATA(
	EID INT,
	NAME VARCHAR(15)
);

INSERT INTO EMP_DATA(EID,NAME) VALUES 
	(1,'AJAY'),
	(9,'HARESH'),
	(5,'MANISH');

SELECT * FROM EMP_DATA;

CREATE TABLE CUSTOMER(
	CID INT,
	NAME VARCHAR(15)
);

INSERT INTO CUSTOMER(CID,NAME) VALUES 
	(5,'AJAY'),
	(7,'MAHESH'),
	(5,'MANISH');

SELECT * FROM CUSTOMER;

--1. Display name of persons who is either Employee or Customer. 
SELECT NAME FROM EMP_DATA
UNION
SELECT NAME FROM CUSTOMER

--2. Display name of persons who is either Employee or Customer including duplicate data. 
SELECT NAME FROM EMP_DATA
UNION ALL
SELECT NAME FROM CUSTOMER

--3. Display name of persons who is both Employee as well as Customer. 
SELECT NAME FROM EMP_DATA
INTERSECT
SELECT NAME FROM CUSTOMER

--4. Display name of persons who are Employee but not Customer. 
SELECT NAME FROM EMP_DATA
EXCEPT
SELECT NAME FROM CUSTOMER

--5. Display name of persons who are Customer but not Employee.
SELECT NAME FROM CUSTOMER
UNION
SELECT NAME FROM EMP_DATA


--PART-C:
--1. Display name of persons who is either Employee or Customer. 
SELECT * FROM EMP_DATA
UNION
SELECT * FROM CUSTOMER

--2. Display name of persons who is either Employee or Customer including duplicate data. 
SELECT * FROM EMP_DATA
UNION ALL
SELECT * FROM CUSTOMER

--3. Display name of persons who is both Employee as well as Customer. 
SELECT * FROM EMP_DATA
INTERSECT
SELECT * FROM CUSTOMER

--4. Display name of persons who are Employee but not Customer. 
SELECT * FROM EMP_DATA
EXCEPT
SELECT * FROM CUSTOMER

--5. Display name of persons who are Customer but not Employee.
SELECT *FROM CUSTOMER
UNION
SELECT * FROM EMP_DATA