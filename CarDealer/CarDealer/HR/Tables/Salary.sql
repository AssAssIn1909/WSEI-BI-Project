CREATE TABLE [HR].[Salary] (
    [Sal_Id]       INT          NOT NULL,
    [Emp_Id]       INT          NOT NULL,
    [Sal_Amount]   MONEY        NOT NULL,
    [Sal_Type]     NVARCHAR (6) NOT NULL,
    [Sal_DateFrom] DATE         NOT NULL,
    [Sal_DateTo]   DATE         NULL,
    CONSTRAINT [PK_Salary] PRIMARY KEY CLUSTERED ([Sal_Id] ASC),
    CONSTRAINT [CH_Salaray_Type] CHECK ([Sal_Type]='Pensja' OR [Sal_Type]='Premia'),
    CONSTRAINT [FK_Salary_Employee] FOREIGN KEY ([Emp_Id]) REFERENCES [dbo].[Employee] ([Emp_Id])
);

