CREATE TABLE [dbo].[Clientes] (
    [Id]                 INT          NOT NULL,
    [PrimerNombre]       VARCHAR (50) NOT NULL,
    [SegundoNombre]      VARCHAR (50) NULL,
    [PrimerApellido]     VARCHAR (50) NOT NULL,
    [SegundoApellido]    VARCHAR (50) NULL,
    [Telefono]           VARCHAR (25) NOT NULL,
    [Correo]             VARCHAR (50) NULL,
    [DocumentoIdentidad] VARCHAR (50) NOT NULL,
    CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED ([Id] ASC)
);

