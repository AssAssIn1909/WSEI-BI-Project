CREATE TABLE [dbo].[Employee] (
    [Emp_Id]        INT           IDENTITY (1, 1) NOT NULL,
    [Emp_PESEL]     NCHAR (11)    NOT NULL,
    [Emp_FirstName] NVARCHAR (50) NOT NULL,
    [Emp_LastName]  NVARCHAR (50) NOT NULL,
    CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED ([Emp_Id] ASC),
    CONSTRAINT [UQ_Employee_PESEL] UNIQUE NONCLUSTERED ([Emp_PESEL] ASC)
);

