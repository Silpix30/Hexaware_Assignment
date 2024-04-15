create database TechShop;
create schema Ts;

--TASK 1 : DATABASE DESIGN--

create table Ts.Customers(CustomerID int Primary Key, FirstName varchar(20) , LastName varchar(20), Email varchar(30) , Phone varchar(10), Address varchar(50))
create table Ts.Categories(CategoryID int Primary Key,CategoryName varchar(20))
create table Ts.Products(ProductID int Primary Key,CategoryID int references ts.Categories(CategoryID), ProductName varchar(20) , Description varchar(50), Price int )
create table Ts.Orders(OrderID int Primary Key, CustomerID int references ts.Customers(CustomerID), OrderDate date , TotalAmount int)
create table Ts.OrderDetails(OrderDetailID int Primary Key, OrderID int references ts.Orders(OrderID), ProductID int references ts.Products(ProductID),Quantity int)
create table Ts.Inventory(InventoryID int Primary Key, ProductID int references ts.Products(ProductID),QuantityInStock int,LastStockUpdate date)

--Customers
insert into Ts.Customers values(101,'John','Smith','john.smith@email.com',123-456-7890,'123 Main St, USA')
insert into Ts.Customers values(102,'Emily','Johnson','emily.j@email.com',987-654-3210,'456 Elm St, USA')
insert into Ts.Customers values(103,'Michael','Davis','mike.d@email.com',555-123-4567,'789 Oak St, USA')
insert into Ts.Customers values(104,'Sarah','Brown','sarah.b@email.com',222-333-4444,'101 Pine St, USA')
insert into Ts.Customers values(105,'David','Martinez','david.m@email.com',777-888-9999,'555 Cedar St, USA')
insert into Ts.Customers values(106,'Jessica','Lee','jessica.lee@email.com',666-555-4444,'333 Maple St, USA')
insert into Ts.Customers values(107,'Kevin','Taylor','kevin.t@email.com',111-222-3333,'777 Oak St, USA')
insert into Ts.Customers values(108,'Amanda','White','amanda.white@email.com',444-555-6666,'888 Birch St, USA')
insert into Ts.Customers values(109,'Brian','Harris','brian.h@email.com',222-333-4444,'999 Pine St, USA')
insert into Ts.Customers values(110,'Rachael','Thompson','rachel.t@email.com',333-444-5555,'222 Walnut St,USA')

--Categories
insert into Ts.Categories values(711, 'Apple')
insert into Ts.Categories values(712,'Samsung')
insert into Ts.Categories values(713,'Fitbit')
insert into ts.categories values(714,'Microsoft')
insert into Ts.Categories values(715,'Sony')
insert into Ts.Categories values(716,'Dell')

--Products
insert into Ts.products values(201,711, 'iPhone 12 Pro', 'Flagship Apple smartphone with advanced features', 96139)
insert into Ts.products values(202,712, 'Samsung Galaxy S21 Ultra', 'Premium Android phone with powerful specifications', 34999)
insert into ts.products values(203,716, 'Dell XPS 15', 'Sleek high-performance laptop with vibrant display', 264089)
insert into ts.products values(204,711,'MacBook Pro 13-inch', 'Professional-grade Apple laptop with Retina display', 114199)
insert into ts.products values(205,711, 'iPad Pro', 'Versatile tablet for professionals with Apple Pencil support',89900)
insert into ts.products values(206,712, 'Samsung Galaxy Tab S7', 'Premium Android tablet with optional keyboard accessories',32499)
insert into ts.products values(207,711,'Apple Watch Series 6', 'Feature-packed smartwatch with health tracking capabilities', 69900)
insert into ts.products values(208,713, 'Fitbit Versa 3', 'Stylish fitness smartwatch with GPS and heart rate monitoring', 17999)
insert into ts.products values(209,715, 'PlayStation 5', 'Sony''s latest gaming console with cutting-edge hardware', 58999)
insert into ts.products values(210,714, 'Xbox Series X', 'Microsoft''s flagship gaming console with 4K support', 49800)

--Orders
insert into ts.orders values(301, 103, '2023-05-10', 74925)
insert into ts.orders values(302, 107, '2023-07-22', 82500)
insert into ts.orders values(303, 102, '2023-09-15', 90000)
insert into ts.orders values(304, 105, '2023-10-03', 74925)
insert into ts.orders values(305, 101, '2023-11-18', 112500)
insert into ts.orders values(306, 109, '2024-01-05', 74925)
insert into ts.orders values(307, 104, '2024-03-12', 97500)
insert into ts.orders values(308, 106, '2024-04-01', 74925)
insert into ts.orders values(309, 108, '2024-05-20', 105000)
insert into ts.orders values(310, 110, '2024-06-08', 74925)

--OrderDetails
insert into ts.orderdetails values(401, 301, 201, 1)
insert into ts.orderdetails values(402, 301, 203, 2)
insert into ts.orderdetails values(403, 302, 205, 1)
insert into ts.orderdetails values(404, 303, 202, 3)
insert into ts.orderdetails values(405, 303, 204, 1)
insert into ts.orderdetails values(406, 304, 207, 2)
insert into ts.orderdetails values(407, 305, 209, 1)
insert into ts.orderdetails values(408, 306, 210, 1)
insert into ts.orderdetails values(409, 307, 206, 2)
insert into ts.orderdetails values(410, 308, 208, 1)

--Inventory
insert into ts.inventory values(501, 201, 100, '2023-01-05')
insert into ts.inventory values(502, 202, 75, '2023-01-07')
insert into ts.inventory values(503, 203, 50, '2023-01-10')
insert into ts.inventory values(504, 204, 200, '2023-01-12')
insert into ts.inventory values(505, 205, 150, '2023-01-15')
insert into ts.inventory values(506, 206, 80, '2023-01-18')
insert into ts.inventory values(507, 207, 120, '2023-01-20')
insert into ts.inventory values(508, 208, 90, '2023-01-22')
insert into ts.inventory values(509, 209, 60, '2023-01-25')
insert into ts.inventory values(510, 210, 110, '2023-01-28')

select * from Ts.Customers
select * from Ts.Categories
select * from Ts.Products
select * from Ts.Orders
select * from Ts.OrderDetails
select * from ts.Inventory

--TASK 2 : SELECT,WHERE,BETWEEN,AND,LIKE--

--Write an SQL query to retrieve the names and emails of all customers. 
select FirstName , LastName , Email from ts.Customers 

--Write an SQL query to list all orders with their order dates and corresponding customer names
select o.OrderID, o.OrderDate, concat(c.FirstName, ' ', c.LastName) as CustomerName from ts.Orders  o, ts.Customers  c where o.CustomerID = c.CustomerID

--Write an SQL query to insert a new customer record into the "Customers" table. Include customer information such as name, email, and address.
insert into ts.Customers (CustomerID,FirstName ,LastName, Email,Address)values (111, 'Ami', 'Jackson', 'ami.j@email.com','123 Main St') 

--Write an SQL query to update the prices of all electronic gadgets in the "Products" table by increasing them by 10%
update ts.Products set Price = Price * 1.10 

-- Write an SQL query to delete a specific order and its associated order details from the "Orders" and "OrderDetails" tables. Allow users to input the order ID as a parameter.
declare @orderid int
set @orderid = 301
delete from ts.OrderDetails where orderid = @orderid
delete from ts.Orders where orderid = @orderid
select * from ts.Orders 
select * from ts.OrderDetails 

--Write an SQL query to insert a new order into the "Orders" table. Include the customer ID, order date, and any other necessary information.
insert into ts.Orders values(301, 103, '2024-05-10', 74925)

--Write an SQL query to update the contact information (e.g., email and address) of a specific customer in the "Customers" table. Allow users to input the customer ID and new contact information.
declare @customerid int
declare @newemail varchar(50)
declare @newaddress varchar(50)
set @customerid = 103
set @newemail = 'mike0703@email.com'
set @newaddress = '540 Pine St,USA'
update ts.customers set email = @newemail,address = @newaddress where customerid = @customerid

--Write an SQL query to recalculate and update the total cost of each order in the "Orders" table based on the prices and quantities in the "OrderDetails" table.
update ts.Orders set TotalAmount= (select sum(od.quantity * p.price) from ts.OrderDetails od join ts.Products p on od.ProductID= p.ProductID where od.OrderID = Orders.OrderID)

--Write an SQL query to insert a new electronic gadget product into the "Products" table, including product name, category, price, and any other relevant details.
insert into Ts.products values(211,715, 'Sony WH-1000XM4', 'Premium wireless noise-canceling headphones', 899)

--Write an SQL query to calculate and update the number of orders placed by each customer in the "Customers" table based on the data in the "Orders" table
alter table ts.customers add Orders_count int
update ts.customers set Orders_count = (select count(*) from Ts.orders where orders.customerid = customers.customerid)
select * from ts.Customers 

--Write an SQL query to update the status of a specific order in the "Orders" table (e.g., from "Pending" to "Shipped"). Allow users to input the order ID and the new status.
alter table ts.orders add Status varchar(20)
update ts.Orders set Status= 'Shipped' where CustomerID=101
select * from ts.Orders

--TASK 3 : AGG FN, HAVING, ORDERBY, GROUPBY AND JOINS--

--Write an SQL query to retrieve a list of all orders along with customer information (e.g., customer name) for each order.
select o.OrderID,o.OrderDate, concat(c.FirstName, ' ', c.LastName) as CustomerName 
from ts.Orders o left join ts.Customers c on o.CustomerID = c.CustomerID

--Write an SQL query to find the total revenue generated by each electronic gadget product. Include the product name and the total revenue
select p.ProductName , sum(od.Quantity * p.Price) as TotalRevenue 
from ts.OrderDetails od join ts.Products p on od.ProductID = p.ProductID  group by ProductName

--Write an SQL query to list all customers who have made at least one purchase. Include their names and contact information
select concat(c.FirstName, ' ', c.LastName) as CustomerName, Email, Phone, Address from ts.Customers c 
where CustomerID in (select distinct CustomerID from ts.Orders)

--Write an SQL query to find the most popular electronic gadget, which is the one with the highest total quantity ordered. Include the product name and the total quantity ordered.
select p.ProductName , sum(od.Quantity) as TotalQuantityOrdered from ts.OrderDetails od 
join ts.Products p on od.ProductID = p.ProductID group by p.ProductName order by TotalQuantityOrdered desc

--Write an SQL query to retrieve a list of electronic gadgets along with their corresponding categories.
select p.ProductName, c.CategoryName from ts.Products p join ts.Categories c on p.categoryid = c.categoryid

--Write an SQL query to calculate the average order value for each customer. Include the customer's name and their average order value.
select concat(c.FirstName, ' ', c.LastName) as CustomerName, avg(od.Quantity * p.Price) as AverageOrderValue from ts.Orders o 
join ts.Customers c on o.CustomerID = c.CustomerID 
join ts.OrderDetails od on o.OrderID = od.OrderID 
join ts.Products p on od.ProductID = p.ProductID group by c.FirstName, c.LastName

--Write an SQL query to find the order with the highest total revenue. Include the order ID, customer information, and the total revenue
select o.OrderID, concat(c.FirstName, ' ', c.LastName) as CustomerName, sum(od.Quantity * p.Price) as TotalRevenue from ts.Orders o 
join ts.Customers c on o.CustomerID = c.CustomerID 
join ts.OrderDetails od on o.OrderID = od.OrderID 
join ts.Products p on od.ProductID = p.ProductID group by o.OrderID, c.FirstName, c.LastName order by TotalRevenue desc

--Write an SQL query to list electronic gadgets and the number of times each product has been ordered.
select p.ProductName , count(od.ProductID) as NumberOfOrders from ts.Products p join ts.OrderDetails od on p.ProductID = od.ProductID group by p.ProductName 

--Write an SQL query to find customers who have purchased a specific electronic gadget product. Allow users to input the product name as a parameter
select distinct concat(c.FirstName, ' ', c.LastName) as CustomerName from ts.Customers c join ts.Orders o on c.customerid = o.customerid
join ts.OrderDetails od on o.orderid = od.orderid
join ts.Products p on od.productid = p.productid where p.ProductName = 'iPad Pro'

--Write an SQL query to calculate the total revenue generated by all orders placed within a specific time period. Allow users to input the start and end dates as parameters
select sum(od.Quantity * p.Price) as TotalRevenue from Ts.Orders o
join ts.OrderDetails od on o.orderid = od.orderid
join ts.Products p on od.productid = p.productid where o.orderdate between '2023-01-01' and '2023-12-31'

--TASK 4 : SUB QUERIES AND IT'S TYPE--

--Write an SQL query to find out which customers have not placed any orders.
select concat(FirstName,' ',LastName) as CustomerName from Ts.Customers where CustomerID not in (select distinct CustomerID from Ts.Orders )

--Write an SQL query to find the total number of products available for sale.
select COUNT(*) as Total_Products_Available from Ts.Products where ProductID in (select ProductID from ts.Inventory)

--Write an SQL query to calculate the total revenue generated by TechShop.
select sum(o.totalamount) as TotalRevenue from Ts.Orders o where OrderID in (select OrderID from Ts.OrderDetails)

--Write an SQL query to calculate the average quantity ordered for products in a specific category. Allow users to input the category name as a parameter.
declare @CategoryName varchar(30)
set @CategoryName = 'Samsung'
select avg(od.quantity) as AvgQuantityOrdered from Ts.OrderDetails od 
where od.productid in (select p.productid from ts.products p where p.categoryid in (select categoryid from ts.Categories where categoryname = @CategoryName))

--Write an SQL query to calculate the total revenue generated by a specific customer. Allow users to input the customer ID as a parameter.
declare @custid int
set @custid = 104
select sum(totalamount) as TotalRevenue from ts.Orders
where customerid = (select customerid from ts.customers where customerid = @custid)

--Write an SQL query to find the customers who have placed the most orders. List their names and the number of orders they've placed
select concat(FirstName,' ',LastName) as CustomerName,(select COUNT(o.OrderID) from ts.Orders o 
where o.customerid = c.customerid) as Num_Orders_Placed from ts.Customers c order by Num_Orders_Placed desc

--Write an SQL query to find the most popular product category, which is the one with the highest total quantity ordered across all orders.
select Categoryname as Most_popular_category, Total_quantity_ordered
from (
    select c.CategoryName, sum(od.quantity) as Total_quantity_ordered from Ts.OrderDetails od
    join Ts.Products p on od.productid = p.productid
    join Ts.Categories c on p.categoryid = c.categoryid
    group by c.CategoryName 
) as Category_orders
order by total_quantity_ordered desc

--Write an SQL query to find the customer who has spent the most money (highest total revenue) on electronic gadgets. List their name and total spending
select concat(FirstName,' ',LastName) as CustomerName, Categoryname,Total_spending
from (
    select o.customerid, SUM(od.quantity * p.price) as Total_spending, cat.CategoryName from ts.orders o
    join ts.orderdetails od on o.orderid = od.orderid
    join ts.products p on od.productid = p.productid
    join ts.Categories cat on p.categoryid = cat.categoryid
    where cat.CategoryID  = '715'
    group by o.customerid, cat.CategoryName 
) as Customer_spending
join ts.Customers c on Customer_spending.customerid = c.customerid
order by Total_spending desc 

--Write an SQL query to calculate the average order value (total revenue divided by the number of orders) for all customers
select concat(FirstName,' ',LastName) as CustomerName,
(select sum(Totalamount) from ts.Orders where CustomerID=c.customerid)/(select count(OrderID) from ts.Orders where CustomerID=c.customerid ) as Avg_order_value 
from Ts.Customers c order by Avg_order_value desc

-- Write an SQL query to find the total number of orders placed by each customer and list their names along with the order count.
select concat(FirstName,' ',LastName) as CustomerName, (select count(OrderID) from ts.Orders o where o.customerid = c.customerid) as Order_count
from ts.Customers c order by Order_count desc

















