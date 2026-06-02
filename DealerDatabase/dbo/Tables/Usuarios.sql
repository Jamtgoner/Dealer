CREATE TABLE [dbo].[Usuarios] (
    [Id]      INT           IDENTITY (1, 1) NOT NULL,
    [Usuario] VARCHAR (50)  NOT NULL,
    [Clave]   VARCHAR (100) NOT NULL,
    [Tipo]    VARCHAR (50)  NOT NULL,
    [Estatus] BIT           NOT NULL,
    CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED ([Id] ASC)
);

