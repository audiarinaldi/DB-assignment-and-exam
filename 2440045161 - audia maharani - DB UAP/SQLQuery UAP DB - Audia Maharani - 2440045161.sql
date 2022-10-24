use planet_tire
go

-- 1.
SELECT
	CustomerId,
	CustomerName,
	CustomerPhone
	CustomerEmail
FROM MsCustomer 
WHERE CustomerName LIKE '%Filip%'

-- 2. 
SELECT
	s.StaffId,
	StaffName,
	StaffPhone,
	StaffEmail
FROM MsStaff s
JOIN SalesHeader sh ON s.StaffId = sh.StaffId
WHERE DATENAME(WEEKDAY, sh.SalesDate) LIKE 'Monday'

-- 3.
SELECT
	RIGHT(tt.TypeId, 3) AS TypeId,
	TypeName,
	TypeDurability,
	[Total Stock] = SUM(Stock)
FROM MsTire t
JOIN MsTireType tt ON t.TypeId = tt.TypeId
WHERE TypeName LIKE 'Off Road'
GROUP BY tt.TypeId, TypeName, TypeDurability

--4.
SELECT
	tt.TypeId,
	TypeName,
	MAX(Quantity) AS [Highest Tire Sold],
	SUM(Stock) AS [Total Stock]
FROM MsTireType tt
JOIN MsTire mt ON tt.TypeId = mt.TypeId
JOIN SalesDetail sd ON mt.TireId = sd.TireId
WHERE TypeName LIKE 'Off Road'
GROUP BY tt.TypeId, TypeName

UNION
SELECT
	tt.TypeId,
	TypeName,
	MAX(Quantity) AS [Highest Tire Sold],
	SUM(Stock) AS [Total Stock]
FROM MsTireType tt
JOIN MsTire mt ON tt.TypeId = mt.TypeId
JOIN SalesDetail sd ON mt.TireId = sd.TireId
GROUP BY tt.TypeId, TypeName
HAVING SUM(Stock) > 2000
ORDER BY [Total Stock] DESC

-- 5. 
SELECT 
	tt.TypeId,
	UPPER(TypeName) AS TypeName,
	TireName,
	CONVERT(VARCHAR, DateCreated, 107) AS DateCreated,
	Stock,
	Quantity
FROM MsTireType tt
JOIN MsTire mt ON tt.TypeId = mt.TypeId
JOIN SalesDetail sd ON mt.TireId = sd.TireId
WHERE TireName IN ('ICESTONE', 'TIRELLI', 'DEVELOP TIRES') AND Quantity > 4

-- 6.
SELECT 
	sh.SalesId,
	CONVERT(VARCHAR, SalesDate, 107) AS [SalesDate],
	TireName,
	TypeName,
	CAST(Quantity AS VARCHAR) + ' Pc(s)' AS [Quantity]
FROM SalesHeader sh
JOIN SalesDetail sd ON sh.SalesId = sd.SalesId
JOIN MsTire mt ON sd.TireId = mt.TireId
JOIN MsTireType tt ON mt.TypeId = tt.TypeId, 
	(
	SELECT AVG(TypeDurability) AS [VALUE]
	FROM MsTireType
	) X
WHERE TypeDurability > X.VALUE AND YEAR(SalesDate) = '2020'

-- 7. 
CREATE VIEW StaffSalesRecap AS
SELECT 
	sh.StaffId, 
	sh.SalesId, 
	StaffName, 
	StaffEmail,
	CONVERT(VARCHAR, SalesDate, 103) AS SalesDate
FROM MsStaff s
JOIN SalesHeader sh ON s.StaffId = sh.StaffId
JOIN SalesDetail sd ON sh.SalesId = sd.SalesId
WHERE YEAR(SalesDate) < '2019'

SELECT * FROM StaffSalesRecap

-- 8. 
CREATE VIEW TireSoldSummary AS
SELECT
	REPLACE(tt.TypeId, 'TY', 'Type') AS TypeId,
	TypeName, 
	TypeDurability,
	MAX(Quantity) AS [Highest Sold Quantity],
	SalesDate
FROM MsTireType tt
JOIN MsTire mt ON tt.TypeId = mt.TypeId
JOIN SalesDetail sd ON mt.TireId = sd.TireId
JOIN SalesHeader sh ON sd.SalesId = sh.SalesId
WHERE MONTH(SalesDate) = '08' AND TypeDurability > 70
GROUP BY tt.TypeId, TypeName, SalesDate, TypeDurability

SELECT * FROM TireSoldSummary

-- 9.
ALTER TABLE MsTireType
ADD TypeMaterial VARCHAR(50)

ALTER TABLE MsTireType
ADD CONSTRAINT CheckTypeMaterial
CHECK(TypeMaterial = 'Natural Rubber' OR TypeMaterial = 'Synthetic Rubber')

SELECT * FROM MsTireType

-- 10.
BEGIN TRAN
UPDATE MsStaff
SET StaffSalary = StaffSalary + 1000000
FROM MsStaff s
JOIN SalesHeader sh ON s.StaffId = sh.StaffId
JOIN SalesDetail sd ON sh.SalesId = sd.SalesId
WHERE Quantity >= 8 AND StaffSalary < 5000000

SELECT * FROM MsStaff











