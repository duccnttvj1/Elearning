USE qlct;
SELECT * FROM qlct.architect;
SELECT * FROM qlct.building;
SELECT * FROM qlct.contractor;

DELIMITER $$
CREATE PROCEDURE getAllMaleArchitect()
BEGIN
	SELECT * FROM qlct.architect
	WHERE sex = 1;
END $$
DELIMITER ;

CALL getAllMaleArchitect();

-- tạo 1 thủ tục lấy toàn bộ thông tin về các building được thiết kế
-- bởi các kiến trúc sư nữ (0)
-- (architect, design, building)
SELECT b.* 
FROM design d JOIN building b ON b.id = d.building_id
			JOIN architect a ON d.architect_id = a.id 
WHERE a.sex=0;

