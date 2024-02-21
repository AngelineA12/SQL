use ETL;
-- Create Stores table
CREATE TABLE Stores (
    StoreID INT PRIMARY KEY IDENTITY(1,1),
    StoreName NVARCHAR(255),
    Location NVARCHAR(255)
);

-- Insert sample data into Stores table
INSERT INTO Stores (StoreName, Location) VALUES
    ('Store A', 'City X'),
    ('Store B', 'City Y'),
    ('Store C', 'City Z');

-- Create Products table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    ProductName NVARCHAR(255),
    Category NVARCHAR(50)
);

-- Insert sample data into Products table
INSERT INTO Products (ProductName, Category) VALUES
    ('Laptop', 'Electronics'),
    ('Smartphone', 'Electronics'),
    ('Desk Chair', 'Furniture'),
    ('Coffee Table', 'Furniture'),
    ('Running Shoes', 'Clothing'),
    ('T-shirt', 'Clothing'),
    ('Coffee Maker', 'Appliances');

-- Create Sales table
CREATE TABLE Sales (
    SaleID INT PRIMARY KEY IDENTITY(1,1),
    StoreID INT,
    ProductID INT,
    SaleDate DATE,
    Quantity INT,
    Amount DECIMAL(10, 2),
    FOREIGN KEY (StoreID) REFERENCES Stores(StoreID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Insert sample data into Sales table
INSERT INTO Sales (StoreID, ProductID, SaleDate, Quantity, Amount) VALUES
    (1, 1, '2023-12-01', 10, 12000.00),
    (1, 2, '2023-12-02', 20, 16000.00),
    (2, 3, '2023-12-03', 5, 750.00),
    (2, 4, '2023-12-04', 8, 1600.00),
    (3, 5, '2023-12-05', 15, 1200.00),
    (3, 6, '2023-12-06', 30, 750.00),
    (1, 7, '2023-12-07', 12, 1200.00);

-- Create Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Email NVARCHAR(255)
);

-- Insert sample data into Customers table
INSERT INTO Customers (FirstName, LastName, Email) VALUES
    ('John', 'Doe', 'john.doe@example.com'),
    ('Jane', 'Smith', 'jane.smith@example.com'),
    ('Bob', 'Johnson', 'bob.johnson@example.com');

-- Create Employees table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Position NVARCHAR(255)
);

-- Insert sample data into Employees table
INSERT INTO Employees (FirstName, LastName, Position) VALUES
    ('Alice', 'Williams', 'Manager'),
    ('Charlie', 'Brown', 'Sales Associate'),
    ('Eva', 'Davis', 'Cashier');

-- Create Suppliers table
CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY IDENTITY(1,1),
    SupplierName NVARCHAR(255),
    ContactPerson NVARCHAR(100),
    PhoneNumber NVARCHAR(15)
);

-- Insert sample data into Suppliers table
INSERT INTO Suppliers (SupplierName, ContactPerson, PhoneNumber) VALUES
    ('ElectroTech', 'John Supplier', '+1234567890'),
    ('Furniture World', 'Jane Supplier', '+9876543210'),
    ('FashionHub', 'Bob Supplier', '+1122334455');

-- Create ProductSuppliers table to represent the many-to-many relationship between Products and Suppliers
CREATE TABLE ProductSuppliers (
    ProductID INT,
    SupplierID INT,
    PRIMARY KEY (ProductID, SupplierID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

-- Insert sample data into ProductSuppliers table
INSERT INTO ProductSuppliers (ProductID, SupplierID) VALUES
    (1, 1),
    (2, 1),
    (3, 2),
    (4, 2),
    (5, 3),
    (6, 3),
    (7, 1),
    (7, 2),
    (7, 3);

-- Display the inserted data
SELECT * FROM Stores;
SELECT * FROM Products;
SELECT * FROM Sales;
SELECT * FROM Customers;
SELECT * FROM Employees;
SELECT * FROM Suppliers;
SELECT * FROM ProductSuppliers;

