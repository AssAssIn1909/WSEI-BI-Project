CREATE TABLE [dbo].[Order] (
    [Ord_Id]            INT             IDENTITY (1, 1) NOT NULL,
    [Mod_Id]            INT             DEFAULT ((-1)) NOT NULL,
    [Emp_Id]            INT             DEFAULT ((-1)) NOT NULL,
    [Cli_Id]            INT             DEFAULT ((-1)) NOT NULL,
    [Ord_Price]         DECIMAL (12, 2) NOT NULL,
    [Ord_OrderDate]     DATETIME        NOT NULL,
    [Ord_DateOfReceipt] DATETIME        NULL,
    [Ord_IsCompleted]   BIT             DEFAULT ((0)) NOT NULL,
    [Ord_IsPaid]        BIT             DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_Orde] PRIMARY KEY CLUSTERED ([Ord_Id] ASC),
    CONSTRAINT [CH_Price] CHECK ([Ord_Price]>(0)),
    CONSTRAINT [FK_Client] FOREIGN KEY ([Cli_Id]) REFERENCES [dbo].[Client] ([Cli_Id]) ON DELETE SET DEFAULT,
    CONSTRAINT [FK_Employee] FOREIGN KEY ([Emp_Id]) REFERENCES [dbo].[Employee] ([Emp_Id]) ON DELETE SET DEFAULT,
    CONSTRAINT [FK_Model] FOREIGN KEY ([Mod_Id]) REFERENCES [dbo].[Model] ([Mod_Id]) ON DELETE SET DEFAULT
);

