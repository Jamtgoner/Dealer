

CREATE view [dbo].[vClientes] as
SELECT [Id]
      ,[PrimerNombre]
      ,[SegundoNombre]
      ,[PrimerApellido]
      ,[SegundoApellido]
      ,[Telefono]
      ,[Correo]
      ,[DocumentoIdentidad]
      ,[Direccion]
      ,[Notas]
      ,[IsDeleted]
  FROM [Clientes]
  where [IsDeleted] = 0