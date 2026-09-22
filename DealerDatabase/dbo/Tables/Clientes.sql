CREATE TABLE [dbo].[Clientes] (
    [Id]                 INT           IDENTITY (1, 1) NOT NULL,
    [PrimerNombre]       VARCHAR (50)  NOT NULL,
    [SegundoNombre]      VARCHAR (50)  NULL,
    [PrimerApellido]     VARCHAR (50)  NOT NULL,
    [SegundoApellido]    VARCHAR (50)  NULL,
    [Telefono]           VARCHAR (25)  NOT NULL,
    [Correo]             VARCHAR (50)  NULL,
    [DocumentoIdentidad] VARCHAR (50)  NOT NULL,
    [Direccion]          VARCHAR (200) NULL,
    [Notas]              VARCHAR (200) NULL,
    [IsDeleted]          BIT           NOT NULL,
    CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED ([Id] ASC)
);

