select * from Employees;
select * from Categories;
select * from Products;
select * from Receipts;
select * from Details;

select * from INFORMATION_SCHEMA.TABLES
where TABLE_TYPE = 'Base table';

exec sp_help 'products';



SELECT top (5)
    ProductID,
    ProductName,
    UnitPrice,
    UnitsInStock
FROM dbo.Products;

Update Products
set UnitPrice = 15
where productName = 'ดินสอ'

Update Products
set UnitPrice= 10, UnitsInStock = 250
where ProductName ='ยางลบ'

--ปรับปรุงจำนวนคงเหลือของดินสอ เพิ่มขึ้น 100 ชิ้น
update products
set UnitsInStock = UnitsInStock+100 
where productName = 'ดินสอ'

update products
set UnitPrice = UnitPrice * 1.05

select * from Products

DELETE FROM dbo.Products
WHERE ProductID = 3;

SELECT
    ProductID,
    ProductName,
    UnitPrice
FROM dbo.Products
WHERE UnitPrice < 20;

select firstname, lastname from Employees
where Position = 'sale manager'

SELECT ProductID 
FROM dbo.Products 
WHERE ProductName = 'ชาเขียว';

SELECT * 
FROM dbo.Products 
WHERE UnitsInStock < 400;

-- 1) AND : ราคา >= 10 และ จำนวนคงเหลือ < 100 (ต้องเป็นจริงทั้งสองเงื่อนไข)
SELECT *
FROM dbo.Products
WHERE UnitPrice >= 10
    AND UnitsInStock < 100;

-- 2) OR : เป็นหมวดหมู่ 2 หรือ หมวดหมู่ 4 (เป็นจริงข้อใดข้อหนึ่งก็ได้)
SELECT *
FROM dbo.Products
WHERE CategoryID = 2
    OR CategoryID = 4;

-- 3) NOT : สินค้าที่ยังไม่เลิกขาย (กลับค่าเงื่อนไข Discontinued = 1)
SELECT *
FROM dbo.Products
WHERE not Discontinued = 1;

-- BETWEEN = กำหนดช่วงราคา 10-20 (รวมค่า 10 และ 20 ด้วย)
SELECT
    ProductID,
    ProductName,
    UnitPrice
FROM dbo.Products
WHERE UnitPrice BETWEEN 10 AND 20;

-- IN = ตรวจสอบว่าค่าตรงกับค่าใดค่าหนึ่งในลิสต์ที่กำหนด
SELECT
    ProductID,
    ProductName,
    CategoryID
FROM dbo.Products
WHERE CategoryID IN (1, 2, 4);

-- LIKE : ค้นหาข้อความที่ขึ้นต้นด้วยคำว่า "น้ำ"
SELECT
    ProductID,
    ProductName
FROM dbo.Products
WHERE ProductName LIKE 'น้ำ%';

-- IS NULL : ค้นหาแถวที่คอลัมน์ LastName ไม่มีค่า (ว่างเปล่า)
SELECT *
FROM dbo.Employees
WHERE LastName LIKE '%คำ';

SELECT *
FROM dbo.Employees
WHERE LastName LIKE '%สม%';

-- LIKE : ค้นหาข้อความที่ขึ้นต้นด้วยคำว่า "น้ำ"
SELECT
    ProductID,
    ProductName
FROM dbo.Products
WHERE ProductName LIKE 'น้ำ%';

-- IS NULL : ค้นหาแถวที่คอลัมน์ LastName ไม่มีค่า (ว่างเปล่า)
SELECT *
FROM dbo.Employees
WHERE LastName LIKE '%คำ';

SELECT *
FROM dbo.Employees
WHERE not LastName is null;

insert into Employees(FirstName,lastname, userName, Password)
values ('หี', 'hee', '123')

insert into Employees(FirstName,lastname ,userName, Password)
values ('ควย','','tad', '56')

select * from Employees
where LastName is null

select Title+FirstName+''+lastname as ชื่อสกุลพนักงาน
from employees

select * from receipts
where ReceiptDate = '2013/02/10' --ตรงตามวัน

select * from receipts
where ReceiptDate < '2013/02/10' --ก่อนวันที่

select * from receipts
where ReceiptDate >= '2013/02/10' --ตั้งแต่.. เป็นต้นไป

select * from receipts
where ReceiptDate between '2013-02-01' and '2013-02-07'

select * from receipts
where year(ReceiptDate) = 2013 -- ปี 2013 ทั้งหมด

select * from receipts
where year(ReceiptDate) = 2013 and month(ReceiptDate)=2 -- ปี 2013 ทั้งหมด

-- ASC : เรียงราคาจากน้อยไปมาก
SELECT
    ProductID,
    ProductName,
    UnitPrice
FROM dbo.Products
ORDER BY UnitPrice ASC;

-- DESC : เรียงราคาจากมากไปน้อย
SELECT 
    ProductID,
    ProductName,
    UnitPrice
FROM dbo.Products
ORDER BY UnitPrice DESC;

select * from Products
order by CategoryID

select top(3)* from Products
order by CategoryID desc

select * from Categories
