CREATE TABLE [dbo].[den_Client] (
    [Cli_Id]                 INT            IDENTITY (1, 1) NOT NULL,
    [Cli_SerialNumberIDCard] NCHAR (9)      NOT NULL,
    [Cli_FirstName]          NVARCHAR (50)  NOT NULL,
    [Cli_LastName]           NVARCHAR (50)  NOT NULL,
    [Adr_Street]             NVARCHAR (100) NOT NULL,
    [Adr_BuildingNumber]     NVARCHAR (5)   NOT NULL,
    [Adr_ApartmentNumber]    TINYINT        NULL,
    [Adr_City]               NVARCHAR (100) NOT NULL,
    [Adr_Country]            NVARCHAR (50)  NOT NULL,
    CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED ([Cli_Id] ASC),
    CONSTRAINT [UQ_Client_SerialNumberIDCard] UNIQUE NONCLUSTERED ([Cli_SerialNumberIDCard] ASC)
);

