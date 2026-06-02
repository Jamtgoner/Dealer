CREATE PROCEDURE usp_EliminarDesperfecto
    @Id INT
AS
BEGIN
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM DesperfectosVehiculo WHERE Id = @Id)
    BEGIN
        RAISERROR('No se encontró un desperfecto con el Id %d.', 16, 1, @Id);
        RETURN;
    END

    DELETE FROM DesperfectosVehiculo
    WHERE Id = @Id;

END;