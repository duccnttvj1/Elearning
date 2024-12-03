USE demo_index;

CREATE TABLE customers (
CustomerID INT AUTO_INCREMENT PRIMARY KEY,
CustomerName VARCHAR (100),
ContactName VARCHAR(100),
Country VARCHAR(50)
);

CREATE TABLE orders (
OrderID INT AUTO_INCREMENT PRIMARY KEY,
CustomerID INT,
OrderDate DATETIME,
TotalAmount DECIMAL(10,2),
FOREIGN KEY(CustomerID) REFERENCES customers(CustomerID)
);

CREATE TABLE products (
ProductID INT AUTO_INCREMENT PRIMARY KEY,
ProducName VARCHAR(100),
Price DECIMAL(10,2)
);

CREATE TABLE orderDetails (
OrderDetailID INT AUTO_INCREMENT PRIMARY KEY,
OrderID INT,
ProductID INT,
Quantity INT,
UnitPrice DECIMAL(10,2),
FOREIGN KEY(OrderID) REFERENCES orders(OrderID),
FOREIGN KEY(ProductID) REFERENCES products(ProductID)
);
-- Hãy tạo một view để hiển thị thông tin đơn hàng
CREATE VIEW `thongtindonhang` AS
SELECT * FROM products;
-- Hãy tạo một view để hiển thị chi tiết đơn hàng
CREATE VIEW `chitietdonhang` AS
SELECT * FROM orderdetails;
-- Hãy tạo chỉ mục cho bảng Orders
CREATE INDEX `OrderDate` ON orders(OrderDate);
-- Hãy tạo chỉ mục cho bảng OrdersDetails
CREATE INDEX `Quantity` ON orderdetails(Quantity);

SHOW INDEX FROM demo_index.orders;
SHOW INDEX FROM demo_index.orderdetails;