﻿IF DB_ID('CarDealer') IS NULL CREATE DATABASE CarDealer	
GO

USE CarDealer;
GO

DROP TABLE IF EXISTS [HR].[Paycheck]
DROP TABLE IF EXISTS [HR].[Salary]
DROP TABLE IF EXISTS [HR].[EmployeePosition]
DROP TABLE IF EXISTS [HR].[EmployeeTeam]
DROP TABLE IF EXISTS [HR].[Team]
DROP TABLE IF EXISTS [HR].[Position]
DROP TABLE IF EXISTS [Service].[OrderHistory]
DROP TABLE IF EXISTS [Service].[Salary]
DROP TABLE IF EXISTS [Service].[Status]
DROP TABLE IF EXISTS [Service].[Order]
DROP TABLE IF EXISTS [Service].[Service]
DROP TABLE IF EXISTS [dbo].[Order]
DROP TABLE IF EXISTS [dbo].[PriceList]
DROP TABLE IF EXISTS [dbo].[Model]
DROP TABLE IF EXISTS [dbo].[Brand]
DROP TABLE IF EXISTS [dbo].[Client]
DROP TABLE IF EXISTS [dbo].[Employee]
DROP TABLE IF EXISTS [dbo].[Address]
DROP VIEW IF EXISTS [rapOp].[v_EmployeeOrders]
DROP VIEW IF EXISTS [rapOp].[v_ModelsWithoutOrders]
DROP VIEW IF EXISTS [rapOp].[v_OrdersForBrand]
DROP VIEW IF EXISTS [rapOp].[v_OrdersWithDiscount]
DROP VIEW IF EXISTS [rapOp].[v_CurrentEmployeesSalary]
DROP VIEW IF EXISTS [rapOp].[v_AvarageSalaryPerTeam]
DROP VIEW IF EXISTS [rapOp].[v_TotalSalaryWithBonus]
DROP VIEW IF EXISTS [rapOp].[v_TimesInServicePerModel]
DROP VIEW IF EXISTS [rapOp].[v_ServiceCountsWithAvaragePrice]
DROP VIEW IF EXISTS [rapOp].[v_ModelsWithServiceName]
DROP SCHEMA IF EXISTS [HR]
DROP SCHEMA IF EXISTS [Service]
DROP SCHEMA IF EXISTS [rapOp]
GO

CREATE SCHEMA [HR];
GO
CREATE SCHEMA [Service];
GO
CREATE SCHEMA [rapOp];
GO

CREATE TABLE [dbo].[Address]
(
	Adr_Id				int					NOT NULL IDENTITY(1, 1),
	Adr_Street			nvarchar(100)		NOT NULL,
	Adr_BuildingNumber	nvarchar(5)			NOT NULL,
	Adr_ApartmentNumber tinyint				NULL,
	Adr_City			nvarchar(100)		NOT NULL,
	Adr_Country			nvarchar(50)		NOT NULL

	CONSTRAINT PK_Address	PRIMARY KEY (Adr_id)
);
GO

CREATE TABLE [dbo].[Employee]
(
	Emp_Id				int					NOT NULL IDENTITY(1, 1),
	Adr_Id				int					NOT NULL,
	Emp_PESEL			nchar(11)			NOT NULL,
	Emp_FirstName		nvarchar(50)		NOT NULL,
	Emp_LastName		nvarchar(50)		NOT NULL,
	Emp_EmploymentDate	date				NOT NULL,

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
	Mod_Name		nvarchar(250)		NOT NULL,
	Mod_FuelType	nvarchar(20)		NOT NULL,
	Mod_EngineKW	smallint			NOT NULL,
	Mod_Year		smallint			NOT NULL,
	Mod_DriveType	nvarchar(50)		NOT NULL,
	Mod_BodyType	nvarchar(20)		NOT NULL,
	Mod_DoorsNumber tinyint				NOT NULL DEFAULT 0,
	
	CONSTRAINT PK_Model			PRIMARY KEY (Mod_Id),
	CONSTRAINT FK_Model_Brand	FOREIGN KEY (Bra_Id)	REFERENCES Brand (Bra_Id) ON DELETE SET DEFAULT,
	CONSTRAINT UQ_Model_Code	UNIQUE		(Mod_Code)
);
GO

CREATE TABLE [dbo].[PriceList]
(
	Pri_Id			int					NOT NULL IDENTITY(1, 1),
	Mod_Id			int					NOT NULL DEFAULT -1,
	Pri_Price		money				NOT NULL,
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
	Ord_Price			money				NOT NULL,
	Ord_OrderDate		datetime			NOT NULL,
	Ord_DateOfReceipt	datetime			NULL,
	Ord_IsCompleted		bit					NOT NULL DEFAULT 0,
	Ord_IsPaid			bit					NOT NULL DEFAULT 0,
	Ord_VIN				nchar(17)			NOT NULL DEFAULT SUBSTRING(REPLACE(NEWID(),'-',''),1,17)

	CONSTRAINT PK_Orde				PRIMARY KEY (Ord_Id),
	CONSTRAINT FK_Order_Model		FOREIGN KEY (Mod_Id)		REFERENCES Model (Mod_Id) ON DELETE SET DEFAULT,
	CONSTRAINT FK_Order_Client		FOREIGN KEY (Cli_Id)		REFERENCES Client (Cli_Id) ON DELETE SET DEFAULT,
	CONSTRAINT FK_Order_Employee	FOREIGN KEY (Emp_Id)		REFERENCES Employee (Emp_Id) ON DELETE SET DEFAULT,
	CONSTRAINT UQ_VIN				UNIQUE		(Ord_VIN),
	CONSTRAINT CH_Price				CHECK		(Ord_Price > 0)
);
GO

CREATE TABLE [HR].[Position]
(
	Pos_Position		nvarchar(50)		NOT NULL UNIQUE,

	CONSTRAINT PK_Posiition			PRIMARY KEY (Pos_Position)
);
GO

CREATE TABLE [HR].[Team]
(
	Tem_Name		nvarchar(50)		NOT NULL UNIQUE,

	CONSTRAINT PK_Team		PRIMARY KEY (Tem_Name)
);
GO

CREATE TABLE [HR].[EmployeeTeam]
(
	Emp_Id		int				NOT NULL,
	Tem_Name	nvarchar(50)	NOT NULL,

	CONSTRAINT PK_EmployeeTeam				PRIMARY KEY (Emp_Id, Tem_Name),
	CONSTRAINT FK_EmployeeTeam_Employee		FOREIGN KEY (Emp_Id)			REFERENCES	[dbo].[Employee] (Emp_Id),
	CONSTRAINT FK_EmployeeTeam_Team			FOREIGN KEY (Tem_Name)			REFERENCES	[HR].[Team] (Tem_Name)
);
GO

CREATE TABLE [HR].[EmployeePosition]
(
	Emp_Id			int				NOT NULL,
	Pos_Position	nvarchar(50)	NOT NULL,
	Eps_DateFrom	date			NOT NULL,
	Eps_DateTo		date			NULL,

	CONSTRAINT PK_EmployeePosition			PRIMARY KEY (Emp_Id, Pos_Position),
	CONSTRAINT FK_EmployeePosition_Employee	FOREIGN KEY (Emp_Id)				REFERENCES [dbo].[Employee] (Emp_Id),
	CONSTRAINT FK_EmployeePosition_Position	FOREIGN KEY (Pos_Position)			REFERENCES	[HR].[Position]	(Pos_Position),
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
    CONSTRAINT [FK_Paycheck_Employee] FOREIGN KEY ([Emp_Id]) REFERENCES [dbo].[Employee] ([Emp_Id])
);


CREATE TABLE [HR].[Salary]
(
	Sal_Id			int				NOT NULL	IDENTITY(1, 1),
	Emp_Id			int				NOT NULL,
	Sal_Amount		smallmoney		NOT NULL,
	Sal_Type		nvarchar(6)		NOT NULL,
	Sal_Date		date			NOT NULL

	CONSTRAINT PK_Salary			PRIMARY KEY (Sal_Id),
	CONSTRAINT FK_Salary_Employee	FOREIGN KEY (Emp_Id)	REFERENCES Employee (Emp_Id),
	CONSTRAINT CH_Salary_Type		CHECK (Sal_Type IN ('Premia', 'Pensja'))
);
GO


CREATE TABLE [Service].[Service]
(
	Ser_Id			int				NOT NULL	IDENTITY(1, 1),
	Ser_Name		nvarchar(70)	NOT NULL,
	Ser_ShortName	nvarchar(15)	NOT NULL,
	
	CONSTRAINT PK_Service	PRIMARY KEY (Ser_Id)
);
GO
CREATE TABLE [Service].[Status]
(
	Sta_Name	nvarchar(30) NOT NULL,

	CONSTRAINT PK_Status PRIMARY KEY (Sta_Name)
);
GO

CREATE TABLE [Service].[Order]
(
	Sor_Id		int				NOT NULL	IDENTITY(1, 1),
	Mod_Id		int				NOT NULL,
	Ser_Id		int				NOT NULL,
	Sor_Price	money			NOT NULL,
	Sor_VIN		nchar(17)		NOT NULL,

	
	CONSTRAINT PK_SerOrder				PRIMARY KEY (Sor_Id),
	CONSTRAINT FK_SerOrder_Model		FOREIGN KEY (Mod_Id)	REFERENCES [dbo].[Model] (Mod_Id),
	CONSTRAINT FK_SerOrder_Service		FOREIGN KEY (Ser_Id)	REFERENCES [Service].[Service] (Ser_Id)
);
GO

CREATE TABLE [Service].[OrderHistory]
(
	Orh_Id			int				NOT NULL	IDENTITY(1, 1),
	Sor_Id			int				NOT NULL,
	Emp_Id			int				NOT NULL,
	Sta_Name		nvarchar(30)	NOT NULL,
	Orh_Date		datetime		NOT NULL	DEFAULT GETDATE(),
	Orh_Description	nvarchar(250)	NULL,

	CONSTRAINT PK_OrderHistory				PRIMARY KEY (Orh_Id),
	CONSTRAINT FK_OrderHistory_SerOrder		FOREIGN KEY (Sor_Id)	REFERENCES [Service].[Order] (Sor_Id),
	CONSTRAINT FK_OrderHistory_Employee		FOREIGN KEY	(Emp_Id)	REFERENCES [dbo].[Employee]	(Emp_Id),
	CONSTRAINT FK_OrderHistory_SerStatus	FOREIGN KEY (Sta_Name)	REFERENCES [Service].[Status] (Sta_Name),
);
GO

CREATE VIEW [rapOp].[v_ModelsWithoutOrders] AS
	SELECT
		mol.*
	FROM 
		[dbo].[Model] AS mol WITH (NOLOCK)
	LEFT JOIN 
		[dbo].[Order] AS ord ON ord.Mod_Id = mol.Mod_Id
	WHERE 
		ord.Ord_Id IS NULL;
GO

CREATE VIEW [rapOp].[v_OrdersWithDiscount] AS
	SELECT 
		ord.*, 
		((prl.Pri_Price - ord.Ord_Price) / prl.Pri_Price) AS [Discount]
	FROM 
		[dbo].[Order] AS ord WITH (NOLOCK)
	INNER JOIN 
		[dbo].[PriceList] AS prl ON prl.Mod_Id = ord.Mod_Id
	WHERE 
			ord.Ord_OrderDate > prl.Pri_DateFrom
		AND ord.Ord_OrderDate < prl.Pri_DateTo
GO

CREATE VIEW [rapOp].[v_OrdersForBrand] AS 
	SELECT 
		bra.Bra_FullName, 
		COUNT(ord.Ord_Id) AS [Orders], 
		SUM(ord.Ord_Price) AS [OrderSum]
	FROM 
		[dbo].[Brand] AS bra WITH (NOLOCK)
	LEFT JOIN 
		[dbo].[Model] AS mol ON mol.Bra_Id = bra.Bra_Id
	LEFT JOIN 
		[dbo].[Order] AS ord ON ord.Mod_Id = mol.Mod_Id
	GROUP BY 
		bra.Bra_FullName;
GO

CREATE VIEW [rapOp].[v_EmployeeOrders] AS
	SELECT 
		emp.Emp_FirstName, Emp_LastName, 
		COUNT(ord.Ord_Id) AS [Orders], 
		SUM(ord.Ord_Price) AS [OrderSum]
	FROM 
		[dbo].[Employee] AS emp WITH (NOLOCK)
	LEFT JOIN 
		[dbo].[Order] AS ord ON ord.Emp_Id = emp.Emp_Id
	GROUP BY 
		emp.Emp_Id, emp.Emp_FirstName, emp.Emp_LastName
GO

CREATE VIEW [rapOp].[v_CurrentEmployeesSalary] AS
	SELECT 
		e.Emp_FirstName,
		e.Emp_LastName,
		p.Pay_Amount
	FROM
		[HR].[Paycheck] AS p WITH (NOLOCK)
	INNER JOIN 
		[dbo].[Employee] AS e ON e.Emp_Id = p.Emp_Id 
	WHERE p.Pay_DateTo IS NULL
GO

CREATE VIEW [rapOp].[v_AvarageSalaryPerTeam] AS
	SELECT 
		ep.Pos_Position,
		AVG(p.Pay_Amount) AS AvarageSalary
	FROM
		[HR].[EmployeePosition] AS ep WITH (NOLOCK)
	INNER JOIN 
		[HR].Paycheck AS p ON p.Emp_Id = ep.Emp_Id
	WHERE
		ep.Eps_DateTo IS NULL
	GROUP BY 
		ep.Pos_Position
GO

CREATE VIEW [rapOp].[v_TotalSalaryWithBonus] AS
	SELECT 
		e.Emp_FirstName,
		e.Emp_LastName,
		SUM(s.Sal_Amount) AS Total,
		SUM(case when s.Sal_Type = 'Premia' THEN s.Sal_Amount END) AS Bonus
		
	FROM
		[HR].[Salary] AS s WITH (NOLOCK)
	INNER JOIN
		[dbo].[Employee] AS e ON e.Emp_Id = s.Emp_Id
	GROUP BY
		e.Emp_FirstName, e.Emp_LastName
GO

CREATE VIEW [rapOp].[v_TimesInServicePerModel] AS
	SELECT 
		m.Bra_Id,
		m.Mod_Name,
		COUNT(o.Ser_Id) AS Times
	FROM
		[Service].[Order] AS o WITH (NOLOCK)
	RIGHT JOIN
		[dbo].[Model] AS m ON m.Mod_Id = o.Mod_Id
	GROUP BY
		m.Bra_Id, m.Mod_Name
GO

CREATE VIEW [rapOp].[v_ServiceCountsWithAvaragePrice] AS
	SELECT 
		s.Ser_Name,
		COUNT(o.Sor_Id) AS [Count],
		AVG(o.Sor_Price) AS [AvaragePrice]
	FROM
		[Service].[Service] AS s WITH (NOLOCK)
	LEFT JOIN
		[Service].[Order] AS o ON o.Ser_Id = s.Ser_Id
	GROUP BY
		s.Ser_Name
GO

CREATE VIEW [rapOp].[v_ModelsWithServiceName] AS
	SELECT 
		m.Bra_Id,
		m.Mod_Name,
		s.Ser_Name
	FROM
		[Service].[OrderHistory] AS oh WITH (NOLOCK)
	INNER JOIN
		[Service].[Order] AS o ON o.Sor_Id = oh.Sor_Id
	INNER JOIN 
		[dbo].[Model] AS m ON m.Mod_Id = o.Mod_Id
	INNER JOIN
		[Service].[Service] as s ON s.Ser_Id = o.Ser_Id
