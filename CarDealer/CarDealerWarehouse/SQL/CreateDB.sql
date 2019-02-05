IF DB_ID('CarDealerWarehouse') IS NULL CREATE DATABASE CarDealerWarehouse	
GO

USE CarDealerWarehouse;
GO

DROP TABLE IF EXISTS [HR].[Paycheck]
DROP TABLE IF EXISTS [HR].[Salary]
DROP TABLE IF EXISTS [HR].[EmployeePosition]
DROP TABLE IF EXISTS [HR].[EmployeeTeam]
DROP TABLE IF EXISTS [Service].[den_OrderHistory]
DROP TABLE IF EXISTS [dbo].[den_Order]
DROP TABLE IF EXISTS [dbo].[PriceList]
DROP TABLE IF EXISTS [dbo].[den_Client]
DROP TABLE IF EXISTS [dbo].[den_Employee]
DROP SCHEMA IF EXISTS [HR]
DROP SCHEMA IF EXISTS [Service]
GO

CREATE SCHEMA [HR];
GO
CREATE SCHEMA [Service];
GO


CREATE TABLE [dbo].[den_Employee]
(
	Emp_Id				int					NOT NULL IDENTITY(1, 1),
	Emp_PESEL			nchar(11)			NOT NULL,
	Emp_FirstName		nvarchar(50)		NOT NULL,
	Emp_LastName		nvarchar(50)		NOT NULL,
	Emp_EmploymentDate	date				NOT NULL,
	Adr_Street			nvarchar(100)		NOT NULL,
	Adr_BuildingNumber	nvarchar(5)			NOT NULL,
	Adr_ApartmentNumber tinyint				NULL,
	Adr_City			nvarchar(100)		NOT NULL,
	Adr_Country			nvarchar(50)		NOT NULL

	CONSTRAINT PK_Employee			PRIMARY KEY (Emp_Id),
	CONSTRAINT UQ_Employee_PESEL	UNIQUE		(Emp_PESEL)
);
GO

CREATE TABLE [dbo].[den_Client]
(
	Cli_Id					int					NOT NULL IDENTITY(1, 1),
	Cli_SerialNumberIDCard	nchar(9)			NOT NULL,
	Cli_FirstName			nvarchar(50)		NOT NULL,
	Cli_LastName			nvarchar(50)		NOT NULL,
	Adr_Street				nvarchar(100)		NOT NULL,
	Adr_BuildingNumber		nvarchar(5)			NOT NULL,
	Adr_ApartmentNumber		tinyint				NULL,
	Adr_City				nvarchar(100)		NOT NULL,
	Adr_Country				nvarchar(50)		NOT NULL

	CONSTRAINT PK_Client					PRIMARY KEY (Cli_Id),
	CONSTRAINT UQ_Client_SerialNumberIDCard UNIQUE		(Cli_SerialNumberIDCard)
);
GO

CREATE TABLE [dbo].[den_Order]
(
	Ord_Id				int					NOT NULL IDENTITY(1, 1),
	Emp_Id				int					NOT NULL DEFAULT -1,
	Cli_Id				int					NOT NULL DEFAULT -1,
	Ord_Price			money				NOT NULL,
	Ord_OrderDate		datetime			NOT NULL,
	Ord_DateOfReceipt	datetime			NULL,
	Ord_IsCompleted		bit					NOT NULL DEFAULT 0,
	Ord_IsPaid			bit					NOT NULL DEFAULT 0,
	Ord_VIN				nchar(17)			NOT NULL DEFAULT SUBSTRING(REPLACE(NEWID(),'-',''),1,17),
	Bra_FullName		nvarchar(50)		NOT NULL,
	Bra_Country			nvarchar(30)		NOT NULL,
	Mod_Code			nchar(10)			NOT NULL,
	Mod_Name			nvarchar(250)		NOT NULL,
	Mod_FuelType		nvarchar(20)		NOT NULL,
	Mod_EngineKW		smallint			NOT NULL,
	Mod_Year			smallint			NOT NULL,
	Mod_DriveType		nvarchar(50)		NOT NULL,
	Mod_BodyType		nvarchar(20)		NOT NULL,
	Mod_DoorsNumber		tinyint				NOT NULL DEFAULT 0,
	Pri_Price			money				NOT NULL,
	Pri_DateFrom		date				NOT NULL,
	Pri_DateTo			date				NULL,

	CONSTRAINT FK_Order_Client		FOREIGN KEY (Cli_Id)		REFERENCES den_Client (Cli_Id) ON DELETE SET DEFAULT,
	CONSTRAINT FK_Order_Employee	FOREIGN KEY (Emp_Id)		REFERENCES den_Employee (Emp_Id) ON DELETE SET DEFAULT,
	CONSTRAINT UQ_VIN				UNIQUE		(Ord_VIN),
	CONSTRAINT CH_Price				CHECK		(Ord_Price > 0)
);
GO

CREATE TABLE [Service].[den_OrderHistory]
(
	Orh_Id			int				NOT NULL	IDENTITY(1, 1),
	Sor_id			int				NOT NULL,
	Emp_Id			int				NOT NULL,
	Sta_Name		nvarchar(30)	NOT NULL,
	Orh_Date		datetime		NOT NULL	DEFAULT GETDATE(),
	Orh_Description	nvarchar(250)	NULL,
	Sor_Price		money			NOT NULL,
	Sor_VIN			nchar(17)		NOT NULL,
	Ser_Name		nvarchar(70)	NOT NULL,
	Ser_ShortName	nvarchar(15)	NOT NULL,

	CONSTRAINT PK_OrderHistory				PRIMARY KEY (Orh_Id),
	CONSTRAINT FK_OrderHistory_Employee		FOREIGN KEY	(Emp_Id)	REFERENCES [dbo].[den_Employee]		(Emp_Id),
	CONSTRAINT FK_OrderHistory_Order		FOREIGN KEY	(Sor_VIN)	REFERENCES [dbo].[den_Order]		(Ord_VIN),
);
GO

CREATE TABLE [HR].[EmployeeTeam]
(
	Emp_Id		int				NOT NULL,
	Tem_Name	nvarchar(50)	NOT NULL,

	CONSTRAINT PK_EmployeeTeam				PRIMARY KEY (Emp_Id, Tem_Name),
	CONSTRAINT FK_EmployeeTeam_Employee		FOREIGN KEY (Emp_Id)			REFERENCES	[dbo].[den_Employee] (Emp_Id),
);
GO

CREATE TABLE [HR].[EmployeePosition]
(
	Emp_Id			int				NOT NULL,
	Pos_Position	nvarchar(50)	NOT NULL,
	Eps_DateFrom	date			NOT NULL,
	Eps_DateTo		date			NULL,

	CONSTRAINT PK_EmployeePosition			PRIMARY KEY (Emp_Id, Pos_Position),
	CONSTRAINT FK_EmployeePosition_Employee	FOREIGN KEY (Emp_Id)				REFERENCES [dbo].[den_Employee] (Emp_Id),
	CONSTRAINT CH_EmployeePosition_DateTo	CHECK (Eps_DateTo > Eps_DateFrom)
);
GO

CREATE TABLE [HR].[Paycheck] (
    [Pay_Id]       INT          NOT NULL	IDENTITY(1, 1),
    [Emp_Id]       INT          NOT NULL,
    [Pay_Amount]   MONEY        NOT NULL,
    [Pay_DateFrom] DATE         NOT NULL,
    [Pay_DateTo]   DATE         NULL,
    CONSTRAINT [PK_Paycheck] PRIMARY KEY CLUSTERED ([Pay_Id] ASC),
    CONSTRAINT [FK_Paycheck_Employee] FOREIGN KEY ([Emp_Id]) REFERENCES [dbo].[den_Employee] ([Emp_Id])
);


CREATE TABLE [HR].[Salary]
(
	Sal_Id			int				NOT NULL	IDENTITY(1, 1),
	Emp_Id			int				NOT NULL,
	Sal_Amount		smallmoney		NOT NULL,
	Sal_Type		nvarchar(6)		NOT NULL,
	Sal_Date		date			NOT NULL

	CONSTRAINT PK_Salary			PRIMARY KEY (Sal_Id),
	CONSTRAINT FK_Salary_Employee	FOREIGN KEY (Emp_Id)	REFERENCES [den_Employee] (Emp_Id),
	CONSTRAINT CH_Salary_Type		CHECK (Sal_Type IN ('Premia', 'Pensja'))
);
GO

CREATE CLUSTERED COLUMNSTORE INDEX cci ON [den_Order]