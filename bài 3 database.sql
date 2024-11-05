USE qlct;

SELECT * FROM architect;

SELECT `name`, `sex` FROM architect;

SELECT `birthday` FROM architect;

SELECT `name`,`birthday`
 FROM architect
ORDER BY `birthday` ASC;

SELECT * FROM building
WHERE `name` BETWEEN 'a' AND 'z'
ORDER BY `cost` ASC