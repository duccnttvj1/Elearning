USE shopee;
-- Bài 3
-- Liệt kê tất cả các thông tin về sản phẩm (products).
SELECT * from products;
-- Tìm tất cả các đơn hàng (orders) có tổng giá trị (totalPrice) lớn hơn 500,000.
SELECT * FROM orders 
WHERE totalPrice >500.000;
-- Liệt kê tên và địa chỉ của tất cả các cửa hàng (stores).
SELECT storeName, addressStore
FROM stores;
-- Tìm tất cả người dùng (users) có địa chỉ email 
-- kết thúc bằng '@gmail.com'.
SELECT * FROM users
WHERE email LIKE '%@gmail.com';
-- Hiển thị tất cả các đánh giá (reviews) với
--  mức đánh giá (rate) bằng 5.
SELECT * FROM reviews
WHERE rate =5;
-- Liệt kê tất cả các sản phẩm có số lượng (quantity) dưới 10.
SELECT * FROM products
WHERE quantity < 10;
-- Tìm tất cả các sản phẩm thuộc danh mục categoryId = 1.
SELECT * FROM categories
WHERE categoryId = 1;
-- Đếm số lượng người dùng (users) có trong hệ thống.
SELECT COUNT(userID) 
FROM users;
-- Tính tổng giá trị của tất cả các đơn hàng (orders).
SELECT SUM(totalPrice)
FROM orders;
-- Tìm sản phẩm có giá cao nhất (price).
SELECT * FROM products
HAVING price >= ALL (
SELECT MAX(price) FROM products
);
-- Liệt kê tất cả các cửa hàng đang hoạt động (statusStore = 1).
SELECT * FROM stores
WHERE statusStore = 1;
-- Đếm số lượng sản phẩm theo từng danh mục (categories).
SELECT COUNT(productID) AS 'so luong san pham', categoryId
FROM products
GROUP BY categoryId;
-- Tìm tất cả các sản phẩm mà chưa từng có đánh giá.
SELECT p.* 
FROM reviews r RIGHT JOIN products p ON r.productId = p.productId;
-- Hiển thị tổng số lượng hàng đã bán (quantityOrder) của từng sản phẩm.
SELECT SUM(quantityOrder)
FROM order_details
GROUP BY productId;
-- Tìm các người dùng (users) chưa đặt bất kỳ đơn hàng nào.
SELECT * FROM users u LEFT JOIN orders o ON u.userID = o.userId;
-- Hiển thị tên cửa hàng và tổng số đơn hàng được thực hiện tại từng cửa hàng.
SELECT s.storeName, SUM(o.orderID)
FROM stores s JOIN orders o ON s.storeId = o.storeId
GROUP BY s.storeId;
-- Hiển thị thông tin của sản phẩm, kèm số lượng hình ảnh liên quan.
SELECT p.* ,i.imageUrl 
FROM products p JOIN images i ON p.productID = i.productId;

-- Hiển thị các sản phẩm kèm số lượng đánh giá và đánh giá trung bình.
SELECT p.*, COUNT(r.productID) AS 'so luong danh gia', AVG(r.rate) AS 'danh gia trung binh'
FROM products p JOIN reviews r ON p.productId = r.productId
GROUP BY r.productId;
-- Tìm người dùng có số lượng đánh giá nhiều nhất.
SELECT u.* , COUNT(r.reviewId) reviewCount
FROM users u JOIN reviews r ON  u.userId = r.userId
GROUP BY userId
ORDER BY reviewCount DESC
LiMIT 1;

-- Hiển thị top 3 sản phẩm bán chạy nhất (dựa trên số lượng đã bán).
SELECT p.*, COUNT(od.orderDetailId) soLuongSP
FROM products p JOIN order_details od ON p.productId = od.productId
GROUP BY productId
ORDER BY soLuongSP DESC
LIMIT 3;
-- Tìm sản phẩm bán chạy nhất tại cửa hàng có storeId = 'S001'.
SELECT p.*
FROM products p JOIN stores s ON p.storeId = s.storeId
WHERE p.storeId LIKE '%S001%'
HAVING quantitySold >=(
SELECT MAX(quantitySold) FROM products
);
-- Hiển thị danh sách tất cả các sản phẩm có giá trị tồn kho lớn hơn 1 triệu (giá * số lượng).
SELECT *, quantity*price
FROM products 
HAVING quantity*price >1000000;

-- Tìm cửa hàng có tổng doanh thu cao nhất.
SELECT s.* 
FROM stores s JOIN products p ON s.storeId = p.storeId
WHERE s.storeId = (
SELECT storeId FROM products
GROUP BY p.storeId
HAVING SUM(quantitySold) >= ALL(
SELECT SUM(quantitySold) FROM products
GROUP BY storeId
)
);

SELECT s.*, SUM(p.quantitySold) tongdoanhthu
FROM stores s JOIN products p ON s.storeId = p.storeId
GROUP BY p.storeID
ORDER BY tongdoanhthu DESC
LIMIT 1;

-- Hiển thị danh sách người dùng và tổng số tiền họ đã chi tiêu.
SELECT u.*, SUM(o.totalPrice) tongsotienchitieu
FROM users u JOIN orders o ON u.userID = o.userId
GROUP BY o.userID;
-- Tìm đơn hàng có tổng giá trị cao nhất và liệt kê thông tin chi tiết.
SELECT o.*, od.*
FROM orders o JOIN order_details od ON o.orderId = od.orderId
WHERE totalPrice = (
SELECT MAX(totalPrice)
FROM orders
);
-- Tính số lượng sản phẩm trung bình được bán ra trong mỗi đơn hàng.
SELECT orderID, AVG(quantityOrder)
FROM order_details
GROUP BY orderID;
-- Hiển thị tên sản phẩm và số lần sản phẩm đó được thêm vào giỏ hàng.
SELECT p.productName, COUNT(c.productID)
FROM carts c JOIN products p On c.productId = p.productId
GROUP BY c.productId;
-- Tìm tất cả các sản phẩm đã bán nhưng không còn tồn kho trong kho hàng.
SELECT * 
FROM products
WHERE quantitySold > 0 AND quantity =0;
-- Tìm các đơn hàng được thực hiện bởi người dùng có email là duong@gmail.com'.
SELECT * 
FROM orders o JOIN users u ON o.userId = u.userId
WHERE u.email LIKE '%duong@gmail.com';
-- Hiển thị danh sách các cửa hàng kèm theo tổng số lượng sản phẩm mà họ sở hữu.
SELECT s.*, SUM(p.quantity) tongSoLuongSP
FROM stores s JOIN products p ON s.storeID = p.storeID
GROUP BY storeId;

-- Bài 4
-- Tạo view (Bảng ảo) để hiển thị dữ liệu theo các yêu cầu sau
-- View hiển thị tên sản phẩm (productName) và giá (price) từ bảng products với giá trị giá (price) 
-- lớn hơn 500,000 có tên là expensive_products
CREATE VIEW expensive_products AS
SELECT productName, price
FROM products
WHERE price > 500.000;
-- Truy vấn dữ liệu từ view vừa tạo expensive_products
SELECT *
FROM expensive_products;
-- Làm thế nào để cập nhật giá trị của view? Ví dụ, cập nhật giá (price) thành 600,000 
-- cho sản phẩm có tên Product A trong view expensive_products.
UPDATE expensive_products
SET price = 600
WHERE productName LIKE '%PPF%';
-- Làm thế nào để xóa view expensive_products?
DROP VIEW expensive_products;
--  Tạo một view hiển thị tên sản phẩm (productName), tên danh mục (categoryName) bằng cách kết hợp bảng products và categories.
CREATE VIEW san_pham_Of_danh_muc AS
SELECT p.productName, ca.categoryName
FROM products p JOIN categories ca ON p.categoryId = ca.categoryId;

-- Exercise 05
-- Làm thế nào để tạo một index trên cột productName của bảng products?
CREATE INDEX `productName` ON products(productName);
-- Hiển thị danh sách các index trong cơ sở dữ liệu?
SHOW INDEX FROM shopee.products;
-- Trình bày cách xóa index idx_productName đã tạo trước đó?
DROP INDEX productName ON products;
-- Tạo một procedure tên getProductByPrice để lấy danh sách sản phẩm với giá lớn hơn một giá trị đầu vào (priceInput)?
DELIMITER $$
CREATE PROCEDURE getProductByPrice(IN priceInput INT)
BEGIN
	SELECT * FROM products
	WHERE price > priceInput;
END$$
DELIMITER ;

-- Làm thế nào để gọi procedure getProductByPrice với đầu vào là 500000?
CALL getProductByPrice(500000);
-- Tạo một procedure getOrderDetails trả về thông tin chi tiết đơn hàng với đầu vào là orderId?
DELIMITER $$
CREATE PROCEDURE getOrderDetails(IN orderID_Input VARCHAR(255))
BEGIN 
	SELECT od.* 
    FROM order_details od JOIN orders o ON od.orderId = o.orderId
    WHERE od.orderID = orderID_Input;
END $$
DELIMITER ;

CALL getOrderDetails('e9c869b7-4c6b-4873-9877-29d2f09cc72d');
-- Làm thế nào để xóa procedure getOrderDetails?
DROP PROCEDURE getOrderDetails;
-- Tạo một procedure tên addNewProduct để thêm mới một sản phẩm vào bảng products.
-- Các tham số gồm productName, price, description, và quantity.
DELIMITER $$
CREATE PROCEDURE addNewProduct(
    IN productName VARCHAR(255),
    IN price INT,
    IN description LONGTEXT,
    IN quantity INT
)
BEGIN
    INSERT INTO products (
        productId, productName, price, description, quantity, 
        storeId, imageProduct, categoryId
    )
    VALUES (
        UUID(), productName, price, description, quantity, '1c930d6e-e5f1-4d01-93e4-e1f2b9825ea6', 'default_image', 1
    );
END $$
DELIMITER ;
CALL addNewProduct('Laptop Dell', 1200, 'May tinh xach tay Dell cao cap', 50 );
SELECT * FROM products WHERE quantity = 50;
-- Tạo một procedure tên deleteProductById để xóa sản phẩm khỏi bảng products dựa trên tham số productId.
DELIMITER $$
CREATE PROCEDURE deleteProductById(IN productID_IP VARCHAR(255))
BEGIN 
	DELETE FROM products 
    WHERE productId = productId_IP;
END $$
DELIMITER ;

CALL deleteProductById('017257f9-a58e-4f4b-a126-02fec07a65fb');
-- Tạo một procedure tên searchProductByName để tìm kiếm sản phẩm theo tên (tìm kiếm gần đúng) từ bảng products.
DELIMITER $$
CREATE PROCEDURE searchProductByName(IN productNameIP VARCHAR(255))
BEGIN
	SELECT * 
	FROM products
	WHERE productName LIKE CONCAT('%', productNameIP, '%');
END $$
DELIMITER ;

CALL searchProductByName('Áo thun');
-- Tạo một procedure tên filterProductsByPriceRange để lấy danh sách sản phẩm có giá trong khoảng từ minPrice đến maxPrice.
DELIMITER $$
CREATE PROCEDURE filterProductsByPriceRange(IN minPrice INT, In maxPrice INT)
BEGIN
	SELECT * 
	FROM products
	WHERE price > minPrice AND price < maxPrice;
END $$
DELIMITER ;

CALL filterProductsByPriceRange(100,2000);
-- Tạo một procedure tên paginateProducts để phân trang danh sách sản phẩm, với hai tham số pageNumber và pageSize.
DELIMITER $$
CREATE PROCEDURE paginateProducts(IN pageSize INT, IN pageNumber INT)
BEGIN
	DECLARE offset_value INT;
    SET offset_value = pageSize*(pageNumber-1);
	SELECT * FROM products
	LIMIT pageSize
	OFFSET offset_value;
END $$
DELIMITER ;

CALL paginateProducts(2,2);