DROP DATABASE IF EXISTS data_digger;
CREATE DATABASE data_digger;
USE data_digger;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    Name        VARCHAR(100) NOT NULL,
    Email       VARCHAR(100) NOT NULL UNIQUE,
    Address     VARCHAR(255)
);

CREATE TABLE Orders (
    OrderID     INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID  INT NOT NULL,
    OrderDate   DATE NOT NULL,
    TotalAmount DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
        ON DELETE CASCADE
);

CREATE TABLE Products (
    ProductID   INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(100) NOT NULL,
    Price       DECIMAL(10,2) NOT NULL,
    Stock       INT NOT NULL DEFAULT 0
);

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID       INT NOT NULL,
    ProductID     INT NOT NULL,
    Quantity      INT NOT NULL,
    SubTotal      DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
        ON DELETE CASCADE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
        ON DELETE CASCADE
);

INSERT INTO Customers (Name, Email, Address) VALUES
('Divyesh', 'divyesh@example.com', '12 MG Road, Surat'),
('Neev',    'neev@example.com',    '45 Park Street, Mumbai'),
('Ved',     'ved@example.com',     '78 Lake View, Pune'),
('Tejas',   'tejas@example.com',   '9 Ring Road, Ahmedabad'),
('Tirth',   'tirth@example.com',   '23 Civil Lines, Delhi');

SELECT * FROM Customers;

UPDATE Customers
SET Address = '15 New Colony, Surat'
WHERE CustomerID = 1;

SELECT * FROM Customers
WHERE Name LIKE 'Divyesh%';

INSERT INTO Orders (CustomerID, OrderDate, TotalAmount) VALUES
(1, '2026-07-05', 2500.00),
(2, '2026-07-10', 1200.50),
(1, '2026-07-15', 800.00),
(3, '2026-07-20', 3200.75),
(4, CURDATE() - INTERVAL 10 DAY, 999.99);

SELECT * FROM Orders
WHERE CustomerID = 1;

UPDATE Orders
SET TotalAmount = 2750.00
WHERE OrderID = 1;

SELECT * FROM Orders
WHERE OrderDate >= CURDATE() - INTERVAL 30 DAY;

SELECT
    MAX(TotalAmount) AS HighestOrder,
    MIN(TotalAmount) AS LowestOrder,
    AVG(TotalAmount) AS AverageOrder
FROM Orders;

INSERT INTO Products (ProductName, Price, Stock) VALUES
('Wireless Mouse',      699.00,  50),
('Bluetooth Headphones',1899.00, 30),
('Laptop Stand',        1299.00,  0),
('USB-C Hub',           1599.00, 15),
('Mechanical Keyboard', 3499.00, 20);

SELECT * FROM Products
ORDER BY Price DESC;

UPDATE Products
SET Price = 749.00
WHERE ProductID = 1;

DELETE FROM Products
WHERE Stock = 0;

SELECT * FROM Products
WHERE Price BETWEEN 500 AND 2000;

SELECT
    (SELECT ProductName FROM Products ORDER BY Price DESC LIMIT 1) AS MostExpensiveProduct,
    MAX(Price) AS HighestPrice,
    (SELECT ProductName FROM Products ORDER BY Price ASC LIMIT 1)  AS CheapestProduct,
    MIN(Price) AS LowestPrice
FROM Products;

INSERT INTO OrderDetails (OrderID, ProductID, Quantity, SubTotal) VALUES
(1, 1, 2, 1498.00),
(1, 2, 1, 1899.00),
(2, 4, 1, 1599.00),
(3, 5, 1, 3499.00),
(4, 1, 3, 2247.00),
(5, 2, 2, 3798.00);

SELECT od.OrderDetailID, od.OrderID, p.ProductName, od.Quantity, od.SubTotal
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
WHERE od.OrderID = 1;

SELECT SUM(TotalAmount) AS TotalRevenue
FROM Orders;

SELECT p.ProductName, SUM(od.Quantity) AS TotalQuantityOrdered
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.ProductID, p.ProductName
ORDER BY TotalQuantityOrdered DESC
LIMIT 3;

SELECT ProductID, COUNT(*) AS TimesSold
FROM OrderDetails
WHERE ProductID = 1
GROUP BY ProductID;
