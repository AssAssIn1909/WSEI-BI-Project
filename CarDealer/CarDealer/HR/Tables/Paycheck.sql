CREATE TABLE [HR].[Paycheck] (
    [Pay_Id]       INT   IDENTITY (1, 1) NOT NULL,
    [Emp_Id]       INT   NOT NULL,
    [Pay_Amount]   MONEY NOT NULL,
    [Pay_DateFrom] DATE  NOT NULL,
    [Pay_DateTo]   DATE  NULL,
    CONSTRAINT [PK_Paycheck] PRIMARY KEY CLUSTERED ([Pay_Id] ASC),
    CONSTRAINT [FK_Paycheck_Employee] FOREIGN KEY ([Emp_Id]) REFERENCES [dbo].[Employee] ([Emp_Id])
);



