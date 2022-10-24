CREATE DATABASE CompShop
GO
USE CompShop

CREATE TABLE MsCustomer (
	CustomerID CHAR(5) PRIMARY KEY CHECK(CustomerID LIKE 'CU[0-9][0-9][0-9]'),
	CustomerName VARCHAR(255) NOT NULL,
	CustomerGender VARCHAR(10) NOT NULL,
	CustomerEmail VARCHAR(100) NOT NULL,
	CustomerPhoneNumber VARCHAR(20) NOT NULL
)

CREATE TABLE MsStaff (
	StaffID CHAR(5) PRIMARY KEY CHECK(StaffID LIKE 'ST[0-9][0-9][0-9]'),
	StaffName VARCHAR(255) NOT NULL,
	StaffGender VARCHAR(10) NOT NULL,
	StaffPhoneNumber VARCHAR(20) NOT NULL,
	StaffSalary INT NOT NULL
)

CREATE TABLE HeaderTransaction (
	TransactionID CHAR(5) PRIMARY KEY CHECK(TransactionID LIKE 'TR[0-9][0-9][0-9]'),
	CustomerID CHAR(5) FOREIGN KEY (CustomerID) REFERENCES MsCustomer(CustomerID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	StaffID CHAR(5) FOREIGN KEY (StaffID) REFERENCES MsStaff(StaffID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	TransactionDate DATE NOT NULL
)

CREATE TABLE MsProductType (
	ProductTypeID CHAR(5) PRIMARY KEY CHECK(ProductTypeID LIKE 'PT[0-9][0-9][0-9]'),
	ProductTypeName VARCHAR(255) NOT NULL
)

CREATE TABLE MsProduct (
	ProductID CHAR(5) PRIMARY KEY CHECK(ProductID LIKE 'PD[0-9][0-9][0-9]'),
	ProductTypeID CHAR(5) FOREIGN KEY (ProductTypeID) REFERENCES MsProductType(ProductTypeID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	ProductName VARCHAR(255) NOT NULL,
	ProductDescription VARCHAR(255) NOT NULL
)

CREATE TABLE DetailTransaction(
	TransactionID CHAR(5) FOREIGN KEY (TransactionID) REFERENCES HeaderTransaction(TransactionID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	ProductID CHAR(5) FOREIGN KEY (ProductID) REFERENCES MsProduct(ProductID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	Quantity INT NOT NULL,	
	PRIMARY KEY(TransactionID, ProductID)	
)

--insert data
INSERT INTO MsCustomer(CustomerID,CustomerName,CustomerGender,CustomerEmail,CustomerPhoneNumber) VALUES
	('CU001','Randall Bishop','Male','Randall@mail.com','08126482619'),
	('CU002','Jessica Collins','Female','Jessica@mail.com','08126484856'),
	('CU003','Cyril Bush','Male','Cyril@mail.com','081264882543'),
	('CU004','Charlie Booth','Male','Charlie@mail.com','08174702619'),
	('CU005','Honey Horton','Female','Honey@mail.com','08126829419');

INSERT INTO MsStaff(StaffID,StaffName,StaffGender,StaffPhoneNumber,StaffSalary) VALUES
	('ST001','Diana Gardner','Female','01247482619','380000'),
	('ST002','Bradley Preston','Male','04823484856','250000'),
	('ST003','Wynne Franklin','Male','08336692543','750000'),
	('ST004','Jackson Fleming','Male','04415702619','990000'),
	('ST005','Andrea Lambert','Female','07846829419','630000');

INSERT INTO MsProductType(ProductTypeID,ProductTypeName) VALUES
	('PT001','Hard Disk'),
	('PT002','Random Access Memory'),
	('PT003','Virtual Graphic Card'),
	('PT004','Processor'),
	('PT005','Motherboard');

INSERT INTO MsProduct(ProductID,ProductTypeID,ProductName,ProductDescription) VALUES
	('PD001','PT003','AMD A10-5800K','A desktop APU based on the Trinity architecture'),
	('PD002','PT004','Asus RoG Strix GeForce RTX 2070','8GB GDDR6 with powerful cooling for higher refresh rates and VR gaming'),
	('PD003','PT004','Intel Core i7-6700K','6th Generation Intel Core i7 Processors'),
	('PD004','PT003','ZOTAC GeForce GTX 1080 Ti AMP Edition','A new flagship gaming graphics card, based on the award-winning NVIDIA Pascal architecture'),
	('PD005','PT005','MSI Z270 SLI Plus','Supports 7th / 6th Gen Intel Core / Pentium / Celeron processors for LGA 1151 socket');

INSERT INTO HeaderTransaction(TransactionID,CustomerID,StaffID,TransactionDate)VALUES
	('TR001','CU003','ST001','2021-01-12'),
	('TR002','CU003','ST002','2021-02-27'),
	('TR003','CU003','ST001','2021-02-21'),
	('TR004','CU004','ST003','2021-03-24'),
	('TR005','CU002','ST001','2021-04-2'),
	('TR006','CU005','ST001','2021-04-22'),
	('TR007','CU002','ST004','2021-05-19'),
	('TR008','CU001','ST001','2021-05-15'),
	('TR009','CU004','ST001','2021-05-11'),
	('TR010','CU001','ST005','2021-05-3');

INSERT INTO DetailTransaction(TransactionID,ProductID,Quantity) VALUES
	('TR001','PD001','8'),
	('TR002','PD001','12'),
	('TR002','PD002','5'),
	('TR002','PD005','10'),
	('TR003','PD004','28'),
	('TR003','PD001','16'),
	('TR004','PD001','22'),
	('TR004','PD004','9'),
	('TR005','PD004','12'),
	('TR006','PD003','2'),
	('TR007','PD003','1'),
	('TR008','PD003','6'),
	('TR009','PD003','5'),
	('TR010','PD001','3'),
	('TR010','PD003','9');

