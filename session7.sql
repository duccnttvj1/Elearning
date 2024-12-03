-- Tạo một cơ sở dữ liệu có tên là phenikaaEmployee
-- Tạo một thủ tục có tên autoInsertEmployee
-- Khi gọi thủ tục này ngay lập tức insert 100 employee vào trong bảng employee

-- Biết bảng employee (id, name, gender, email)
-- Thông tin id tăng dần
-- Thông tin name phải là abc +1 đại lượng tăng dần abc-1, abc-, ...
-- thông tin gender bỏ trống
-- Thông tin về emailcx tăng dần abc1@gmail.com, abc2@gmail.com, ...

CREATE SCHEMA phenikaaEmployee;
 USE phenikaaEmployee;
 
 CREATE TABLE employee (
 id INT PRIMARY KEY NOT NULL,
 name VARCHAR(50) default 'abc',
 gender INT DEFAULT NULL,
 email VARCHAR(50) default 'abc' 
 );
 
 INSERT employee(name, email)
 VALUE ('abc', 'abc1@gmail.com');
 
 DELIMITER $$
 create procedure autoInsertEmployee()
 begin
 DECLARE counter INT DEFAULT 0;
 loop_label: loop
	INSERT employee(name, email)
	VALUE (concat(name,cast(counter as char)), concat(email,cast(counter as char),'@gmail.com'));
	set counter = counter + 1 ;
	if counter >= 100 then
		leave loop_label;
	end if;
end loop loop_label;
end $$
delimiter ;

CALL autoInsertEmployee();

-- Viết lại autoInsertEmployee nhưng sử dụng vòng lặp repeat hoặc while 
delimiter $$
create procedure autoInsertEmployee()
begin 
	declare counter int default 1;
	while counter <= 100 do
		insert employee(id,name, email)
		value (counter,concat(name,counter), concat(email,counter,'@gmail.com'));
        set counter = counter +1;
    end while;
end $$
delimiter ;

-- thêm mới 100 bản ghi tiếp theo vào trong bảng employee
delimiter $$
create procedure autoInsertEmployee()
begin 
	declare counter int default 1;
    declare countr int default 0;
    SELECT IFNULL(MAX(id),0) INTO countr FROM employee;
    SET countr = countr+1;
	while counter <= 100 do
		insert employee(id,name, email)
		value (countr,concat(name,countr), concat(email,countr,'@gmail.com'));
         set countr = countr +1;
        set counter = counter +1;
    end while;
end $$
delimiter ;
call autoInsertEmployee();



 