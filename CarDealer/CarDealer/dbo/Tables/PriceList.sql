CREATE TABLE [dbo].[PriceList] (
    [Pri_Id]       INT             IDENTITY (1, 1) NOT NULL,
    [Mod_Id]       INT             DEFAULT ((-1)) NOT NULL,
    [Pri_Price]    DECIMAL (12, 2) NOT NULL,
    [Pri_DateFrom] DATE            NOT NULL,
    [Pri_DateTo]   DATE            NULL,
    CONSTRAINT [PK_PriceList] PRIMARY KEY CLUSTERED ([Pri_Id] ASC),
    CONSTRAINT [FK_PriceList_Model] FOREIGN KEY ([Mod_Id]) REFERENCES [dbo].[Model] ([Mod_Id]) ON DELETE SET DEFAULT
);



