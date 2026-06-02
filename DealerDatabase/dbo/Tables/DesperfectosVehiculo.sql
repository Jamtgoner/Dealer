CREATE TABLE [dbo].[DesperfectosVehiculo] (
    [Id]          INT           IDENTITY (1, 1) NOT NULL,
    [IdVehiculo]  INT           NOT NULL,
    [Descripcion] VARCHAR (200) NOT NULL,
    CONSTRAINT [PK_DesperfectosVehiculos] PRIMARY KEY CLUSTERED ([Id] ASC)
);

