CREATE TABLE [dbo].[FotosVehiculo] (
    [Id]         INT           IDENTITY (1, 1) NOT NULL,
    [IdVehiculo] INT           NOT NULL,
    [ImagenUrl]  VARCHAR (200) NOT NULL,
    CONSTRAINT [PK_FotosVehiculo] PRIMARY KEY CLUSTERED ([Id] ASC)
);

