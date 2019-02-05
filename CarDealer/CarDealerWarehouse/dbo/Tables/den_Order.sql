CREATE TABLE [dbo].[den_Order] (
    [Ord_Id]            INT            IDENTITY (1, 1) NOT NULL,
    [Emp_Id]            INT            DEFAULT ((-1)) NOT NULL,
    [Cli_Id]            INT            DEFAULT ((-1)) NOT NULL,
    [Ord_Price]         MONEY          NOT NULL,
    [Ord_OrderDate]     DATETIME       NOT NULL,
    [Ord_DateOfReceipt] DATETIME       NULL,
    [Ord_IsCompleted]   BIT            DEFAULT ((0)) NOT NULL,
    [Ord_IsPaid]        BIT            DEFAULT ((0)) NOT NULL,
    [Ord_VIN]           NCHAR (17)     DEFAULT (substring(replace(newid(),'-',''),(1),(17))) NOT NULL,
    [Bra_FullName]      NVARCHAR (50)  NOT NULL,
    [Bra_Country]       NVARCHAR (30)  NOT NULL,
    [Mod_Code]          NCHAR (10)     NOT NULL,
    [Mod_Name]          NVARCHAR (250) NOT NULL,
    [Mod_FuelType]      NVARCHAR (20)  NOT NULL,
    [Mod_EngineKW]      SMALLINT       NOT NULL,
    [Mod_Year]          SMALLINT       NOT NULL,
    [Mod_DriveType]     NVARCHAR (50)  NOT NULL,
    [Mod_BodyType]      NVARCHAR (20)  NOT NULL,
    [Mod_DoorsNumber]   TINYINT        DEFAULT ((0)) NOT NULL,
    [Pri_Price]         MONEY          NOT NULL,
    [Pri_DateFrom]      DATE           NOT NULL,
    [Pri_DateTo]        DATE           NULL,
    CONSTRAINT [CH_Price] CHECK ([Ord_Price]>(0)),
    CONSTRAINT [FK_Order_Client] FOREIGN KEY ([Cli_Id]) REFERENCES [dbo].[den_Client] ([Cli_Id]) ON DELETE SET DEFAULT,
    CONSTRAINT [FK_Order_Employee] FOREIGN KEY ([Emp_Id]) REFERENCES [dbo].[den_Employee] ([Emp_Id]) ON DELETE SET DEFAULT,
    CONSTRAINT [UQ_VIN] UNIQUE NONCLUSTERED ([Ord_VIN] ASC)
);




GO
CREATE CLUSTERED COLUMNSTORE INDEX [cci]
    ON [dbo].[den_Order];



