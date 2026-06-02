CREATE PROCEDURE [dbo].[usp_AgregarVehiculo]
    @Marca           VARCHAR(50),
    @Modelo          VARCHAR(100),
    @Anio            INT,
    @Color           VARCHAR(50),
    @Vin             VARCHAR(50),
    @Placa           VARCHAR(50),
    @Millaje         FLOAT,
    @Llaves          INT,
    @Combustible     VARCHAR(50),
    @Transmision     VARCHAR(50),
    @Estado          VARCHAR(50),
    @Ubicacion       VARCHAR(50),
    @FechaCompra     DATE,
    @PrecioCompra    DECIMAL(18,2),
    @CompradoA       VARCHAR(50),
    @MargenGanancia  FLOAT,
    @Descripcion     VARCHAR(500) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO vehiculos (
        Marca, Modelo, Anio, Color, Vin, Placa,
        Millaje, Llaves, Combustible, Transmision,
        Estado, Ubicacion, FechaCompra, PrecioCompra,
        CompradoA, MargenGanancia, Descripcion
    )
    VALUES (
        @Marca, @Modelo, @Anio, @Color, @Vin, @Placa,
        @Millaje, @Llaves, @Combustible, @Transmision,
        @Estado, @Ubicacion, @FechaCompra, @PrecioCompra,
        @CompradoA, @MargenGanancia, @Descripcion
    );

    -- Retorna el Id generado
    SELECT SCOPE_IDENTITY() AS NuevoId;
END;