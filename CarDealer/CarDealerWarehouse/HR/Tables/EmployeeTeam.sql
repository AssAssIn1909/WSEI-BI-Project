CREATE TABLE [HR].[EmployeeTeam] (
    [Emp_Id]   INT           NOT NULL,
    [Tem_Name] NVARCHAR (50) NOT NULL,
    CONSTRAINT [PK_EmployeeTeam] PRIMARY KEY CLUSTERED ([Emp_Id] ASC, [Tem_Name] ASC),
    CONSTRAINT [FK_EmployeeTeam_Employee] FOREIGN KEY ([Emp_Id]) REFERENCES [dbo].[den_Employee] ([Emp_Id])
);

