USE qlct;

SELECT * FROM architect;

-- Tạo một thủ tục có tên là checkMaleExit 
-- Thủ tục này sẽ kiểm trâ trong bảng architect
-- Nếu tồn tại các architect có giới tính = 1
-- Thì trả về một kết quả "Tồn tại"
-- Nếu không tồn tại thì trả về một kết quả là "Không tồn tại"alter

DELIMITER $$
CREATE PROCEDURE checkMaleExit(OUT exist VARCHAR(20))
BEGIN 
	DECLARE countMale INT DEFAULT 0;
    SELECT COUNT(*) 
    INTO countMale
    FROM architect
    WHERE sex = 1;
    
    IF countMale > 0 THEN 
		SET exist = 'Ton tai';
	ELSE 
		SET exist = 'Khong ton tai';
	END IF;
END $$
DELIMITER ;

CALL checkMaleExit(@i);

SELECT @i;