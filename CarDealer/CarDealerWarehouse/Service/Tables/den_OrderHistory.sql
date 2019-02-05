CREATE TABLE [Service].[den_OrderHistory] (
    [Orh_Id]          INT            IDENTITY (1, 1) NOT NULL,
    [Sor_id]          INT            NOT NULL,
    [Emp_Id]          INT            NOT NULL,
    [Sta_Name]        NVARCHAR (30)  NOT NULL,
    [Orh_Date]        DATETIME       DEFAULT (getdate()) NOT NULL,
    [Orh_Description] NVARCHAR (250) NULL,
    [Sor_Price]       MONEY          NOT NULL,
    [Sor_VIN]         NCHAR (17)     NOT NULL,
    [Ser_Name]        NVARCHAR (70)  NOT NULL,
    [Ser_ShortName]   NVARCHAR (15)  NOT NULL,
    CONSTRAINT [PK_OrderHistory] PRIMARY KEY CLUSTERED ([Orh_Id] ASC),
    CONSTRAINT [FK_OrderHistory_Employee] FOREIGN KEY ([Emp_Id]) REFERENCES [dbo].[den_Employee] ([Emp_Id]),
    CONSTRAINT [FK_OrderHistory_Order] FOREIGN KEY ([Sor_VIN]) REFERENCES [dbo].[den_Order] ([Ord_VIN])
);

