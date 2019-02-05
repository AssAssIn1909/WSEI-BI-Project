CREATE TABLE [dbo].[den_Employee] (
    [Emp_Id]              INT            IDENTITY (1, 1) NOT NULL,
    [Emp_PESEL]           NCHAR (11)     NOT NULL,
    [Emp_FirstName]       NVARCHAR (50)  NOT NULL,
    [Emp_LastName]        NVARCHAR (50)  NOT NULL,
    [Emp_EmploymentDate]  DATE           NOT NULL,
    [Adr_Street]          NVARCHAR (100) NOT NULL,
    [Adr_BuildingNumber]  NVARCHAR (5)   NOT NULL,
    [Adr_ApartmentNumber] TINYINT        NULL,
    [Adr_City]            NVARCHAR (100) NOT NULL,
    [Adr_Country]         NVARCHAR (50)  NOT NULL,
    CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED ([Emp_Id] ASC),
    CONSTRAINT [UQ_Employee_PESEL] UNIQUE NONCLUSTERED ([Emp_PESEL] ASC)
);

