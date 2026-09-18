
CREATE PROCEDURE [dbo].[usp_EliminarGasto]
    @Id INT
AS
BEGIN
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM GastosVehiculo WHERE Id = @Id)
    BEGIN
        RAISERROR('No se encontró un desperfecto con el Id %d.', 16, 1, @Id);
        RETURN;
    END

    DELETE FROM GastosVehiculo
    WHERE Id = @Id;

END;