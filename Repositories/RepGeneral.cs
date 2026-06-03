using Dapper;
using Dealer.Components.Pages;
using Dealer.Models;
using Microsoft.Data.SqlClient;

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
                @"SELECT ImagenUrl FROM FotosVehiculos WHERE IdVehiculo = @IdVehiculo",
                new { IdVehiculo = idVehiculo });
        }
    }
}
