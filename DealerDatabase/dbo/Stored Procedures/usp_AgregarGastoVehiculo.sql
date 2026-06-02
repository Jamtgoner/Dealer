CREATE PROCEDURE [dbo].[usp_AgregarGastoVehiculo]
    @IdVehiculo  INT,
    @Descripcion VARCHAR(200),
    @Tipo VARCHAR(100),
    @Monto       DECIMAL(18,2),
    @Fecha       DATE,
    @Suplidor    VARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM vehiculos WHERE Id = @IdVehiculo AND IsDeleted = 0)
    BEGIN
        RAISERROR('No se encontró un vehículo activo con el Id %d.', 16, 1, @IdVehiculo);
        RETURN;
    END

    INSERT INTO GastosVehiculo (IdVehiculo, Descripcion,Tipo, Monto, Fecha, Suplidor)
    VALUES (@IdVehiculo, @Descripcion,@Tipo, @Monto, @Fecha, @Suplidor);

    SELECT SCOPE_IDENTITY() AS NuevoId;

END;