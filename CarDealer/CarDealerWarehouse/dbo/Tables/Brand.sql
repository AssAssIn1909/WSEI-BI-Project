CREATE TABLE [dbo].[Brand] (
    [Bra_Id]       INT           IDENTITY (1, 1) NOT NULL,
    [Bra_Code]     NVARCHAR (20) NOT NULL,
    [Bra_FullName] NVARCHAR (50) NOT NULL,
    [Bra_Country]  NVARCHAR (30) NOT NULL,
    CONSTRAINT [PK_Brand] PRIMARY KEY CLUSTERED ([Bra_Id] ASC),
    CONSTRAINT [UQ_Brand_Code] UNIQUE NONCLUSTERED ([Bra_Code] ASC)
);

