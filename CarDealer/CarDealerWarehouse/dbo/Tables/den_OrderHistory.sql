CREATE TABLE [dbo].[den_OrderHistory] (
    [Orh_Id]          INT            IDENTITY (1, 1) NOT NULL,
    [Emp_Id]          INT            NOT NULL,
    [Sta_Name]        NVARCHAR (30)  NOT NULL,
    [Orh_Date]        DATETIME       DEFAULT (getdate()) NOT NULL,
    [Orh_Description] NVARCHAR (250) NULL,
    [Ser_Price]       MONEY          NOT NULL,
    [Ser_VIN]         NCHAR (17)     NOT NULL,
    [Ser_Name]        NVARCHAR (70)  NOT NULL,
    [Ser_ShortName]   NVARCHAR (15)  NOT NULL,
    CONSTRAINT [PK_OrderHistory] PRIMARY KEY CLUSTERED ([Orh_Id] ASC),
    CONSTRAINT [FK_OrderHistory_Employee] FOREIGN KEY ([Emp_Id]) REFERENCES [dbo].[den_Employee] ([Emp_Id]),
    CONSTRAINT [FK_OrderHistory_Order] FOREIGN KEY ([Ser_VIN]) REFERENCES [dbo].[den_Order] ([Ord_VIN])
);

