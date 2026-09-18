CREATE TABLE [dbo].[Parametros] (
    [Id]          INT           IDENTITY (1, 1) NOT NULL,
    [Categoria]   VARCHAR (50)  NOT NULL,
    [Descripcion] VARCHAR (200) NOT NULL,
    CONSTRAINT [PK_Parametros] PRIMARY KEY CLUSTERED ([Id] ASC)
);

