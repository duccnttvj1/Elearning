USE session5;
-- Hiển thị thông tin công trình có chi phí cao nhất
SELECT MAX(cost)
FROM building;
-- Hiển thị thông tin công trình có chi phí lớn hơn tất cả các công trình được xây dựng ở Cần Thơ
SELECT * FROM building
WHERE cost > ALL(
 SELECT cost FROM building
 WHERE city = 'can tho'
);
-- Hiển thị thông tin công trình có chi phí lớn hơn một trong các công trình được xây dựng ở Cần Thơ
SELECT * FROM building
WHERE cost > ANY (
 SELECT cost FROM building
 WHERE city = 'can tho'
);
-- Hiển thị thông tin công trình chưa có kiến trúc sư thiết kế
SELECT * FROM architect
WHERE id NOT IN (
SELECT architect_id FROM design
);
-- Hiển thị thông tin các kiến trúc sư cùng năm sinh và cùng nơi tốt nghiệp
SELECT a.*
FROM architect a
JOIN (
    SELECT birthday, place
    FROM architect
    GROUP BY birthday, place
    HAVING COUNT(id) > 1
) b ON a.birthday = b.birthday AND a.place = b.place;
-- Exercise 04
-- Hiển thị thù lao trung bình của từng kiến trúc sư
SELECT architect_id, AVG(benefit) FROM design
GROUP BY architect_id;
-- Hiển thị chi phí đầu tư cho các công trình ở mỗi thành phố
SELECT city, AVG(cost) FROM building
GROUP BY city;
-- Tìm các công trình có chi phí trả cho kiến trúc sư lớn hơn 50
SELECT * FROM building
WHERE id IN (
 SELECT building_id FROM design
 WHERE benefit >50
 );
 -- Tìm các thành phố có ít nhất một kiến trúc sư tốt nghiệp
SELECT place FROM architect
WHERE place = ANY (
 SELECT place FROM architect
);
-- Exercise 05
-- Hiển thị tên công trình, tên chủ nhân và tên chủ thầu của công trình đó
SELECT b.name,h.name,c.name
FROM `building` AS b 
	 INNER JOIN `host` AS h ON b.host_id = h.id
	 INNER JOIN `contractor` AS c ON  b.contractor_id = c.id;
-- Hiển thị tên công trình (building), tên kiến trúc sư (architect) và thù lao của kiến trúc sư ở mỗi công trình (design)
SELECT b.name, a.name, d.benefit
FROM design AS d 
     INNER JOIN building AS b ON d.building_id = b.id
     INNER JOIN architect AS a ON d.architect_id = a.id;

-- Hãy cho biết tên và địa chỉ công trình (building) do chủ thầu Công ty xây dựng số 6 thi công (contractor)
SELECT b.name, b.address 
FROM building AS b 
     INNER JOIN contractor AS c ON b.contractor_id = c.id
WHERE c.id = 1;
-- Tìm tên và địa chỉ liên lạc của các chủ thầu (contractor) thi công công trình ở Cần Thơ (building) do kiến trúc sư Lê Kim Dung thiết kế (architect, design)
SELECT c.name, c.address 
FROM building AS b INNER JOIN contractor AS c ON b.contractor_id = c.id
WHERE b.id IN (
SELECT building_id FROM design
WHERE architect_id = 2
);
-- Hãy cho biết nơi tốt nghiệp của các kiến trúc sư (architect) đã thiết kế (design) công trình Khách Sạn Quốc Tế ở Cần Thơ (building)
SELECT a.name 
FROM design AS d INNER JOIN architect AS a ON d.architect_id = a.id
WHERE d.building_id = 1; 
-- Cho biết họ tên, năm sinh, năm vào nghề của các công nhân có chuyên môn hàn hoặc điện (worker) 
-- đã tham gia các công trình (work) mà chủ thầu Lê Văn Sơn (contractor) đã trúng thầu (building)
SELECT wr.name, wr.birthday, wr.year
FROM work AS w 
     INNER JOIN building AS b ON w.building_id = b.id
     INNER JOIN worker AS wr ON w.worker_id = wr.id
WHERE b.id IN (
 SELECT id FROM building
 WHERE contractor_id = 3
);
-- Những công nhân nào (worker) đã bắt đầu tham gia công trình Khách sạn Quốc Tế ở Cần Thơ (building) 
-- trong giai đoạn từ ngày 15/12/1994 đến 31/12/1994 (work) số ngày tương ứng là bao nhiêu
SELECT wr.name, w.date
FROM work AS w 
	 INNER JOIN building AS b ON w.building_id = b.id
     INNER JOIN worker AS wr ON w.worker_id = wr.id
WHERE w.building_id = 1 
AND w.date BETWEEN '1994-12-15' AND '1994-12-31' 
GROUP BY w.worker_id;
-- Cho biết họ tên và năm sinh của các kiến trúc sư đã tốt nghiệp ở TP Hồ Chí Minh (architect) 
-- và đã thiết kế ít nhất một công trình (design) có kinh phí đầu tư trên 400 triệu đồng (building)
SELECT a.name, a.birthday
FROM design AS d 
     INNER JOIN architect AS a ON d.architect_id = a.id
     INNER JOIN building AS b ON d.building_id = b.id
WHERE a.place  = 'tp hcm' 
AND d.building_id IN (
 SELECT id FROM building 
 WHERE cost > 400
);
-- Cho biết tên công trình có kinh phí cao nhất
SELECT name 
FROM building 
WHERE cost = ALL (
SELECT MAX(cost) FROM building
);
-- Cho biết tên các kiến trúc sư (architect) vừa thiết kế các công trình (design) do Phòng dịch vụ sở xây dựng (contractor)
-- thi công vừa thiết kế các công trình do chủ thầu Lê Văn Sơn thi công
SELECT DISTINCT a.name
FROM design AS d 
INNER JOIN architect AS a ON d.architect_id = a.id
INNER JOIN building AS b ON d.building_id = b.id
WHERE d.building_id IN (
SELECT id FROM building 
WHERE contractor_id = 2 OR contractor_id = 3
);
-- Cho biết họ tên các công nhân (worker) có tham gia (work) các công trình ở Cần Thơ (building) 
-- nhưng không có tham gia công trình ở Vĩnh Long
SELECT name
FROM worker
WHERE id IN (
SELECT DISTINCT worker_id 
FROM work AS w INNER JOIN building AS b ON w.building_id = b.id
WHERE b.city = 'can tho'
) AND id NOT IN (
SELECT DISTINCT worker_id 
FROM work AS w INNER JOIN building AS b ON w.building_id = b.id
WHERE b.city = 'vinh long'
);
-- Cho biết tên của các chủ thầu đã thi công các 
-- công trình có kinh phí lớn hơn tất cả các công trình do chủ thầu phòng Dịch vụ Sở xây dựng thi công
SELECT DISTINCT c.name 
FROM building AS b INNER JOIN contractor AS c ON b.contractor_id = c.id
WHERE b.cost > ALL (
SELECT MAX(cost)
FROM building AS b INNER JOIN contractor AS c ON b.contractor_id = c.id
WHERE c.name  = 'phong dich vu so xd'
);
-- Cho biết họ tên các kiến trúc sư có thù lao thiết kế một công trình nào đó dưới giá trị trung bình thù lao thiết kế cho một công trình
SELECT a.name 
FROM design AS d 
INNER JOIN architect AS a ON d.architect_id = a.id
WHERE d.benefit < (
    SELECT AVG(avg_benefit) 
    FROM (
        SELECT AVG(benefit) AS avg_benefit 
        FROM design
        GROUP BY building_id
    ) AS subquery
);
-- Tìm tên và địa chỉ những chủ thầu đã trúng thầu công trình có kinh phí thấp nhất
SELECT c.name, c.address
FROM contractor AS c
WHERE id IN (
SELECT contractor_id FROM building AS b
WHERE b.cost = (SELECT MIN(cost) FROM building)
);
-- Tìm họ tên và chuyên môn của các công nhân (worker) tham gia (work)
-- các công trình do kiến trúc sư Le Thanh Tung thiet ke (architect) (design)
SELECT name, skill
FROM worker 
WHERE id IN (
SELECT worker_id 
FROM work w INNER JOIN building b ON w.building_id = b.id
WHERE b.id IN(
SELECT building_id FROM design d INNER JOIN architect a ON d.architect_id = a.id
WHERE a.id = 1 
)
);
-- Tìm các cặp tên của chủ thầu có trúng thầu các công trình tại cùng một thành phố
SELECT c.name
FROM building b INNER JOIN contractor c ON b.contractor_id = c.id
WHERE b.id IN (
SELECT id
FROM building b JOIN (
SELECT city FROM building
GROUP BY city
HAVING COUNT(id)>1
 ) b2 ON b.city = b2.city
);
-- Tìm tổng kinh phí của tất cả các công trình theo từng chủ thầu
SELECT contractor_id, SUM(cost) 
FROM building 
GROUP BY contractor_id;
-- Cho biết họ tên các kiến trúc sư có tổng thù lao thiết kế các công trình lớn hơn 25 triệu
SELECT name 
FROM architect
WHERE id IN (
SELECT architect_id
FROM design
GROUP BY architect_id
HAVING SUM(benefit) >25
);
-- Cho biết số lượng các kiến trúc sư có tổng thù lao thiết kế các công trình lớn hơn 25 triệu
SELECT COUNT(name) AS 'số lượng các kiến trúc sư có tổng thù lao thiết kế các công trình lớn hơn 25 triệu'
FROM architect
WHERE id IN (
SELECT architect_id
FROM design
GROUP BY architect_id
HAVING SUM(benefit) >25
);
-- Tìm tổng số công nhân đã than gia ở mỗi công trình
SELECT building_id, COUNT(worker_id) 
FROM work 
GROUP BY building_id;
-- Tìm tên và địa chỉ công trình có tổng số công nhân tham gia nhiều nhất
SELECT b.name, b.address
FROM building b 
WHERE id IN (
SELECT building_id 
FROM work
GROUP BY building_id
HAVING COUNT(worker_id) >= ALL (
SELECT COUNT(worker_id) FROM work
GROUP BY building_id
)
);
-- Cho biêt tên các thành phố và kinh phí trung bình cho mỗi công trình của từng thành phố tương ứng
SELECT city, AVG(cost)
FROM building
GROUP BY city;
-- Cho biết họ tên các công nhân có tổng số ngày tham gia vào 
-- các công trình lớn hơn tổng số ngày tham gia của công nhân Nguyễn Hồng Vân
SELECT name 
FROM worker 
WHERE id IN (
SELECT worker_id FROM work 
GROUP BY worker_id
HAVING COUNT(date) > (
SELECT COUNT(date)
FROM work
WHERE worker_id = 6 ) 
);
-- Cho biết tổng số công trình mà mỗi chủ thầu đã thi công tại mỗi thành phố
SELECT b.contractor_id, b.city, COUNT(b.id) AS total_buildings
FROM building b
GROUP BY b.contractor_id, b.city
ORDER BY b.contractor_id, b.city;
-- Cho biết họ tên công nhân có tham gia ở tất cả các công trình
SELECT w.name
FROM worker w
JOIN work wo ON w.id = wo.worker_id
GROUP BY w.id, w.name
HAVING COUNT( wo.building_id) = (
    SELECT COUNT(DISTINCT wo.building_id)
    FROM work wo
);
-- Exercise 06:
CREATE TABLE nhanvien(
 id INT AUTO_INCREMENT PRIMARY KEY,
 name VARCHAR(100) NOT NULL,
 age INT NOT NULL,
 salary DECIMAL(10,2) NOT NULL
);
CREATE TABLE bophan(
 id INT AUTO_INCREMENT PRIMARY KEY,
 name VARCHAR(100) NOT NULL
);
CREATE TABLE positon(
 id_nhanvien INT NOT NULL,
 id_bophan INT NOT NULL,
 FOREIGN KEY (id_nhanvien) REFERENCES nhanvien(id),
 FOREIGN KEY (id_bophan) REFERENCES bophan(id)
);
INSERT INTO positon(`id_nhanvien`,`id_bophan`)
VALUE 	(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8),
(9,9),
(10,6),
(11,5),
(12,2),
(13,3),
(14,2),
(14,3);
INSERT INTO bophan(`id`,`name`)
VALUE 	(1,'ke toan'),
		(2,'nhan su'),
		(3,'cham soc khach hang'),
		(4,'phap ly'),
		(5,'hanh chinh'),
		(6,'le tan'),
		(7,'giam doc dieu hanh'),
        (8,'giam doc cong nghe'),
        (9,'giam doc van hanh');
INSERT INTO bophan(`id`,`name`)
VALUE 	(10,'truyen thong');
INSERT INTO nhanvien(`id`,`name`,`age`,`salary`)
  VALUE (1,'nguyen thi suu',20,50),
		(2,'vi chi anh',25,100),
		(3,'le manh quoc',21,90),
		(4,'vo van chin',27,120),
		(5,'le quyet thang',27,200),
		(6,'nguyen anh thu',20,30),
		(7,'truong minh thai',35,3500),
		(8,'nguyen song do quyen',40,3000);
 INSERT INTO nhanvien(`id`,`name`,`age`,`salary`)
  VALUE (9,'vo van thuong',60,100000);
  INSERT INTO nhanvien(`id`,`name`,`age`,`salary`)
  VALUE (10,'nguyen thi linh',19,30);
INSERT INTO nhanvien(`id`,`name`,`age`,`salary`)
  VALUE (11,'tran manh cuong',29,500),
		(12,'nguyen van minh',31,1000),
		(13,'le thi lung linh',23,10000);
  INSERT INTO nhanvien(`id`,`name`,`age`,`salary`)
  VALUE (14,'nguyen thi linh',19,300);
-- a. 
-- Viết câu lệnh SQL để liệt kê tất cả các nhân viên 
-- trong bộ phận có tên là "Kế toán". Kết quả cần hiển thị mã nhân viên và tên nhân viên.
SELECT nv.id, nv.name 
FROM nhanvien nv JOIN bophan bp ON nv.bophan_id = bp.id
WHERE bp.name = 'ke toan';

-- b.
-- Viết câu lệnh SQL để tìm các nhân viên có mức lương lớn hơn 50,000. 
-- Kết quả trả về cần bao gồm mã nhân viên, tên nhân viên và mức lương.
SELECT id, name, salary
FROM nhanvien
WHERE salary > 50000;
-- c.
-- Viết câu lệnh SQL để hiển thị tất cả các bộ phận và số lượng nhân viên
-- trong từng bộ phận. Kết quả trả về cần bao gồm tên bộ phận và số lượng nhân viên.
SELECT bp.name, COUNT(nv.id) AS 'so luong nhan vien'
FROM nhanvien nv JOIN bophan bp ON nv.bophan_id = bp.id
GROUP BY bp.id;
-- d.
-- Viết câu lệnh SQL để tìm ra các thành viên có mức lương cao nhất 
-- theo từng bộ phận. Kết quả trả về là một danh sách theo bất cứ thứ tự nào. Nếu có nhiều nhân viên bằng lương nhau nhưng cũng là mức lương cao nhất thì hiển thị tất cả những nhân viên đó ra.
SELECT bp.name, nv.name, nv.salary
FROM nhanvien nv INNER JOIN bophan bp ON nv.bophan_id = bp.id
JOIN (
    SELECT bp.id, MAX(salary) AS max_salary
    FROM nhanvien nv INNER JOIN bophan bp ON nv.bophan_id = bp.id
    GROUP BY bp.id
) AS max_salaries
ON nv.bophan_id = max_salaries.id
AND nv.salary = max_salaries.max_salary
ORDER BY bp.id;
-- e.
-- Viết câu lệnh SQL để tìm các bộ phận có tổng mức lương của nhân viên 
-- vượt quá 100,000 (hoặc một mức tùy chọn khác). Kết quả trả về bao gồm 
-- tên bộ phận và tổng mức lương của bộ phận đó.
SELECT bophan_id, SUM(salary)
FROM nhanvien
GROUP BY bophan_id
HAVING SUM(salary) > 1000;
-- f.
-- Viết câu lệnh SQL để liệt kê tất cả các nhân viên làm việc trong hơn 2 bộ phận khác nhau. 
-- Kết quả cần hiển thị mã nhân viên, tên nhân viên và số lượng bộ phận mà họ tham gia.
SELECT nv.id, nv.name, COUNT(p.id_bophan)
FROM positon p JOIN nhanvien nv ON p.id_nhanvien = nv.id
GROUP BY nv.id