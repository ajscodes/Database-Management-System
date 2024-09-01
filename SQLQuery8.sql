CREATE TABLE SALES_DATA (
    Region VARCHAR(50),
    Product VARCHAR(50),
    Sales_Amount INT,
    Year INT
);

INSERT INTO SALES_DATA (Region, Product, Sales_Amount, Year) VALUES
('North America', 'Watch', 1500, 2023),
('Europe', 'Mobile', 1200, 2023),
('Asia', 'Watch', 1800, 2023),
('North America', 'TV', 900, 2024),
('Europe', 'Watch', 2000, 2024),
('Asia', 'Mobile', 1000, 2024),
('North America', 'Mobile', 1600, 2023),
('Europe', 'TV', 1500, 2023),
('Asia', 'TV', 1100, 2024),
('North America', 'Watch', 1700, 2024);

SELECT * FROM SALES_DATA;


--Part – A: 
--1. Display Total Sales Amount by Region. 
SELECT 
	Region,SUM(Sales_Amount) AS TOTAL_SALE_AMOUNT 
FROM SALES_DATA 
GROUP BY Region;

--2. Display Average Sales Amount by Product 
SELECT 
	AVG(Sales_Amount) 
FROM SALES_DATA 
GROUP BY Product;

--3. Display Maximum Sales Amount by Year 
SELECT 
	MAX(Sales_Amount) 
FROM SALES_DATA 
GROUP BY Year; 

--4. Display Minimum Sales Amount by Region and Year 
SELECT 
	MIN(Sales_Amount) 
FROM SALES_DATA 
GROUP BY Region, Year;

--5. Count of Products Sold by Region 
SELECT 
	COUNT(Product) 
FROM SALES_DATA 
GROUP BY Region;

--6. Display Sales Amount by Year and Product 
SELECT 
	Sales_Amount
FROM SALES_DATA
GROUP BY Year,Product;

--7. Display Regions with Total Sales Greater Than 5000 
SELECT 
	SUM(Sales_Amount), Region
FROM SALES_DATA
GROUP BY Region 
HAVING SUM(Sales_Amount) > 5000;

--8. Display Products with Average Sales Less Than 10000 
SELECT
	Product, AVG(Sales_Amount)
FROM SALES_DATA
GROUP BY Product 
HAVING AVG(Sales_Amount) < 10000;

--9. Display Years with Maximum Sales Exceeding 500 
SELECT
	Year, MAX(Sales_Amount)
FROM SALES_DATA
GROUP BY Year
HAVING MAX(Sales_Amount) > 500;

--10. Display Regions with at Least 3 Distinct Products Sold. 
SELECT
	Region, COUNT(DISTINCT Product)
FROM SALES_DATA
GROUP BY Region
HAVING COUNT(DISTINCT Sales_Amount) < 1000;

--11. Display Years with Minimum Sales Less Than 1000 
SELECT
	Year, MIN(Sales_Amount)
FROM SALES_DATA
GROUP BY YEAR
HAVING MIN(Sales_Amount) < 1000;

--12. Display Total Sales Amount by Region for Year 2023, Sorted by Total Amount 
SELECT 
	Region, SUM(Sales_Amount) 
FROM SALES_DATA
WHERE Year = 2023 
GROUP BY Region
ORDER BY SUM(Sales_Amount);


--Part – B: 
--1. Display Count of Orders by Year and Region, Sorted by Year and Region 
SELECT
	Year AS YEAR, Region, COUNT(*) AS ORDER_COUNT
FROM SALES_DATA
GROUP BY Region, Year
ORDER BY Year, Region;

--2. Display Regions with Maximum Sales Amount Exceeding 1000 in Any Year, Sorted by Region 
SELECT * FROM SALES_DATA;

SELECT 
	Region
FROM SALES_DATA
GROUP BY Region 
HAVING MAX(Sales_Amount) > 1000
ORDER BY Region;

--3. Display Years with Total Sales Amount Less Than 1000, Sorted by Year Descending 
SELECT 
	Year
FROM SALES_DATA
GROUP BY Year
HAVING SUM(Sales_Amount) < 1000
ORDER BY Year DESC;

--4. Display Top 3 Regions by Total Sales Amount in Year 2024 
SELECT
	TOP 3 Region, SUM(Sales_Amount) AS TOTAL_SALES
FROM SALES_DATA
WHERE Year = '2024'
GROUP BY Region
ORDER BY TOTAL_SALES DESC;



--Part – C: 
--1. Display Products with Average Sales Amount Between 1000 and 2000, Ordered by Product Name 
SELECT 
	Product, AVG(Sales_Amount) AS AVG_SALES
FROM SALES_DATA
GROUP BY Product
HAVING AVG(Sales_Amount) BETWEEN 1000 AND 2000
ORDER BY Product;

--2. Display Years with More Than 5 Orders from Each Region 


--3. Display Regions with Average Sales Amount Above 1500 in Year 2023 sort by amount in descending. 


--4. Find out region wise duplicate product. 


--5. Find out region wise highest sales amount.
