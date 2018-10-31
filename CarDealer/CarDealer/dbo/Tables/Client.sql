CREATE TABLE [dbo].[Client] (
    [Cli_Id]                 INT           IDENTITY (1, 1) NOT NULL,
    [Cli_SerialNumberIDCard] NCHAR (9)     NOT NULL,
    [Cli_FirstName]          NVARCHAR (50) NOT NULL,
    [Cli_LastName]           NVARCHAR (50) NOT NULL,
    CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED ([Cli_Id] ASC),
    CONSTRAINT [UQ_Client_SerialNumberIDCard] UNIQUE NONCLUSTERED ([Cli_SerialNumberIDCard] ASC)
);

