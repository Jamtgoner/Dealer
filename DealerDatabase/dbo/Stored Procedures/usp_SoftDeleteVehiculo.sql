CREATE PROCEDURE usp_SoftDeleteVehiculo
    @Id INT
AS
BEGIN
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM vehiculos WHERE Id = @Id)
    BEGIN
        RAISERROR('No se encontró un vehículo con el Id %d.', 16, 1, @Id);
        RETURN;
    END

    UPDATE vehiculos
    SET IsDeleted = 1
    WHERE Id = @Id;

END;