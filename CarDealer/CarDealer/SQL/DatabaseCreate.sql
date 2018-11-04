IF DB_ID('CarDealer') IS NULL CREATE DATABASE CarDealer	
GO

USE CarDealer
GO

DROP TABLE IF EXISTS [dbo].[Order]
DROP TABLE IF EXISTS [dbo].[PriceList]
DROP TABLE IF EXISTS [dbo].[Model]
DROP TABLE IF EXISTS [dbo].[Brand]
DROP TABLE IF EXISTS [dbo].[Client]
DROP TABLE IF EXISTS [dbo].[Employee]
DROP TABLE IF EXISTS [dbo].[Address]
GO

CREATE TABLE [dbo].[Address]
(
	Adr_Id				int					NOT NULL IDENTITY(1, 1),
	Adr_Street			nvarchar(100)		NOT NULL,
	Adr_BuildingNumber	nvarchar(5)			NOT NULL,
	Adr_ApartmentNumber tinyint				NOT NULL,
	Adr_City			nvarchar(100)		NOT NULL,
	Adr_Country			nvarchar(50)		NOT NULL

	CONSTRAINT PK_Address	PRIMARY KEY (Add_id)
);
GO

CREATE TABLE [dbo].[Employee]
(
	Emp_Id			int					NOT NULL IDENTITY(1, 1),
	Adr_Id			int					NOT NULL,
	Emp_PESEL		nchar(11)			NOT NULL,
	Emp_FirstName	nvarchar(50)		NOT NULL,
	Emp_LastName	nvarchar(50)		NOT NULL,

	CONSTRAINT PK_Employee			PRIMARY KEY (Emp_Id),
	CONSTRAINT FK_Employee_Address	FOREIGN KEY (Adr_ID) REFERENCES Address (Adr_Id),
	CONSTRAINT UQ_Employee_PESEL	UNIQUE		(Emp_PESEL)
);
GO

CREATE TABLE [dbo].[Client]
(
	Cli_Id					int					NOT NULL IDENTITY(1, 1),
	Adr_Id					int					NOT NULL,
	Cli_SerialNumberIDCard	nchar(9)			NOT NULL,
	Cli_FirstName			nvarchar(50)		NOT NULL,
	Cli_LastName			nvarchar(50)		NOT NULL,

	CONSTRAINT PK_Client					PRIMARY KEY (Cli_Id),
	CONSTRAINT FK_Client_Address			FOREIGN KEY (Adr_Id) REFERENCES Address (Adr_Id),
	CONSTRAINT UQ_Client_SerialNumberIDCard UNIQUE		(Cli_SerialNumberIDCard)
);
GO

CREATE TABLE [dbo].[Brand]
(
	Bra_Id			int					NOT NULL IDENTITY(1, 1),
	Bra_Code		nvarchar(20)		NOT NULL,
	Bra_FullName	nvarchar(50)		NOT NULL,
	Bra_Country		nvarchar(30)		NOT NULL,

	CONSTRAINT PK_Brand			PRIMARY KEY (Bra_Id),
	CONSTRAINT UQ_Brand_Code	UNIQUE		(Bra_Code)
);
GO

CREATE TABLE [dbo].[Model]
(
	Mod_Id			int					NOT NULL IDENTITY(1, 1),
	Bra_Id			int					NOT NULL DEFAULT -1,
	Mod_Code		nchar(10)			NOT NULL,
	Mod_Name		nvarchar(50)		NOT NULL,
	Mod_FuelType	nvarchar(20)		NOT NULL,
	Mod_EngineKW	smallint			NOT NULL,
	Mod_Year		smallint			NOT NULL,
	Mod_DriveType	nchar(3)			NOT NULL,
	Mod_BodyType	nvarchar(20)		NOT NULL,
	Mod_SeatsNumber tinyint				NOT NULL DEFAULT 0,
	
	CONSTRAINT PK_Model			PRIMARY KEY (Mod_Id),
	CONSTRAINT FK_Model_Brand	FOREIGN KEY (Bra_Id)	REFERENCES Brand (Bra_Id) ON DELETE SET DEFAULT,
	CONSTRAINT UQ_Model_Code	UNIQUE		(Mod_Code)
);
GO

CREATE TABLE [dbo].[PriceList]
(
	Pri_Id			int					NOT NULL IDENTITY(1, 1),
	Mod_Id			int					NOT NULL DEFAULT -1,
	Pri_Price		decimal(12,2)		NOT NULL,
	Pri_DateFrom	date				NOT NULL,
	Pri_DateTo		date				NULL,

	CONSTRAINT PK_PriceList			PRIMARY KEY (Pri_Id),
	CONSTRAINT FK_PriceList_Model	FOREIGN KEY (Mod_Id) REFERENCES Model (Mod_Id) ON DELETE SET DEFAULT
);
GO

CREATE TABLE [dbo].[Order]
(
	Ord_Id				int					NOT NULL IDENTITY(1, 1),
	Mod_Id				int					NOT NULL DEFAULT -1,
	Emp_Id				int					NOT NULL DEFAULT -1,
	Cli_Id				int					NOT NULL DEFAULT -1,
	Ord_Price			decimal(12, 2)		NOT NULL,
	Ord_OrderDate		datetime			NOT NULL,
	Ord_DateOfReceipt	datetime			NULL,
	Ord_IsCompleted		bit					NOT NULL DEFAULT 0,
	Ord_IsPaid			bit					NOT NULL DEFAULT 0,

	CONSTRAINT PK_Orde				PRIMARY KEY (Ord_Id),
	CONSTRAINT FK_Order_Model		FOREIGN KEY (Mod_Id)		REFERENCES Model (Mod_Id) ON DELETE SET DEFAULT,
	CONSTRAINT FK_Order_Client		FOREIGN KEY (Cli_Id)		REFERENCES Client (Cli_Id) ON DELETE SET DEFAULT,
	CONSTRAINT FK_Order_Employee	FOREIGN KEY (Emp_Id)		REFERENCES Employee (Emp_Id) ON DELETE SET DEFAULT,
	CONSTRAINT CH_Price				CHECK		(Ord_Price > 0)
)
