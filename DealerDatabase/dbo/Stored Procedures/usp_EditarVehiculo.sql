CREATE PROCEDURE usp_EditarVehiculo
    @Id              INT,
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

    IF NOT EXISTS (SELECT 1 FROM vehiculos WHERE Id = @Id)
    BEGIN
        RAISERROR('No se encontró un vehículo con el Id %d.', 16, 1, @Id);
        RETURN;
    END

    UPDATE vehiculos
    SET
        Marca           = @Marca,
        Modelo          = @Modelo,
        Anio            = @Anio,
        Color           = @Color,
        Vin             = @Vin,
        Placa           = @Placa,
        Millaje         = @Millaje,
        Llaves          = @Llaves,
        Combustible     = @Combustible,
        Transmision     = @Transmision,
        Estado          = @Estado,
        Ubicacion       = @Ubicacion,
        FechaCompra     = @FechaCompra,
        PrecioCompra    = @PrecioCompra,
        CompradoA       = @CompradoA,
        MargenGanancia  = @MargenGanancia,
        Descripcion     = @Descripcion
    WHERE Id = @Id;

END;