use master
go
create database planet_tire
go
use planet_tire
go
CREATE TABLE MsCustomer(
	CustomerId CHAR(5) PRIMARY KEY CHECK(CustomerId LIKE 'CU[0-9][0-9][0-9]'),
	CustomerName VARCHAR(30) NOT NULL,
	CustomerPhone VARCHAR(20) NOT NULL,
	CustomerEmail VARCHAR(255) NOT NULL,
	CustomerAddress VARCHAR(255) NOT NULL,
	CustomerDOB DATE NOT NULL,
	CustomerGender VARCHAR(6) NOT NULL CHECK(CustomerGender IN ('Male', 'Female'))
)
select * from MsCustomer
insert into MsCustomer values
('CU001', 'Stefa Kittiman', '+351-821-854-8478', 'skittiman0@free.fr', '12 Vernon Plaza', '2018-08-01', 'Female'),
('CU002', 'Sydel Sysland', '+54-772-109-5193', 'ssysland1@telegraph.co.uk', '3 Reinke Avenue', '2006-07-21', 'Male'),
('CU003', 'Milo Filipowicz', '+7-890-562-0474', 'mfilipowicz2@imgur.com', '008 Summit Road', '2010-08-12', 'Female'),
('CU004', 'Waring Gallelli', '+62-984-331-1171', 'wgallelli3@cornell.edu', '25850 Melody Plaza', '1987-10-07','Female'),
('CU005', 'Stevy McKissack', '+7-582-619-1245', 'smckissack4@seattletimes.com', '2 Darwin Drive', '2019-04-08', 'Female'),
('CU006', 'Shena Shoebrook', '+351-656-472-7927', 'sshoebrook5@sitemeter.com', '4 Farwell Hill', '1997-02-04', 'Female'),
('CU007', 'Rakel McKune', '+86-494-986-7662', 'rmckune6@shareasale.com', '01611 Dixon Terrace', '2017-03-16', 'Male'),
('CU008', 'Tamarra Praton', '+375-590-293-6640', 'tpraton7@google.com.br', '7937 Continental Alley', '1990-10-27', 'Female'),
('CU009', 'Dulce Albrecht', '+353-649-626-5190', 'dalbrecht8@webnode.com', '8963 8th Drive', '1982-09-13', 'Male'),
('CU010', 'Rodger Ireland', '+506-869-535-2716', 'rireland9@themeforest.net', '9467 Colorado Junction', '1997-05-02', 'Female')

CREATE TABLE MsStaff(
	StaffId CHAR(5) PRIMARY KEY CHECK(StaffId LIKE 'ST[0-9][0-9][0-9]'),
	StaffName VARCHAR(30) NOT NULL,
	StaffPhone VARCHAR(20) NOT NULL,
	StaffEmail VARCHAR(255) NOT NULL,
	StaffAddress VARCHAR(255) NOT NULL,
	StaffDOB DATE NOT NULL,
	StaffGender VARCHAR(6) NOT NULL CHECK(StaffGender IN ('Male', 'Female')),
	StaffSalary INTEGER NOT NULL
)

select * from MsStaff
insert into MsStaff values
('ST001', 'Collen Pleass', '+43-406-195-3371', 'cpleass0@jigsy.com', '0762 Thackeray Place', '1991-10-17', 'Female', 6025991),
('ST002', 'Dallis Macklam', '+62-444-307-0847', 'dmacklam1@nifty.com', '1191 Gina Park', '2010-01-19', 'Male', 5723640),
('ST003', 'Joceline Bourdice', '+86-207-771-6963', 'jbourdice2@themeforest.net', '453 Gale Circle', '2009-10-19', 'Female', 8902374),
('ST004', 'Shurlock Lyburn', '+62-219-546-2481', 'slyburn3@mashable.com', '1 Mesta Alley', '1999-01-25', 'Male', 4638434),
('ST005', 'Maurizia Harlock', '+972-572-676-6589', 'mharlock4@cnbc.com', '4082 Northview Center', '2001-01-16', 'Female', 4730244),
('ST006', 'Phyllida Zavattiero', '+237-338-947-9477', 'pzavattiero5@comcast.net', '7 Vahlen Hill', '1996-02-27', 'Female', 8406868),
('ST007', 'Katerine Robun', '+46-443-292-0735', 'krobun6@home.pl', '0 Hayes Circle', '1990-05-22', 'Female', 7263148),
('ST008', 'Ara Dmitrichenko', '+30-487-469-6893', 'admitrichenko7@flickr.com', '97140 Sommers Park', '1996-05-26', 'Male', 6578793),
('ST009', 'Sarge Linford', '+86-708-657-8226', 'slinford8@bluehost.com', '6256 Magdeline Crossing', '2015-11-21', 'Female', 9661378),
('ST010', 'Thain Bosanko', '+55-683-636-1273', 'tbosanko9@berkeley.edu', '7090 Merrick Street', '1990-08-07', 'Female', 4505948)

CREATE TABLE MsTireType(
	TypeId CHAR(5) PRIMARY KEY CHECK(TypeId LIKE 'TY[0-9][0-9][0-9]'),
	TypeName VARCHAR(255) NOT NULL CHECK(TypeName IN ('Off Road', 'All Terrain', 'All Season', 'Winter', 'Summer')),
	TypeDurability INTEGER NOT NULL CHECK(TypeDurability BETWEEN 50 AND 100)
)

select * from MsTireType
insert into MsTireType values
('TY001', 'Off Road', 86),
('TY002', 'All Terrain', 94),
('TY003', 'All Season', 93),
('TY004', 'Winter', 90),
('TY005', 'Summer', 77)

CREATE TABLE MsTire(
	TireId CHAR(5) PRIMARY KEY CHECK(TireId LIKE 'TI[0-9][0-9][0-9]'),
	TypeId CHAR(5) FOREIGN KEY REFERENCES MsTireType(TypeId) ON UPDATE CASCADE ON DELETE CASCADE,
	TireName VARCHAR(255) NOT NULL,
	TirePrice INTEGER NOT NULL,
	DateCreated DATE NOT NULL,
	Stock INTEGER NOT NULL
)

select * from MsTire
insert into MsTire values
('TI001', 'TY001', 'BFNICERICH', 82752603, '3/6/2020', 461),
('TI002', 'TY002', 'BRIDGEIRON', 94437360, '5/23/2015', 894),
('TI003', 'TY004', 'SUPERROYAL', 26170082, '12/1/2019', 948),
('TI004', 'TY002', 'DEVELOP TIRES', 59711080, '7/1/2019', 488),
('TI005', 'TY003', 'ICESTONE', 9551803, '11/10/2018', 407),
('TI006', 'TY005', 'UNCOMMON TIRE', 96311629, '4/4/2019', 419),
('TI007', 'TY002', 'GOODMONTH', 71440716, '2/10/2017', 406),
('TI008', 'TY001', 'HANCOC', 89763450, '7/15/2018', 233),
('TI009', 'TY003', 'MICHAELIN', 43348266, '7/14/2020', 241),
('TI010', 'TY001', 'TIRELLI', 67699167, '3/4/2018', 367)

CREATE TABLE SalesHeader(
	SalesId CHAR(5) PRIMARY KEY CHECK(SalesId LIKE 'SA[0-9][0-9][0-9]'),
	StaffId CHAR(5) FOREIGN KEY REFERENCES MsStaff(StaffId) ON UPDATE CASCADE ON DELETE CASCADE,
	CustomerId CHAR(5) FOREIGN KEY REFERENCES MsCustomer(CustomerId) ON UPDATE CASCADE ON DELETE CASCADE,
	SalesDate DATE NOT NULL
)

select * from SalesHeader
insert into SalesHeader values
('SA001', 'ST006', 'CU001', '1/12/2021'),
('SA002', 'ST007', 'CU005', '1/12/2017'),
('SA003', 'ST005', 'CU002', '7/28/2016'),
('SA004', 'ST008', 'CU005', '11/12/2020'),
('SA005', 'ST007', 'CU003', '8/1/2019'),
('SA006', 'ST004', 'CU004', '5/29/2017'),
('SA007', 'ST003', 'CU007', '11/25/2016'),
('SA008', 'ST007', 'CU005', '1/20/2018'),
('SA009', 'ST006', 'CU006', '3/21/2020'),
('SA010', 'ST007', 'CU010', '6/8/2016'),
('SA011', 'ST009', 'CU005', '11/22/2015'),
('SA012', 'ST003', 'CU008', '12/16/2015'),
('SA013', 'ST010', 'CU009', '11/24/2016'),
('SA014', 'ST007', 'CU008', '4/12/2021'),
('SA015', 'ST001', 'CU010', '8/23/2017')

CREATE TABLE SalesDetail(
	SalesId CHAR(5) FOREIGN KEY REFERENCES SalesHeader(SalesId) ON UPDATE CASCADE ON DELETE CASCADE,
	TireId CHAR(5) FOREIGN KEY REFERENCES MsTire(TireId) ON UPDATE CASCADE ON DELETE CASCADE,
	Quantity INTEGER NOT NULL CHECK(Quantity > 0),
	PRIMARY KEY (SalesId, TireId)
)

select * from SalesDetail
insert into SalesDetail values
('SA014', 'TI008', 8),
('SA012', 'TI005', 5),
('SA015', 'TI002', 2),
('SA010', 'TI003', 3),
('SA002', 'TI004', 4),
('SA003', 'TI005', 5),
('SA001', 'TI010', 11),
('SA011', 'TI004', 4),
('SA008', 'TI005', 5),
('SA004', 'TI010', 6),
('SA005', 'TI007', 9),
('SA007', 'TI005', 8),
('SA003', 'TI002', 8),
('SA009', 'TI003', 2),
('SA006', 'TI004', 5),
('SA015', 'TI005', 5),
('SA010', 'TI010', 4),
('SA009', 'TI004', 7),
('SA001', 'TI005', 5),
('SA002', 'TI010', 1),
('SA007', 'TI004', 8),
('SA003', 'TI008', 1),
('SA006', 'TI006', 9),
('SA013', 'TI008', 10),
('SA011', 'TI009', 1)
