CREATE TABLE [Service].[Order] (
    [Sor_Id] INT   IDENTITY (1, 1) NOT NULL,
    [Mod_Id] INT   NOT NULL,
    [Ser_Id] INT   NOT NULL,
    [Prize]  MONEY NOT NULL,
    CONSTRAINT [PK_SerOrder] PRIMARY KEY CLUSTERED ([Sor_Id] ASC),
    CONSTRAINT [FK_SerOrder_Model] FOREIGN KEY ([Mod_Id]) REFERENCES [dbo].[Model] ([Mod_Id]),
    CONSTRAINT [FK_SerOrder_Service] FOREIGN KEY ([Ser_Id]) REFERENCES [Service].[Service] ([Ser_Id])
);



