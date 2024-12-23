--Бардык клиенттердин шаарлары уникалдуу чыксын
SELECT * FROM Customers ORDER BY CustomerName ASC;
--Туулган жылы 1950 жана 1960 - жылдардын арасындагы ишкерлер чыксын
SELECT EmployeeName, BirthYear FROM Employees WHERE BirthYear BETWEEN 1950 AND 1960;
--Франциялык поставщиктердин аттары жана мамлекети чыксын
SELECT SupplierName, Country FROM Suppliers WHERE Country = 'France';
--Олкосу Испаниядан башка, аты “A” дан башталган клиенттердин аты, адресси жана олкосу чыксын
SELECT SupplierName, Country FROM Suppliers WHERE Country = 'France';
--PostalCode бош болгон клиенттер чыксын
SELECT * FROM Customers WHERE PostalCode IS NULL OR PostalCode = '';
--Лондондон болгон клиенттердин биринчи эки клиентин чыгаргыла
SELECT *FROM Customers WHERE City = 'London' LIMIT 2;
--Фамилиясы 4 тамгадан турган ишкерлердин аты жана туулган жылдары чыксын
SELECT EmployeeName, BirthYear FROM Employees WHERE LENGTH(SUBSTRING_INDEX(EmployeeName, ' ', -1)) = 4;
--Ар бир олкодо канчадан поставщик бар экенин чыгаргыла
SELECT Country, COUNT(*) AS SupplierCount FROM Suppliers GROUP BY Country;
--Поставщиктердин саны 1 эле болгон олколорду аты менен сорттоп чыгаргыла
SELECT Country FROM Suppliers GROUP BY Country HAVING COUNT(*) = 1 ORDER BY Country;
--Ар бир категориядагы продуктылардын жалпы суммасын чыгаргыла
SELECT CategoryID, SUM(Price) AS TotalPrice FROM Products GROUP BY CategoryID;
--6 жана 8 категориясындагы продуктылардын эн арзан баасын жана атын чыгаргыла
SELECT ProductName, MIN(Price) AS MinPrice FROM Products WHERE CategoryID IN (6, 8) GROUP BY CategoryID;
--Продуктылар жана алардын поставщиктеринин аттары чыксын(сортировка болсун)
SELECT Products.ProductName, Suppliers.SupplierName FROM Products JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID ORDER BY Products.ProductName;
--Ар бир поставщиктин канчадан продуктысы бар экени кемуу тартибинде сорттолуп чыксын
--Клиенттердин аты CustomerName деп, ага саткан ишкерлердин аты жана алар кандай служба доставки колдонгону тууралуу маалымат чыксын
--Кайсы ишкер канча клиент обслуживайтеткен чыксын
select FirstName , count(CustomerID) from Employees join Orders on Employees.EmployeeID = Orders.EmployeeID group by FirstName;