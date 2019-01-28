CREATE TABLE [dbo].[Address] (
    [Adr_Id]              INT            IDENTITY (1, 1) NOT NULL,
    [Adr_Street]          NVARCHAR (100) NOT NULL,
    [Adr_BuildingNumber]  NVARCHAR (5)   NOT NULL,
    [Adr_ApartmentNumber] TINYINT        NULL,
    [Adr_City]            NVARCHAR (100) NOT NULL,
    [Adr_Country]         NVARCHAR (50)  NOT NULL,
    CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED ([Adr_Id] ASC)
);

