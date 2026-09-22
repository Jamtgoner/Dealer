
-- 2. usp_EditarCliente
CREATE PROCEDURE [dbo].[usp_EditarCliente]
    @Id INT,
    @PrimerNombre NVARCHAR(50),
    @SegundoNombre NVARCHAR(50) = NULL,
    @PrimerApellido NVARCHAR(50),
    @SegundoApellido NVARCHAR(50) = NULL,
    @Telefono VARCHAR(20) = NULL,
    @Correo VARCHAR(50) = NULL,
    @DocumentoIdentidad VARCHAR(20) = NULL,
    @Direccion NVARCHAR(200) = NULL,
    @Notas NVARCHAR(MAX) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE [Dealer].[dbo].[Clientes]
    SET [PrimerNombre] = @PrimerNombre,
        [SegundoNombre] = @SegundoNombre,
        [PrimerApellido] = @PrimerApellido,
        [SegundoApellido] = @SegundoApellido,
        [Telefono] = @Telefono,
        [Correo] = @Correo,
        [DocumentoIdentidad] = @DocumentoIdentidad,
        [Direccion] = @Direccion,
        [Notas] = @Notas
    WHERE [Id] = @Id AND [IsDeleted] = 0;
END;