CREATE TABLE [HR].[Position] (
    [Pos_Position] NVARCHAR (50) NOT NULL,
    CONSTRAINT [PK_Posiition] PRIMARY KEY CLUSTERED ([Pos_Position] ASC),
    UNIQUE NONCLUSTERED ([Pos_Position] ASC)
);

