SET IDENTITY_INSERT [CarDealerWarehouse].[dbo].[den_Employee] ON;
INSERT INTO [CarDealerWarehouse].[dbo].[den_Employee]
		([Emp_Id]
		,[Emp_PESEL]
		,[Emp_FirstName]
		,[Emp_LastName]
		,[Emp_EmploymentDate]
		,[Adr_City]
		,[Adr_Street]
		,[Adr_BuildingNumber]
		,[Adr_ApartmentNumber]
		,[Adr_Country])
SELECT	 [Emp_Id]
		,[Emp_PESEL]
		,[Emp_FirstName]
		,[Emp_LastName]
		,[Emp_EmploymentDate]
		,[Adr_City]
		,[Adr_Street]
		,[Adr_BuildingNumber]
		,[Adr_ApartmentNumber]
		,[Adr_Country]
FROM		[CarDealer].[dbo].[Employee]
INNER JOIN	[CarDealer].[dbo].[Address]		ON [CarDealer].[dbo].[Address].[Adr_Id] = [CarDealer].[dbo].[Employee].[Adr_Id]
SET IDENTITY_INSERT [CarDealerWarehouse].[dbo].[den_Employee] OFF;
GO

SET IDENTITY_INSERT [CarDealerWarehouse].[dbo].[den_Client] ON;
INSERT INTO [CarDealerWarehouse].[dbo].[den_Client]
		([Cli_Id]
		,[Cli_SerialNumberIDCard]
		,[Cli_FirstName]
		,[Cli_LastName]
		,[Adr_City]
		,[Adr_Street]
		,[Adr_BuildingNumber]
		,[Adr_ApartmentNumber]
		,[Adr_Country])
 
SELECT   [Cli_Id]
		,[Cli_SerialNumberIDCard]
		,[Cli_FirstName]
		,[Cli_LastName]
		,[Adr_City]
		,[Adr_Street] 
		,[Adr_BuildingNumber] 
		,[Adr_ApartmentNumber] 
		,[Adr_Country]
FROM		[CarDealer].[dbo].[Client]	
INNER JOIN	[CarDealer].[dbo].[Address] ON [CarDealer].[dbo].[Address].[Adr_Id] = [CarDealer].[dbo].[Client].[Adr_Id]
SET IDENTITY_INSERT [CarDealerWarehouse].[dbo].[den_Client] OFF;
GO

SET IDENTITY_INSERT [CarDealerWarehouse].[HR].[Salary] ON;
INSERT INTO [CarDealerWarehouse].[HR].[Salary]
           ([Sal_Id]
		   ,[Emp_Id]
           ,[Sal_Amount]
           ,[Sal_Type]
           ,[Sal_Date])
SELECT [Sal_Id]
      ,[Emp_Id]
      ,[Sal_Amount]
      ,[Sal_Type]
      ,[Sal_Date]
  FROM [CarDealer].[HR].[Salary]
SET IDENTITY_INSERT [CarDealerWarehouse].[HR].[Salary] OFF;
GO

SET IDENTITY_INSERT [CarDealerWarehouse].[HR].[Paycheck] ON;
INSERT INTO [CarDealerWarehouse].[HR].[Paycheck]
           ([Pay_Id]
		   ,[Emp_Id]
           ,[Pay_Amount]
           ,[Pay_DateFrom]
           ,[Pay_DateTo])
SELECT [Pay_Id]
      ,[Emp_Id]
      ,[Pay_Amount]
      ,[Pay_DateFrom]
      ,[Pay_DateTo]
FROM [CarDealer].[HR].[Paycheck]
SET IDENTITY_INSERT [CarDealerWarehouse].[HR].[Paycheck] OFF;
GO

INSERT INTO [CarDealerWarehouse].[HR].[EmployeeTeam]
           ([Emp_Id]
           ,[Tem_Name])
SELECT [Emp_Id]
      ,[Tem_Name]
FROM [CarDealer].[HR].[EmployeeTeam]
GO

INSERT INTO [CarDealerWarehouse].[HR].[EmployeePosition]
           ([Emp_Id]
           ,[Pos_Position]
           ,[Eps_DateFrom]
           ,[Eps_DateTo])
SELECT [Emp_Id]
      ,[Pos_Position]
      ,[Eps_DateFrom]
      ,[Eps_DateTo]
FROM [CarDealer].[HR].[EmployeePosition]
GO

USE [CarDealerWarehouse]
GO
SET IDENTITY_INSERT [CarDealerWarehouse].[dbo].[den_Order] ON;
INSERT INTO [dbo].[den_Order]
           ([Ord_Id]
		   ,[Emp_Id]
           ,[Cli_Id]
           ,[Ord_Price]
           ,[Ord_OrderDate]
           ,[Ord_DateOfReceipt]
           ,[Ord_IsCompleted]
           ,[Ord_IsPaid]
           ,[Ord_VIN]
           ,[Bra_FullName]
           ,[Bra_Country]
           ,[Mod_Code]
           ,[Mod_Name]
           ,[Mod_FuelType]
           ,[Mod_EngineKW]
           ,[Mod_Year]
           ,[Mod_DriveType]
           ,[Mod_BodyType]
           ,[Mod_DoorsNumber]
           ,[Pri_Price]
           ,[Pri_DateFrom]
           ,[Pri_DateTo])
SELECT [Ord_Id]
	  ,[Emp_Id]
	  ,[Cli_Id]
      ,[Ord_Price]
      ,[Ord_OrderDate]
      ,[Ord_DateOfReceipt]
      ,[Ord_IsCompleted]
      ,[Ord_IsPaid]
      ,[Ord_VIN]
	  ,[Bra_FullName]
      ,[Bra_Country]
	  ,[Mod_Code]
      ,[Mod_Name]
      ,[Mod_FuelType]
      ,[Mod_EngineKW]
      ,[Mod_Year]
      ,[Mod_DriveType]
      ,[Mod_BodyType]
      ,[Mod_DoorsNumber]
	  ,[Pri_Price]
      ,[Pri_DateFrom]
      ,[Pri_DateTo]
FROM		[CarDealer].[dbo].[Order]
INNER JOIN	[CarDealer].[dbo].[Model]		ON [CarDealer].[dbo].[Model].[Mod_Id]		= [CarDealer].[dbo].[Order].[Mod_Id]
INNER JOIN  [CarDealer].[dbo].[Brand]		ON [CarDealer].[dbo].[Brand].[Bra_Id]		= [CarDealer].[dbo].[Model].[Bra_Id]
INNER JOIN  [CarDealer].[dbo].[PriceList]	ON [CarDealer].[dbo].[PriceList].[Mod_Id]	= [CarDealer].[dbo].[Model].[Mod_Id]
WHERE [CarDealer].[dbo].[PriceList].[Pri_DateTo]   > [CarDealer].[dbo].[Order].[Ord_DateOfReceipt]
  AND [CarDealer].[dbo].[PriceList].[Pri_DateFrom] <= [CarDealer].[dbo].[Order].[Ord_DateOfReceipt]
SET IDENTITY_INSERT [CarDealerWarehouse].[dbo].[den_Order] OFF;
GO

SET IDENTITY_INSERT [CarDealerWarehouse].[Service].[den_OrderHistory] ON;
INSERT INTO [CarDealerWarehouse].[Service].[den_OrderHistory]
           ([Orh_Id]
		   ,[Sor_Id]
		   ,[Emp_Id]
           ,[Sta_Name]
           ,[Orh_Date]
           ,[Orh_Description]
           ,[Sor_Price]
           ,[Sor_VIN]
           ,[Ser_Name]
           ,[Ser_ShortName])
SELECT [Orh_Id]
      ,[CarDealer].[Service].[Order].[Sor_Id]
      ,[Emp_Id]
      ,[Sta_Name]
      ,[Orh_Date]
      ,[Orh_Description]
	  ,[Sor_Price]
      ,[Sor_VIN]
	  ,[Ser_Name]
      ,[Ser_ShortName]
FROM [CarDealer].[Service].[OrderHistory]
INNER JOIN [CarDealer].[Service].[Order]	ON [CarDealer].[Service].[Order].[Sor_Id]   = [CarDealer].[Service].[OrderHistory].[Sor_Id]
INNER JOIN [CarDealer].[Service].[Service]	ON [CarDealer].[Service].[Service].[Ser_Id] = [CarDealer].[Service].[Order].[Ser_Id]
SET IDENTITY_INSERT [CarDealerWarehouse].[Service].[den_OrderHistory] OFF;
GO