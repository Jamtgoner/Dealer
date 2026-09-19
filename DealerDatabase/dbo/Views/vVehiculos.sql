

CREATE view [dbo].[vVehiculos] as
SELECT 
    V.Id,
    V.Marca,
    V.Modelo,
    V.Anio,
    V.Color,
    V.Vin,
    V.Placa,
    V.Millaje,
    V.Llaves,
    V.Combustible,
    V.Transmision,
    V.Estado,
    V.Ubicacion,
    V.FechaCompra,
    V.PrecioCompra,
    V.CompradoA,
    V.MargenGanancia,
    V.Descripcion,
    ISNULL(G.Gastos, 0) AS Gastos
FROM Vehiculos V
LEFT JOIN (
    SELECT 
        IdVehiculo,
        SUM(Monto) AS Gastos
    FROM GastosVehiculo
    GROUP BY IdVehiculo
) G ON G.IdVehiculo = V.Id
WHERE V.IsDeleted = 0;