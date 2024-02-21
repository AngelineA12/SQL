create database lab3;
use lab3;
/*Create two tables*/
CREATE TABLE  Customers(CustomerID INT PRIMARY KEY,
CustomerName VARCHAR(255),
ContactNo VARCHAR(255),Country VARCHAR(255));
/*DESC CUSTOMERS
DESC ORDERS*/ 
CREATE TABLE Orders( OrderID INT PRIMARY KEY, OrderDate DATE, CustomerID INT,
FOREIGN KEY(CustomerID)REFERENCES Customers(CustomerID));
INSERT INTO Customers VALUES(101,'Blessy','9698445675','Sureanipakkam');
INSERT INTO Customers VALUES(102,'Angeline','7851691566','Suryavakkam');
INSERT INTO Customers VALUES(103,'Aan','6896565865','Abbasnagaram');
INSERT INTO Customers VALUES(104,' Karina','7986545675','Suttuvakkam');
SELECT * from Customers;
INSERT INTO Orders VALUES(201,'2023-08-04',101);
INSERT INTO Orders VALUES(202,'2023-06-12',101);
INSERT INTO Orders VALUES(203,'2023-02-06',101);
INSERT INTO Orders VALUES(204,'2023-09-09',101);
SELECT * FROM Orders;

/*JOIN OPERATIONS*/
SELECT * FROM Customers JOIN Orders
ON Orders.CustomerID = Customers.CustomerID;

/*Nested Subquery*/
SELECT * FROM Customers WHERE
CustomerID IN (SELECT CustomerID FROM Orders);

SELECT * FROM Customers WHERE
EXISTS (SELECT CustomerID FROM Orders
WHERE Orders.OrderID = Customers.CustomerID);

CREATE TABLE Employee (eID INT NOT NULL, eName VARCHAR(255), eSalary INT, dID INT PRIMARY KEY);

CREATE TABLE Department(dID INT PRIMARY KEY NOT NULL, dName VARCHAR(255), dLocation VARCHAR(255),
FOREIGN KEY(dID) REFERENCES Employee(dID));

INSERT INTO Employee VALUES(101,'Blessy',23000,201);
INSERT INTO Employee VALUES(102,'Angeline',25000,202);
INSERT INTO Employee VALUES(103,'Aan',23500,203);
INSERT INTO Employee VALUES(102,'Karina',24000,204);
SELECT * FROM Employee;

INSERT INTO Department VALUES(201,'Computer Science','Canada');
INSERT INTO Department VALUES(202,'Mathematics','Switzerland');
INSERT INTO Department VALUES(203,'Statistics','Germany');
INSERT INTO Department VALUES(204,'English','Italy');

SELECT eName FROM Employee
WHERE dID = (SELECT dID FROM Department WHERE dLocation = 'Switzerland');

CREATE TABLE Products(productID INT NOT NULL PRIMARY KEY, 
product_name VARCHAR(255), list_price INT, Description VARCHAR(255), 
standard_cost INT, categoryID INT);
INSERT INTO Products VALUES(1001,'Book', 250, 'MANY', 40,1);
INSERT INTO Products VALUES(1002,'Bag', 256450, 'FEW', 14340,2);
INSERT INTO Products VALUES(1003,'Shoe', 25650, 'MANY', 450,3);
INSERT INTO Products VALUES(1004,'Socks', 2150, 'MANY', 80,4);
SELECT * FROM Products;

SELECT 
MAX(list_price)
FROM 
Products;

SELECT
productID, product_name,list_price
FROM Products WHERE list_price > ( SELECT AVG(list_price) FROM Products)
ORDER BY product_name;

CREATE TABLE order_item(order_id INT NOT NULL, order_value INT , Quantity INT, unit_price INT);
INSERT INTO order_item VALUES(201,78,200,30);
INSERT INTO order_item VALUES(202,






