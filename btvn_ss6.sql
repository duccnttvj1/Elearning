CREATE SCHEMA btvn_ss6;
USE btvn_ss6;
CREATE TABLE customers(
	CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL
);
CREATE TABLE products(
	ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Price DECIMAL(10,2)
);
CREATE TABLE orders(
	OrderID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT NOT NULL,
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY(CustomerID) REFERENCES customers(CustomerID)
);
CREATE TABLE promotions(
	PromotionID INT AUTO_INCREMENT PRIMARY KEY,
    PromotionName VARCHAR(100) NOT NULL,
    DiscountPercentage DECIMAL(5,2)
);
CREATE TABLE Sales(
	SaleID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT NOT NULL,
    SaleDate DATE,
    SaleAmount DECIMAL(10,2)
);
DELIMITER $$
CREATE PROCEDURE CalculateMonthlyRevenueAndApplyPromotion(IN monthYear VARCHAR(30), IN revenueThreshold DECIMAL)
BEGIN
	DECLARE totalRevenue DECIMAL(10, 2);
    
	SELECT SUM(s.SaleAmount) INTO totalRevenue
	FROM sales s 
		JOIN orders o ON s.OrderID = o.OrderID
		JOIN customers c ON o.CustomerID = c.CustomerID
    WHERE DATE_FORMAT(s.SaleDate, '%Y-%m') = monthYear;
	IF totalRevenue > revenueThreshold 
    THEN INSERT INTO promotions (`PromotionName`,`DiscountPercentage`) 
		VALUES ('Giam gia vi mua nhieu',10.99);
	END IF;
    
    SELECT c.*, SUM(s.SaleAmount)
    FROM sales s 
		JOIN orders o ON s.OrderID = o.OrderID
		JOIN customers c ON o.CustomerID = c.CustomerID
    WHERE DATE_FORMAT(s.SaleDate, '%Y-%m') = monthYear;
END$$
DELIMITER ;

CALL CalculateMonthlyRevenueAndApplyPromotion('2024-07',5000);