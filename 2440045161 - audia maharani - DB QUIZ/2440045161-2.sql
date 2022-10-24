USE CompShop

-- 1.
CREATE TABLE MsSfotware (
	SoftwareID CHAR (5) Primary Key CHECK(SoftwareID like 'SW[0-9][0-9][0-9]') ,
	SoftwareName VARCHAR (50) NOT NULL
	SoftwareType VARCHAR (100) NOT NULL CHECK(SoftwareType like 'Application', 'System', 'Programming', 'Driver' )
)

-- 2. 
SELECT * FROM MsStaff
ALTER TABLE MsStaff ADD StaffEmail VARCHAR (50)
ALTER TABLE MsStaff ADD CONSTRAINT bebas CHECK (StaffEmail like '%.com')

-- 3.
SELECT * FROM MsProduct
INSERT INTO MsProduct
VALUES('PD006', 'PT001', 'WD My Passport Ultra', 'Protable drive delivers quick and easy storage for your PC', NULL)

-- 4.
SELECT UPPER(StaffName) AS StaffName, StaffGender, StaffPhoneNumber
FROM MsStaff
WHERE(StaffSalary > '500000')

-- 5. 
SELECT * FROM MsStaff
BEGIN TRAN
UPDATE StaffSalary SET StaffSalary = '100000'
FROM MsStaff s, HeaderTransaction ht, MsCustomer c
WHERE s.StaffID = ht.StaffID AND ht.CustomerID = c.CustomerID AND c.CustomerID LIKE 'CU004'
