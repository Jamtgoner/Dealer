
-- 3. usp_SoftDeleteCliente
CREATE PROCEDURE [dbo].[usp_SoftDeleteCliente]
    @Id INT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE [Dealer].[dbo].[Clientes]
    SET [IsDeleted] = 1
    WHERE [Id] = @Id;
END;