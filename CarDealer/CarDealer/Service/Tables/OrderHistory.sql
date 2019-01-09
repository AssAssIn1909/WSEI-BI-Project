CREATE TABLE [Service].[OrderHistory] (
    [Orh_Id]          INT            NOT NULL,
    [Sor_Id]          INT            NOT NULL,
    [Emp_Id]          INT            NOT NULL,
    [Sta_Name]        NVARCHAR (30)  NOT NULL,
    [Orh_Date]        DATETIME       DEFAULT (getdate()) NOT NULL,
    [Orh_Description] NVARCHAR (250) NULL,
    CONSTRAINT [PK_OrderHistory] PRIMARY KEY CLUSTERED ([Orh_Id] ASC),
    CONSTRAINT [FK_OrderHistory_Employee] FOREIGN KEY ([Emp_Id]) REFERENCES [dbo].[Employee] ([Emp_Id]),
    CONSTRAINT [FK_OrderHistory_SerOrder] FOREIGN KEY ([Sor_Id]) REFERENCES [Service].[Order] ([Sor_Id]),
    CONSTRAINT [FK_OrderHistory_SerStatus] FOREIGN KEY ([Sta_Name]) REFERENCES [Service].[Status] ([Sta_Name])
);

