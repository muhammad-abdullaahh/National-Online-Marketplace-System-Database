--database creation
CREATE DATABASE National_Online_Marketplace_System

select * from customers
select * from sellers
select * from categories
select * from products
select * from orders

--tables creation
USE National_Online_Marketplace_System
CREATE Table Customers(
cust_id int PRIMARY KEY,
cust_name varchar(30) NOT NULL,
email varchar(20) NOT NULL,
reg_date date
)

CREATE TABLE Sellers(
seller_id int PRIMARY KEY,
seller_name varchar(30) NOT NULL,
email varchar(20) UNIQUE NOT NULL
)

CREATE TABLE Categories(
category_id int PRIMARY KEY,
category_name varchar(30) NOT NULL
)

CREATE TABLE Products(
product_id int PRIMARY KEY,
product_name varchar(30) NOT NULL,
price money NOT NULL,
seller_id int NOT NULL FOREIGN KEY References Sellers(seller_id),
category_id int NOT NULL FOREIGN KEY References Categories(category_id)
)

CREATE TABLE Orders(
order_id int PRIMARY KEY,
customer_id int NOT NULL FOREIGN KEY References Customers(cust_id),
order_date date NOT NULL
)

--inserting records
USE National_Online_Marketplace_System
INSERT INTO Customers (cust_id,cust_name,email,reg_date)
Values
(0001,'Abdullah','abdullah@gmail.com','2020-05-02'),
(0002,'Majid','majid@gmail.com','2022-1-12')

INSERT INTO Sellers (seller_id,seller_name,email)
Values
(2005,'Aman','aman@gmail.com'),
(1220,'Rayyan','rayyan@gmail.com')

INSERT INTO Categories (category_id,category_name)
Values
(25,'Digital Products'),
(14,'Clothings')

INSERT INTO Products (product_id,product_name,price,seller_id,category_id)
Values
(14,'Smartwatch',25000,2005,25),
(48,'Sweatshirts',8000,1220,14)

INSERT INTO Orders (order_id,customer_id,order_date)
Values
(551,0001,'2026-03-15'),
(1246,0002,'2026-01-5')

--part b
--1
SELECT c.cust_name, COUNT(o.order_id) as Orders
FROM Customers c
JOIN Orders o on c.cust_id = o.customer_id
GROUP BY c.cust_name
HAVING COUNT (o.order_id) > 2

--2
SELECT s.seller_name , COUNT(p.product_id) as Product_id
FROM Sellers s
JOIN Products p on s.seller_id = p.seller_id
GROUP BY s.seller_id, s.seller_name
HAVING COUNT(p.product_id) > 3

--3
SELECT c.category_name, COUNT(p.product_id) AS Total_Products
FROM Categories c
JOIN Products p on c.category_id = p.category_id
GROUP BY c.category_name
UNION
SELECT c.category_name, COUNT(p.product_name)
FROM Categories c 
JOIN Products p on c.category_id = p.category_id
GROUP BY c.category_name 
ORDER BY category_name desc

--4
SELECT UPPER(product_name) AS ProductName, ROUND(price,0) AS Price
FROM Products
WHERE PRICE>(
SELECT AVG(price)
FROM Products
)