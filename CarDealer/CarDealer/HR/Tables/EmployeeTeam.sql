CREATE TABLE [HR].[EmployeeTeam] (
    [Emp_Id]   INT           NOT NULL,
    [Tem_Name] NVARCHAR (50) NOT NULL,
    CONSTRAINT [PK_EmployeeTeam] PRIMARY KEY CLUSTERED ([Emp_Id] ASC, [Tem_Name] ASC),
    CONSTRAINT [FK_EmployeeTeam_Employee] FOREIGN KEY ([Emp_Id]) REFERENCES [dbo].[Employee] ([Emp_Id]),
    CONSTRAINT [FK_EmployeeTeam_Team] FOREIGN KEY ([Tem_Name]) REFERENCES [HR].[Team] ([Tem_Name])
);

