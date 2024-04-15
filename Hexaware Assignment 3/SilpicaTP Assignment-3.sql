create database HMBank
create schema hm

--TASK 1 : DATABASE DESIGN--

create table hm.Customers(CustomerID int Primary Key, FirstName varchar(20) , LastName varchar(20), DateofBirth date, Email varchar(30) , Phone_no varchar(10),Address varchar(50))
create table hm.Accounts(AccountID int Primary Key,CustomerID int references hm.Customers(CustomerID),Account_type varchar(30),Balance int)
create table hm.Transactions(TransactionID int Primary Key,AccountID int references hm.Accounts(AccountID),Transaction_type varchar(30),Amount int,Transaction_date date)

--Customers
insert into hm.Customers (CustomerID, FirstName, LastName, DateofBirth, Email, Phone_no, Address)
values 
    (1, 'John', 'Doe', '1990-05-15', 'john@example.com', '1234567890', '123 Main St'),
    (2, 'Jane', 'Smith', '1988-09-22', 'jane@example.com', '9876543210', '456 Elm St'),
    (3, 'Michael', 'Johnson', '1995-12-10', 'michael@example.com', '4567890123', '789 Oak St'),
    (4, 'Emily', 'Brown', '1985-04-03', 'emily@example.com', '7890123456', '321 Pine St'),
    (5, 'David', 'Wilson', '1992-07-28', 'david@example.com', '2345678901', '567 Maple St'),
    (6, 'Jessica', 'Taylor', '1998-01-17', 'jessica@example.com', '8901234567', '654 Birch St'),
    (7, 'Matthew', 'Martinez', '1980-11-05', 'matthew@example.com', '3456789012', '987 Cedar St'),
    (8, 'Ashley', 'Anderson', '1993-03-20', 'ashley@example.com', '9012345678', '432 Walnut St'),
    (9, 'Christopher', 'Hernandez', '1987-08-12', 'christopher@example.com', '4567890123', '789 Oak St'),
    (10, 'Amanda', 'Garcia', '1991-06-30', 'amanda@example.com', '7890123456', '321 Pine St')

--Accounts
insert into hm.Accounts (AccountID, CustomerID, Account_type, Balance)
values 
    (101, 1, 'Savings', 5000),
    (102, 2, 'Current', 3000),
    (103, 3, 'Savings', 7000),
    (104, 4, 'Current', 2000),
    (105, 5, 'Zero_Balance', 6000),
    (106, 6, 'Current', 4000),
    (107, 7, 'Savings', 8000),
    (108, 8, 'Zero_Balance', 1500),
    (109, 9, 'Savings', 5500),
    (110, 10, 'Current', 2500)

--Transactions
insert into hm.Transactions (TransactionID, AccountID, Transaction_type, Amount, Transaction_date)
values 
    (201, 101, 'Deposit', 1000, '2023-04-15'),
    (206, 106, 'Withdrawal', 800, '2023-04-20'),
    (204, 104, 'Withdrawal', 1000, '2023-04-18'),
    (211, 101, 'Transfer', 700, '2023-04-25'),
    (210, 110, 'Transfer', 400, '2023-04-24'),
    (207, 107, 'Deposit', 3000, '2023-04-21'),
    (209, 109, 'Transfer', 1200, '2023-04-23'),
    (205, 105, 'Deposit', 1500, '2023-04-19'),
    (212, 103, 'Transfer', 1500, '2023-04-26'),
    (203, 103, 'Deposit', 2000, '2023-04-17'),
    (202, 102, 'Withdrawal', 500, '2023-04-16'),
    (208, 108, 'Withdrawal', 200, '2023-04-22')

select * from hm.Customers
select * from hm.Accounts
select * from hm.Transactions

--TASK 2 : SELECT,WHERE,BETWEEN,AND,LIKE--

--Write a SQL query to retrieve the name, account type and email of all customers.
select concat(c.FirstName, ' ', c.LastName) as CustomerName,Account_type,c.Email from hm.Customers c join hm.Accounts a on c.CustomerID = a.CustomerID

--Write a SQL query to list all transaction corresponding customer.
select concat(c.FirstName, ' ', c.LastName) as CustomerName,Transaction_type, Amount from hm.Transactions t 
join hm.Accounts a on a.AccountID=t.AccountID join hm.Customers c on a.CustomerID=c.CustomerID order by CustomerName

--Write a SQL query to increase the balance of a specific account by a certain amount.
update hm.Accounts set Balance= Balance + 1000 where AccountID=104
select * from hm.Accounts 

--Write a SQL query to Combine first and last names of customers as a full_name.
select concat(FirstName, ' ', LastName) as CustomersFullName from hm.Customers 

--Write a SQL query to remove accounts with a balance of zero where the account type is savings.
alter table hm.Transactions drop constraint FK__Transacti__Accou__3D5E1FD2
alter table hm.Transactions add constraint FK__Transacti__Accou__3D5E1FD2 foreign key (accountid) references hm.accounts(accountid) on delete cascade
delete from hm.Accounts where Balance=0 and Account_type='Savings'
select * from hm.Accounts

--Write a SQL query to Find customers living in a specific city.
select * from hm.Customers where Address like '____pine%'

--Write a SQL query to Get the account balance for a specific account.
select Balance from hm.Accounts where AccountID=107

--Write a SQL query to List all current accounts with a balance greater than $1,000.
select * from hm.Accounts where Balance > 1000

--Write a SQL query to Retrieve all transactions for a specific account.
select concat(c.FirstName, ' ', c.LastName) as CustomerName,Transaction_type,Account_type, Amount from hm.Transactions t 
join hm.Accounts a on a.AccountID=t.AccountID join hm.Customers c on a.CustomerID=c.CustomerID where a.Account_type='Current' order by CustomerName

--Write a SQL query to Calculate the interest accrued on savings accounts based on a given interest rate.
select AccountID, Balance * (2 / 100) AS InterestAccrued
from hm.Accounts where Account_type='Savings'

--Write a SQL query to Identify accounts where the balance is less than a specified overdraft limit.
declare @OverdraftLimit int
set @OverdraftLimit = 2000
select * from hm.Accounts where Balance < @OverdraftLimit  

--Write a SQL query to Find customers not living in a specific city.
select * from hm.Customers where Address not like '____pine%'

--TASK 3 : AGG FN, HAVING, ORDERBY, GROUPBY AND JOINS--

--Write a SQL query to Find the average account balance for all customers.
select AVG(Balance) as Avg_acc_balance from hm.Accounts

--Write a SQL query to Retrieve the top 10 highest account balances.
select top 10 Balance as 'Top 10 highest account balances' from hm.Accounts order by Balance desc

--Write a SQL query to Calculate Total Deposits for All Customers in specific date.
select COUNT(c.CustomerID) as 'Count of Customers',SUM(amount) as Total_deposits from hm.Transactions t join hm.Accounts a ON t.accountid = a.accountid join hm.Customers c on a.customerid = c.customerid
where t.transaction_type = 'deposit' and t.transaction_date = '2023-04-21' group by c.CustomerID

--Write a SQL query to Find the Oldest and Newest Customers.
select top 1 concat(FirstName, ' ', LastName) as OldestCustomerName,Dateofbirth from hm.Customers order by DateofBirth asc 
select top 1 concat(FirstName, ' ', LastName) as NewestCustomerName,Dateofbirth from hm.Customers order by DateofBirth desc

--Write a SQL query to Retrieve transaction details along with the account type.
select TransactionID , concat(c.FirstName, ' ', c.LastName) as CustomerName,Transaction_type, Amount,Account_type,Transaction_date  from hm.Transactions t 
join hm.Accounts a on a.AccountID=t.AccountID join hm.Customers c on a.CustomerID=c.CustomerID order by CustomerName

--Write a SQL query to Get a list of customers along with their account details.
select a.Accountid, concat(c.FirstName, ' ', c.LastName) as CustomerName, a.Account_type, a.Balance from hm.Accounts a join hm.Customers c on c.CustomerID=a.CustomerID 

--Write a SQL query to Retrieve transaction details along with customer information for a specific account.
select concat(c.FirstName, ' ', c.LastName) as CustomerName, c.DateofBirth ,c.Email ,c.Phone_no ,Transaction_type,Account_type, Amount, Transaction_date from hm.Transactions t 
join hm.Accounts a on a.AccountID=t.AccountID join hm.Customers c on a.CustomerID=c.CustomerID where a.Account_type='Current' order by CustomerName

--Write a SQL query to Identify customers who have more than one account.
select c.CustomerID, concat(c.firstname, ' ', c.lastname) as CustomerName, count(a.accountid) as Num_accounts from hm.customers c 
join hm.accounts a on c.customerid = a.customerid group by c.customerid, concat(c.firstname, ' ', c.lastname) having count(a.accountid) > 1

--Write a SQL query to Calculate the difference in transaction amounts between deposits and withdrawals.
select (select sum(amount) from hm.transactions where transaction_type = 'deposit') - (select sum(amount) from hm.transactions where transaction_type = 'withdrawal') 
as Difference

--Write a SQL query to Calculate the average daily balance for each account over a specified period.
select AccountID, avg(balance) as Avg_daily_balance from (select accountid, transaction_date, sum(amount) as balance from hm.transactions 
where transaction_date between '2023-04-01' and '2023-04-30' group by AccountID , Transaction_date ) as daily_balances group by accountid 

--Calculate the total balance for each account type.
select  Account_type,SUM(balance) as Total_Balance from hm.accounts group by Account_type 

--Identify accounts with the highest number of transactions order by descending order.
select AccountID,Amount from hm.Transactions order by Amount desc

--List customers with high aggregate account balances, along with their account types.
select c.CustomerID, concat(c.FirstName, ' ', c.LastName ) as CustomerName, a.Account_type, sum(a.balance) as Aggregate_balance from hm.customers c 
join hm.accounts a on c.CustomerID = a.CustomerID group by c.CustomerID , c.FirstName , c.LastName , a.account_type having sum(a.balance) > 10000 order by aggregate_balance desc

--Identify and list duplicate transactions based on transaction amount, date, and account.
select t1.TransactionID , t1.AccountID , t1.Transaction_type , t1.Amount , t1.Transaction_date from hm.transactions t1 
join (select Amount , Transaction_date , AccountID  from hm.transactions group by amount, transaction_date, accountid having count(*) > 1 ) t2 
on t1.amount = t2.amount and t1.transaction_date = t2.transaction_date and t1.AccountID = t2.AccountID 

--TASK 4 : SUB QUERIES AND IT'S TYPE--

--Retrieve the customer(s) with the highest account balance.
select c.CustomerID ,concat(c.firstname, ' ', c.lastname) as CustomerName, a.Balance from hm.Accounts a join hm.Customers c on c.CustomerID =a.CustomerID where Balance = (select MAX(balance) from hm.Accounts ) 

--Calculate the average account balance for customers who have more than one account.
select concat(c.firstname, ' ', c.lastname) as CustomerName,avg(a.balance) as Avg_account_balance from hm.customers c
join hm.accounts a on c.customerid = a.customerid
where c.customerid in (select customerid from hm.accounts group by customerid having count(distinct accountid) > 1)
group by c.customerid, c.firstname, c.lastname

--Retrieve accounts with transactions whose amounts exceed the average transaction amount.
Select AccountID , Transaction_type, Amount from hm.Transactions t where Amount > ( select AVG(amount) from hm.Transactions where AccountID =t.AccountID ) 

--Identify customers who have no recorded transactions.
select Customerid , CustomerName from (select c.CustomerID , concat(c.firstname, ' ', c.lastname) as CustomerName,t.TransactionID  from hm.Customers c 
left join hm.Accounts a on c.CustomerID=a.CustomerID left join hm.Transactions t on a.AccountID=t.AccountID) as SQ where TransactionID is null

--Calculate the total balance of accounts with no recorded transactions.
select Customerid , CustomerName, TotalBalance from (select c.CustomerID , concat(c.firstname, ' ', c.lastname) as CustomerName,SUM(a.Balance) as TotalBalance from hm.Customers c 
left join hm.Accounts a on c.CustomerID=a.CustomerID left join hm.Transactions t on a.AccountID=t.AccountID where TransactionID is null group by c.CustomerID  , c.FirstName ,c.LastName ) as SQ

--Retrieve transactions for accounts with the lowest balance.
select * from hm.transactions t where t.accountid in (select a.accountid from hm.accounts a where a.balance = (select min(balance) from hm.accounts))

--Identify customers who have accounts of multiple types.
select c.CustomerID,concat(c.firstname, ' ', c.lastname) as CustomerName from hm.customers c 
where c.CustomerID in (select a.CustomerID from hm.accounts a group by a.CustomerID having count(distinct a.account_type) > 1)

--Calculate the percentage of each account type out of the total number of accounts.
select a.Account_type ,count(*)*100.0/(select count(*)from hm.Accounts) as Percentage from hm.Accounts a group by a.account_type

--Retrieve all transactions for a customer with a given customer_id.
select * from hm.transactions where AccountID in (select accountid from hm.accounts where customerid = 5)

--Calculate the total balance for each account type, including a subquery within the SELECT clause.
select a.Account_type ,(select sum(balance) from hm.Accounts where account_type = a.account_type) as Total_balance from (select distinct account_type from hm.Accounts) as a




