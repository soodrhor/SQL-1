

select *,firstName, lastName
from Employees
where year(hiredate) = 1993

select * from products
where UnitPrice between 50 and 100

select * from customers
where CompanyName like 'M%'

select * from Customers

SELECT 
    COUNT(*) AS ProductCount,
    MIN(UnitPrice) AS MinimumPrice,
    MAX(UnitPrice) AS MaximumPrice,
    AVG(UnitPrice) AS AveragePrice
FROM dbo.Products;

SELECT 
    CategoryID,
    COUNT(*) AS ProductCount
FROM dbo.Products
GROUP BY CategoryID;

--ใบเสร็จแต่ละใบ มียอดเงินรวมเท่าไหร่ใด
SELECT 
    ReceiptID,
    SUM(UnitPrice * Quantity) AS ReceiptTotal
FROM dbo.Details
GROUP BY ReceiptID;

--สินค้าแต่ละหมวดหมู่มีจำกัดกี่ชนิด ต้องการเฉพาะหมวดหมู่ที่มี มากกว่า 2 ชนิดสินค้า
SELECT 
    CategoryID,
    COUNT(*) AS ProductCount
FROM dbo.Products
GROUP BY CategoryID
HAVING COUNT(*) >= 2;

--ใบเสร็จแต่ละใบเสร็จ มียอดเงินรวมเท่าใด ต้องการเฉพาะยอดเงินรวมในใบเสร็จ ต่ำกว่า 100 
select ReceiptID, sum(UnitPrice * Quantity) as ยอดเงินรวม
from datails
group by receipID
having sum(UnitPrice * Quantity) <100

--จากตาราง Orders ต้องการรหัสพนักงาน และ จำนวนใบเสร็จที่รับผิดชอบ เฉพาะรายการที่เกิดขึ้นในปี 1997
--เลือกมาเฉพาะรายการที่ส่งสินค้าไปประเทศ USA
SELECT EmployeeID, COUNT(*) AS TotalOrders
FROM Orders
WHERE YEAR(OrderDate) = 1997 AND ShipCountry = 'USA'
GROUP BY EmployeeID
HAVING count(*) >=10