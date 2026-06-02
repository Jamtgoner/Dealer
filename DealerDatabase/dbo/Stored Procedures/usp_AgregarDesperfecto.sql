CREATE PROCEDURE usp_AgregarDesperfecto
    @IdVehiculo  INT,
    @Descripcion VARCHAR(200)
AS
BEGIN
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM vehiculos WHERE Id = @IdVehiculo AND IsDeleted = 0)
    BEGIN
        RAISERROR('No se encontró un vehículo activo con el Id %d.', 16, 1, @IdVehiculo);
        RETURN;
    END

    INSERT INTO DesperfectosVehiculo (IdVehiculo, Descripcion)
    VALUES (@IdVehiculo, @Descripcion);

    SELECT SCOPE_IDENTITY() AS NuevoId;

END;