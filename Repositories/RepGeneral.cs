using Dapper;
using Dealer.Models;
using Microsoft.Data.SqlClient;
using System.Data;

namespace Dealer.Repositories
{
    public class RepGeneral(IConfiguration configuration) : IRepGeneral
    {
        public readonly string? _connectionString = configuration.GetConnectionString("DataConnection");

        public async Task<Usuarios?> Login(string nombre, string clave)
        {
            using var conexion = new SqlConnection(_connectionString);
            var usuario = await conexion.QueryFirstOrDefaultAsync<Usuarios>("usp_Login", new { Usuario = nombre });

            return usuario != null && BCrypt.Net.BCrypt.Verify(clave, usuario.Clave) ? usuario : null;
        }

        public async Task<IEnumerable<Vehiculos>> ObtenerVehiculos()
        {
            using var conexion = new SqlConnection(_connectionString);
            return await conexion.QueryAsync<Vehiculos>("SELECT * from vVehiculos");
        }

        public async Task<IEnumerable<string>> ObtenerFotosVehiculo(int idVehiculo)
        {
            using var conexion = new SqlConnection(_connectionString);

            return await conexion.QueryAsync<string>(
                @"SELECT ImagenUrl FROM FotosVehiculo WHERE IdVehiculo = @IdVehiculo",
                new { IdVehiculo = idVehiculo });
        }

        public async Task<IEnumerable<string>> ObtenerDocumentosVehiculo(int idVehiculo)
        {
            using var conexion = new SqlConnection(_connectionString);

            return await conexion.QueryAsync<string>(
                @"SELECT DocumentoUrl FROM DocumentosVehiculo WHERE IdVehiculo = @IdVehiculo",
                new { IdVehiculo = idVehiculo });
        }

        public async Task<(bool Exito, string Mensaje, int IdGenerado)> AgregarVehiculo(Vehiculos vehiculo)
        {
            using var conexion = new SqlConnection(_connectionString);
            try
            {
                var id = await conexion.QuerySingleAsync<int>(
                    "usp_AgregarVehiculo",
                    new
                    {
                        vehiculo.Marca,
                        vehiculo.Modelo,
                        vehiculo.Anio,
                        vehiculo.Color,
                        vehiculo.Vin,
                        vehiculo.Placa,
                        vehiculo.Millaje,
                        vehiculo.Llaves,
                        vehiculo.Combustible,
                        vehiculo.Transmision,
                        vehiculo.Estado,
                        vehiculo.Ubicacion,
                        vehiculo.FechaCompra,
                        vehiculo.PrecioCompra,
                        vehiculo.CompradoA,
                        vehiculo.MargenGanancia,
                        vehiculo.Descripcion
                    },
                    commandType: CommandType.StoredProcedure
                );
                return (true, "Vehículo agregado correctamente", id);
            }
            catch (Exception ex)
            {
                return (false, $"Error al agregar: {ex.Message}", 0);
            }
        }

        public async Task<(bool Exito, string Mensaje, int IdGenerado)> AgregarDesperfecto(int idVehiculo, string descripcion)
        {
            using var conexion = new SqlConnection(_connectionString);
            try
            {
                var id = await conexion.QuerySingleAsync<int>(
                    "usp_AgregarDesperfecto",
                    new
                    {
                        IdVehiculo = idVehiculo,
                        Descripcion = descripcion
                    },
                    commandType: CommandType.StoredProcedure
                );
                return (true, "Desperfecto agregado correctamente", id);
            }
            catch (Exception ex)
            {
                return (false, $"Error al agregar: {ex.Message}", 0);
            }
        }

        public async Task<(bool Exito, string Mensaje)> EditarVehiculo(Vehiculos vehiculo)
        {
            using var conexion = new SqlConnection(_connectionString);
            try
            {
                await conexion.ExecuteAsync(
                    "usp_EditarVehiculo", 
                    new
                    {
                        vehiculo.Id,
                        vehiculo.Marca,
                        vehiculo.Modelo,
                        vehiculo.Anio,
                        vehiculo.Color,
                        vehiculo.Vin,
                        vehiculo.Placa,
                        vehiculo.Millaje,
                        vehiculo.Llaves,
                        vehiculo.Combustible,
                        vehiculo.Transmision,
                        vehiculo.Estado,
                        vehiculo.Ubicacion,
                        vehiculo.FechaCompra,
                        vehiculo.PrecioCompra,
                        vehiculo.CompradoA,
                        vehiculo.MargenGanancia,
                        vehiculo.Descripcion
                    },
                    commandType: CommandType.StoredProcedure
                );
                return (true, "Vehículo actualizado correctamente");
            }
            catch (Exception ex)
            {
                return (false, $"Error al actualizar: {ex.Message}");
            }
        }

        // Método provisional para cuando crees las tablas de Fotos y Documentos
        public async Task<bool> GuardarRutaArchivo(int idVehiculo, string url, string tabla)
        {
            using var conexion = new SqlConnection(_connectionString);
            string query = tabla == "Fotos"
                ? "INSERT INTO FotosVehiculo (IdVehiculo, ImagenUrl) VALUES (@IdVehiculo, @Url)"
                : "INSERT INTO DocumentosVehiculo (IdVehiculo, DocumentoUrl) VALUES (@IdVehiculo, @Url)";

            var rows = await conexion.ExecuteAsync(query, new { IdVehiculo = idVehiculo, Url = url });
            return rows > 0;
        }
    }
}
