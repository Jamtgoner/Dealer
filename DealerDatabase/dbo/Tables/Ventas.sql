CREATE TABLE [dbo].[Ventas] (
    [Id]             INT             IDENTITY (1, 1) NOT NULL,
    [IdVehiculo]     INT             NOT NULL,
    [IdComprador]    INT             NOT NULL,
    [IdVendedor]     INT             NOT NULL,
    [PrecioVehiculo] DECIMAL (18, 2) NOT NULL,
    [MetodoPago]     VARCHAR (50)    NOT NULL,
    [Fecha]          DATE            NOT NULL,
    [Estatus]        BIT             NOT NULL,
    [Notas]          VARCHAR (500)   NULL,
    CONSTRAINT [PK_Ventas] PRIMARY KEY CLUSTERED ([Id] ASC)
);

