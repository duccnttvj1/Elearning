-- tạo bảng
CREATE TABLE Projects (
 ProjectID INT AUTO_INCREMENT PRIMARY KEY ,
 ProjectName VARCHAR(100) NOT NULL,
 StartDate DATE NOT NULL,
 EndDate DATE NOT NULL,
 Budget DECIMAL (10,2) NOT NULL
);

CREATE TABLE Employees(
 EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
 EmployeeName VARCHAR(100) NOT NULL,
 Position VARCHAR(50) NOT NULL,
 HireDate DATE NOT NULL,
 Salary DECIMAL(10,2) NOT NULL
);

CREATE TABLE Tasks(
 TaskID INT AUTO_INCREMENT PRIMARY KEY,
 ProjectID INT,
 TaskName VARCHAR(100) NOT NULL,
 AssignedTo INT,
 StartDate DATE NOT NULL,
 EndDAte DATE NOT NULL,
 Status VARCHAR(50) NOT NULL,
 HoursWorked DECIMAL(5,2) NOT NULL,
 FOREIGN KEY(ProjectID) REFERENCES Projects(ProjectID),
 FOREIGN KEY(AssignedTo) REFERENCES Employees(EmployeeID)
);

-- insert dữ liệu vào bảng projects
INSERT INTO `projects` (`ProjectID`,`ProjectName`,`StartDate`,`EndDate`,`Budget`)
VALUES (1,'quan ly thu vien','2024-1-10','2024-2-28',1000),
       (2,'quan ly benh vien','2024-3-10','2024-4-30',2000),
       (3,'quan ly truong hoc','2024-6-10','2024-9-20',3000);

-- insert dữ liệu vào bảng employees
INSERT INTO `employees` (`EmployeeID`,`EmployeeName`,`Position`,`HireDate`,`Salary`)
VALUES (1,'Nguyen Thu Ha','Dev_be','2018-2-28',50),
       (2,'Nguyen Truong Giang','Dev_fe','2019-3-10',70),
       (3,'Dang Thi Tra Giang','Dev_fe','2020-6-10',30),
       (4,'Pham Quoc Hung','Dev_be','2016-1-10',90),
       (5,'Nguyen Tien Phat','PM','2015-3-10',100);
-- insert dữ liệu vào bảng task
INSERT INTO `tasks` (`TaskID`,`ProjectID`,`TaskName`,`AssignedTo`,`StartDate`,`EndDate`,`Status`,`HoursWorked`)
VALUES (1,1,'Lam chuc nang dang nhap',1,'2024-1-10','2024-1-15','In Progress',8),
       (2,3,'Lam giao dien trang chu',2,'2024-6-10','2024-6-17','Completed',3),
       (3,2,'Lam giao dien cua app quan ly',3,'2024-3-10','2024-3-15','Completed',5),
       (4,1,'Lam chuc nang quan ly thu vien',4,'2024-1-16','2024-1-22','In Progress',10.5),
       (5,2,'Bao cao voi khach hang',5,'2024-4-20','2024-4-30','In Progress',16),
       (6,3,'Lam chuc nang dang nhap',4,'2024-6-10','2024-6-20','Completed',8);

-- update dữ liệu
UPDATE projects 
SET budget = 50000.00
WHERE ProjectID = 2;

UPDATE tasks
SET HoursWorked = 25.50
WHERE TaskID = 4;

-- delete dữ liệu
DELETE FROM tasks
WHERE AssignedTo = 3;
DELETE FROM employees
WHERE EmployeeID = 3;

DELETE FROM tasks;

-- Truy Vấn Nâng Cao và Hàm SQL
-- tổng chi phí của từng dự án là 
 
 SELECT ProjectID, SUM(HoursWorked)*50.00 AS 'Tổng chi phí dự án'
 FROM tasks
 GROUP BY ProjectID;

-- Thống Kê Dự Án
SELECT p.ProjectID,
       p.ProjectName,
       COUNT(CASE WHEN t.Status = 'Completed' THEN 1 END) AS CompletedTasks,
       COUNT(CASE WHEN t.Status = 'In Progress' THEN 1 END) AS InProgressTasks
FROM Projects p
LEFT JOIN Tasks t ON p.ProjectID = t.ProjectID
GROUP BY p.ProjectID;

-- Thống Kê Nhân Viên
SELECT e.EmployeeID,
e.EmployeeName,
COUNT(t.AssignedTO) AS 'số lượng công việc'
FROM employees AS e
LEFT JOIN tasks AS t ON e.EmployeeID = t.AssignedTo
GROUP BY  t.AssignedTo;

-- Tính Lương Trung Bình
SELECT Position, AVG(Salary) AS 'lương'
FROM employees 
GROUP BY Position;