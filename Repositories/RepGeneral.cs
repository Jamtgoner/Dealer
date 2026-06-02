using Dapper;
using Dealer.Models;
using Microsoft.Data.SqlClient;

namespace Dealer.Repositories
{
    public class RepGeneral(IConfiguration configuration)
    {
        public readonly string? _connectionString = configuration.GetConnectionString("DataConnection");

        public async Task<Usuarios?> Login(string nombre, string clave)
        {
            using var conexion = new SqlConnection(_connectionString);
            var usuario = await conexion.QueryFirstOrDefaultAsync<Usuarios>("usp_Login", new { Usuario = nombre });

            return usuario != null && BCrypt.Net.BCrypt.Verify(clave, usuario.Clave) ? usuario : null;
        }
    }
}
