CREATE PROCEDURE [dbo].[usp_EditarGastoVehiculo]
    @Id          INT,
    @Descripcion VARCHAR(200),
    @Monto       DECIMAL(18,2),
    @Fecha       DATE,
    @Suplidor    VARCHAR(100),
    @Tipo        VARCHAR(100)
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM GastosVehiculo WHERE Id = @Id)
    BEGIN
        RAISERROR('No se encontró un gasto con el Id %d.', 16, 1, @Id);
        RETURN;
    END

    UPDATE GastosVehiculo
    SET
        Descripcion = @Descripcion,
        Monto       = @Monto,
        Fecha       = @Fecha,
        Suplidor    = @Suplidor,
        Tipo        = @Tipo
    WHERE Id = @Id;

END;