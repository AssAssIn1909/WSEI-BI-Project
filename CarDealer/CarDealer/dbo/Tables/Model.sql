CREATE TABLE [dbo].[Model] (
    [Mod_Id]          INT            IDENTITY (1, 1) NOT NULL,
    [Bra_Id]          INT            DEFAULT ((-1)) NOT NULL,
    [Mod_Code]        NCHAR (10)     NOT NULL,
    [Mod_Name]        NVARCHAR (250) NOT NULL,
    [Mod_FuelType]    NVARCHAR (20)  NOT NULL,
    [Mod_EngineKW]    SMALLINT       NOT NULL,
    [Mod_Year]        SMALLINT       NOT NULL,
    [Mod_DriveType]   NVARCHAR (50)  NOT NULL,
    [Mod_BodyType]    NVARCHAR (20)  NOT NULL,
    [Mod_DoorsNumber] TINYINT        DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_Model] PRIMARY KEY CLUSTERED ([Mod_Id] ASC),
    CONSTRAINT [FK_Model_Brand] FOREIGN KEY ([Bra_Id]) REFERENCES [dbo].[Brand] ([Bra_Id]) ON DELETE SET DEFAULT,
    CONSTRAINT [UQ_Model_Code] UNIQUE NONCLUSTERED ([Mod_Code] ASC)
);





