CREATE TABLE [HR].[EmployeePosition] (
    [Emp_Id]       INT           NOT NULL,
    [Pos_Position] NVARCHAR (50) NOT NULL,
    [Eps_DateFrom] DATE          NOT NULL,
    [Eps_DateTo]   DATE          NULL,
    CONSTRAINT [PK_EmployeePosition] PRIMARY KEY CLUSTERED ([Emp_Id] ASC, [Pos_Position] ASC),
    CONSTRAINT [CH_EmployeePosition_DateTo] CHECK ([Eps_DateTo]>[Eps_DateFrom]),
    CONSTRAINT [FK_EmployeePosition_Employee] FOREIGN KEY ([Emp_Id]) REFERENCES [dbo].[Employee] ([Emp_Id]),
    CONSTRAINT [FK_EmployeePosition_Position] FOREIGN KEY ([Pos_Position]) REFERENCES [HR].[Position] ([Pos_Position])
);

