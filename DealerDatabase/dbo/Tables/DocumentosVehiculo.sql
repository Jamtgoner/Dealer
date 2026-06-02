CREATE TABLE [dbo].[DocumentosVehiculo] (
    [Id]           INT           IDENTITY (1, 1) NOT NULL,
    [IdVehiculo]   INT           NOT NULL,
    [DocumentoUrl] VARCHAR (200) NOT NULL,
    CONSTRAINT [PK_DocumentosVehiculo] PRIMARY KEY CLUSTERED ([Id] ASC)
);

