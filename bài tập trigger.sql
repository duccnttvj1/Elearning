create schema  InventoryManagement;

create table products(
	productID int primary key auto_increment,
    productName varchar(50),
    quantity int
);

create table inventoryChanges(
	changeID int primary key auto_increment,
    productID int,
    oldQuantity int,
    newQuantity int,
    changeDate datetime,
    foreign key inventoryChanges(productID) references products(productID)
);

-- bài 1
delimiter $$
create trigger AfterProductUpdate
after update
on products
for each row
begin 
	insert into inventoryChanges(productID,oldQuantity,newQuantity,changeDate)
    values (old.productID, old.quantity, new.quantity,'2024-11-28');
end$$
delimiter ;

drop trigger AfterProductUpdate;

insert into products(productName,quantity)
    values ('abc1', 10),
    ('abc2',200);
update products 
set quantity  = 100
where productID = 1;

-- bài 2
delimiter $$
create trigger BeforeProductDelete 
before delete
on products
for each row
begin
	declare quantity_limit int default 0;
	SELECT quantity into quantity_limit
    from products;
	if quantity_limit > 10 
    then signal sqlstate '45000' set message_text = 'quantity > 10';
    end if;
end$$
delimiter ;

drop trigger BeforeProductDelete ;
-- bài 3
alter table products 
add LastUpdated datetime;

delimiter $$
create trigger AfterProductUpdateSetDate
before update
on products
for each row
begin
    set new.LastUpdated = now();
end$$
delimiter ;

drop trigger AfterProductUpdateSetDate;
update products
set quantity = 310
where productID =2;

-- bai4
create table productSummary(
id int primary key auto_increment,
totalQuantity int
);
insert into productSummary(totalQuantity)
values (710);

delimiter $$
create trigger  AfterProductUpdateSummary
after update
on products
for each row
begin
	declare totalQuantity int default 0;
	select SUM(quantity) into totalQuantity
    from products;
    
    insert into productSummary(`totalQuantity`)
    value(totalQuantity);
end$$
delimiter ;
 drop trigger AfterProductUpdateSummary;
update products
set quantity = 400
where productID =2;

-- bai 5
create table InventoryChangeHistory(
	historyID int primary key auto_increment,
    productID int,
    oldQuantity int,
	newQuantity int,
    changeType enum('increase','decrease'),
    changeDate datetime,
    foreign key InventoryChangeHistory(productID) references products(productID)
);

delimiter $$
create trigger AfterProductUpdateHistory
after update
on products
for each row
begin    
    insert into InventoryChangeHistory(productID,oldQuantity,newQuantity,changeType,changeDate)
    value(old.productID,old.quantity,new.quantity,'increase','2024-11-28');
end$$
delimiter ;

-- bài 6
CREATE TABLE ProductRestock (
    restockID INT AUTO_INCREMENT PRIMARY KEY,
    productID INT NOT NULL,
    restockDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
    status ENUM('PENDING', 'COMPLETED') DEFAULT 'PENDING',
    FOREIGN KEY (productID) REFERENCES Products(productID)
);

delimiter $$
create trigger AfterProductUpdateRestock
after update
on products
for each row
begin
    if new.quantity < 10 
    then insert into ProductRestock(productID)
    value(old.productID);
    end if;
end$$
delimiter ;

drop trigger AfterProductUpdateRestock;
update products
set quantity = 8
where productID =3;

