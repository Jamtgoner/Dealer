CREATE TABLE [dbo].[GastosVehiculo] (
    [Id]          INT             IDENTITY (1, 1) NOT NULL,
    [IdVehiculo]  INT             NOT NULL,
    [Descripcion] VARCHAR (200)   NOT NULL,
    [Tipo]        VARCHAR (100)   NOT NULL,
    [Monto]       DECIMAL (18, 2) NOT NULL,
    [Fecha]       DATE            NOT NULL,
    [Suplidor]    VARCHAR (100)   NOT NULL,
    CONSTRAINT [PK_GastosVehiculo] PRIMARY KEY CLUSTERED ([Id] ASC)
);

