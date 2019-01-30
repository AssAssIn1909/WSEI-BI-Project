CREATE TABLE [HR].[Salary] (
    [Sal_Id]     INT          IDENTITY (1, 1) NOT NULL,
    [Emp_Id]     INT          NOT NULL,
    [Sal_Amount] SMALLMONEY   NOT NULL,
    [Sal_Type]   NVARCHAR (6) NOT NULL,
    [Sal_Date]   DATE         NOT NULL,
    CONSTRAINT [PK_Salary] PRIMARY KEY CLUSTERED ([Sal_Id] ASC),
    CONSTRAINT [CH_Salary_Type] CHECK ([Sal_Type]='Pensja' OR [Sal_Type]='Premia'),
    CONSTRAINT [FK_Salary_Employee] FOREIGN KEY ([Emp_Id]) REFERENCES [dbo].[Employee] ([Emp_Id])
);



