--สร้างฐานข้อมูล ชื่อ ร้านค้า
--CREATE database Kokoayaimak
--สร้างตาราง พนักงาน
create table Employees(
Employees    int identity(1,1) Primary Key,
Title        varchar(20),
FirstName    varchar(50) not null,
LastName     varchar(50),
Position     varchar(50),
UserName     varchar(50) unique,
PasswordHash varchar(225) not null,
IsAction     bit not null default 1
)

--เพิ่มข้อมูลรายการ 1
insert into Employees
	(Title, FirstName, LastName,
	Position, UserName, PasswordHash)
Values
('นางสาว','กายนา' ,'สุกหล่อ' ,
'sale  Manager','user1' ,'hashed1' );

--เพิ่มข้อมูลรายการ 2
insert into Employees
	(Title, FirstName, LastName,
	Position, UserName, PasswordHash)
Values
('หรรม','หี' ,'ควย' ,
'sale  Manager','user2' ,'hashed1' );

--ดูข้อมูลที่เพิ่ม Employees
select * from Employees
--แก้ไขการเกด็ฐข้อมูลภาษาไทย ซึ่งแก้ตั้งแต่ก่อนสร้างตาราง
--ต้องลบตารางฐานข้อมูลก่อน แล้วสร้างใหม่
drop table Employees

--
alter database Kokoayaimak
collate thai_CI_AS;

--สร้างตารางหมวดหมู่สินค้า (Categories)
Create Table Categories(
CategoryID INT Identity(1,1) Primary Key,
CategoryName Varchar(50) Not null Unique,
Description varchar(200)
)

--สร้างตารางเพิ่มข้อมูล 5 หมวดหมู่
--เครื่องปรุง เครื่องดื่มเย็น อาหารสำเร็จรูป เครื่องสำอาง บล่าาาๆๆ
insert into Categories(CategoryName) Values ('เครื่องปรุง')
insert into Categories(CategoryName) Values ('เครื่องดื่มเย็น')
insert into Categories(CategoryName) Values ('อาหารสำเร็จรูป')
insert into Categories(CategoryName) Values ('เครื่องสำอาง')
insert into Categories(CategoryName) Values ('เวชภัณท์')
--ดูข้อมูล categories
select * from Categories

--สร้างตารางสินค้าทีมีข้อกำหนดหลายอย่าง โดยเฉพาะ fk 
CREATE TABLE Products (
ProductID VARCHAR(13) PRIMARY KEY,
ProductName VARCHAR(100) NOT NULL,
UnitPrice DECIMAL(10,2) NOT NULL DEFAULT 0,
UnitsInStock INT NOT NULL DEFAULT 0,
CategoryID INT NOT NULL,
Discontinued BIT NOT NULL DEFAULT 0,

CONSTRAINT CK_Products_UnitPrice
	CHECK (UnitPrice >= 0),

CONSTRAINT CK_Products_UnitsInStock
	CHECK (UnitsInStock >= 0),

CONSTRAINT FK_Products_Categories
	FOREIGN KEY (CategoryID)
	REFERENCES Categories (CategoryID)

)

--ทดสอบ probuct 1
INSERT INTO Products
(ProductID, ProductName, UnitPrice, UnitsInStock, CategoryID)
VALUES
('8858757001948', 'โค้ก', 15.00, 290, 1);

--ทดสอบ probuct 2
INSERT INTO Products
(ProductID, ProductName, UnitPrice, UnitsInStock, CategoryID)
VALUES
('8858757001948', 'โค้ก', -15.00, 290, 1);

--สร้างตาราง receipts
CREATE TABLE Receipts (
ReceiptID INT IDENTITY(1,1) PRIMARY KEY,
ReceiptDate DATETIME NOT NULL
	DEFAULT GETDATE(),
EmployeeID INT NOT NULL,
TotalCash DECIMAL (10,2) NOT NULL DEFAULT 0,

CONSTRAINT CK_Receipts_TotalCash
	CHECK (TotalCash >= 0),

CONSTRAINT FK_Receipts_Employees
	FOREIGN KEY (EmployeeID)
	REFERENCES (EmployeeID)
);

CREATE TABLE Details (
    ReceiptID INT NOT NULL,
    ProductID VARCHAR(13) NOT NULL,
    UnitPrice DECIMAL (10,2) NOT NULL,
    Quantity INT NOT NULL,
    CONSTRAINT PK_Details
    PRIMARY KEY (ReceiptID, ProductID),

    CONSTRAINT CK_Details_UnitPrice 
		CHECK (UnitPrice >= 0),

    CONSTRAINT CK_Details_Quantity 
		CHECK (Quantity > 0),

    CONSTRAINT FK_Details_Receipts 
		FOREIGN KEY (ReceiptID)		
		REFERENCES Receipts (ReceiptID),

    CONSTRAINT FK_Details_Products	
		FOREIGN KEY (ProductID) 
		REFERENCES Products (ProductID)
);
