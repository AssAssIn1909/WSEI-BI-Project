CREATE TABLE [Service].[Service] (
    [Ser_Id]        INT           IDENTITY (1, 1) NOT NULL,
    [Ser_Name]      NVARCHAR (70) NOT NULL,
    [Ser_ShortName] NVARCHAR (15) NOT NULL,
    CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED ([Ser_Id] ASC)
);





