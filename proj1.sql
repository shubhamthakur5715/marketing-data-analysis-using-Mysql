-- CREATE DATABASE Market;
USE Market;
-- DESCRIBE Customer;
 SELECT * FROM Customer;
 SELECT * FROM Product;


-- total number customer.
SELECT count(Cus_id) AS Total_Number_Customers FROM Customer; 

-- total unique product
SELECT count(distinct Name) AS Total_Unique_Product FROM Product;
SELECT DISTINCT Name FROM Product;
-- total unique brand
SELECT COUNT(distinct Brand) AS Total_unique_brand FROM Product;
SELECT DISTINCT Brand FROM Product;
-- total income
SELECT SUM(Price*Stock) AS Total_Income FROM Product;
-- sort by stock with minimum to max.
SELECT * FROM Product ORDER BY Stock ASC;
SELECT * FROM Product ORDER BY Stock DESC;
-- find product with least stock 
SELECT * FROM Product ORDER BY Stock ASC LIMIT 2;

-- customer with maximum order
SELECT C.First_NamE,C.Last_Name,C.Country,C.City,
C.Phone1,C.Phone2,C.Email, COUNT(P.Prod_id) AS TOTAL_ORDER FROM Customer C JOIN Product P ON C.Cus_id = P.Cus_id
GROUP BY C.First_NamE,C.Last_Name,C.Country,C.City,
C.Phone1,C.Phone2,C.Email ORDER BY TOTAL_ORDER DESC limit 1;
 
-- all customers from macao
SELECT * FROM Customer WHERE Country="Macao";

-- customer with no order
SELECT C.First_NamE,C.Last_Name,C.Country,C.City,
C.Phone1,C.Phone2,C.Email FROM Customer C INNER JOIN Product P
 ON C.Cus_id<>P.Cus_id;
 
-- product that is out of stock
SELECT * FROM Product WHERE Availability="out_of_stock";

-- all customer from iran who orders smartwatches
SELECT C.Cus_id, C.First_Name,C.Last_Name,C.Country,C.City,
C.Phone1,C.Phone2,C.Email,P.Name,P.Brand,P.Category,
P.Price,P.Stock,P.Color,P.Size,P.Availability FROM Customer C INNER JOIN Product P
 ON C.Cus_id<>P.Prod_id WHERE Country="Iran" AND Category="Smartwatches";
 
 
 
 -- productwise total income
 SELECT C.First_NamE,C.Last_Name,P.Name,C.Country,C.City,
C.Phone1,C.Phone2,C.Email, COUNT(P.Name) AS TOTAL_Product, SUM(Price*Stock) AS total_productwise_income FROM Customer C JOIN Product P ON C.Cus_id = P.Cus_id
GROUP BY C.First_NamE,C.Last_Name,C.Country,C.City,
C.Phone1,C.Phone2,C.Email,P.Name ORDER BY total_productwise_income DESC LIMIT 1000;
 
 
 -- most active city
 SELECT C.First_NamE,C.Last_Name,C.Country,C.City,
C.Phone1,C.Phone2,C.Email, COUNT(C.City) AS Most_active_city FROM Customer C JOIN Product P ON C.Cus_id = P.Cus_id
GROUP BY C.First_NamE,C.Last_Name,C.Country,C.City,
C.Phone1,C.Phone2,C.Email ORDER BY Most_active_city DESC LIMIT 1;
 
 -- most sold size
SELECT C.First_NamE,C.Last_Name,C.Country,C.City,
C.Phone1,C.Phone2,C.Email,P.Size, COUNT(P.Size) AS TOTAL_SIZE FROM Customer C JOIN Product P ON C.Cus_id = P.Cus_id
GROUP BY C.First_NamE,C.Last_Name,C.Country,C.City,
C.Phone1,C.Phone2,C.Email,P.Size ORDER BY TOTAL_Size DESC LIMIT 4;
 
 
 -- date operations
 select current_date();
 select curdate();
 select current_time();
 
 select now();
 select day(now());
 select month(now());
 select year(now());
 
  select hour(now());
 select minute(now());
 select second(now());
 
 select datediff("2001-01-01", "2026-01-01");
 
 select date_add(now(), interval 15 DAY);
 select date_add(now(), interval 15 MONTH);
 select date_add(now(), interval 15 YEAR);
 
 select date_sub(now(), interval 22 DAY);
 
 select date_format(now(), "%w"); -- week count
 select date_format(now(), "%W"); -- day name full
 select date_format(now(), "%M"); -- month name in full
 select date_format(now(), "%b"); -- month name in short
 select date_format(now(), "%a"); -- day name in short
 select date_format(now(), "%c"); -- monht count in number