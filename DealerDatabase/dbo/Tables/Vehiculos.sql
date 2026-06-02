CREATE TABLE [dbo].[Vehiculos] (
    [Id]             INT             IDENTITY (1, 1) NOT NULL,
    [Marca]          VARCHAR (50)    NOT NULL,
    [Modelo]         VARCHAR (100)   NOT NULL,
    [Año]            INT             NOT NULL,
    [Color]          VARCHAR (50)    NOT NULL,
    [Vin]            VARCHAR (50)    NOT NULL,
    [Placa]          VARCHAR (50)    NOT NULL,
    [Millaje]        FLOAT (53)      NOT NULL,
    [Llaves]         INT             NOT NULL,
    [Combustible]    VARCHAR (50)    NOT NULL,
    [Transmision]    VARCHAR (50)    NOT NULL,
    [Estado]         VARCHAR (50)    NOT NULL,
    [Ubicacion]      VARCHAR (50)    NOT NULL,
    [FechaCompra]    DATE            NOT NULL,
    [PrecioCompra]   DECIMAL (18, 2) NOT NULL,
    [CompradoA]      VARCHAR (50)    NOT NULL,
    [MargenGanancia] FLOAT (53)      NOT NULL,
    [Descripcion]    VARCHAR (500)   NULL,
    CONSTRAINT [PK_Vehiculos] PRIMARY KEY CLUSTERED ([Id] ASC)
);

