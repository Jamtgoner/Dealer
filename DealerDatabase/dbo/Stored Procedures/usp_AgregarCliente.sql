-- 1. usp_AgregarCliente
CREATE PROCEDURE [dbo].[usp_AgregarCliente]
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

    INSERT INTO [Dealer].[dbo].[Clientes]
    (
        [PrimerNombre],
        [SegundoNombre],
        [PrimerApellido],
        [SegundoApellido],
        [Telefono],
        [Correo],
        [DocumentoIdentidad],
        [Direccion],
        [Notas],
        [IsDeleted]
    )
    VALUES
    (
        @PrimerNombre,
        @SegundoNombre,
        @PrimerApellido,
        @SegundoApellido,
        @Telefono,
        @Correo,
        @DocumentoIdentidad,
        @Direccion,
        @Notas,
        0
    );

    SELECT CAST(SCOPE_IDENTITY() AS INT);
END;