using Dealer.Components.Pages;
using Dealer.Models;

namespace Dealer.Repositories
{
    public interface IRepGeneral
    {
        Task<(bool Exito, string Mensaje, int IdGenerado)> AgregarDesperfecto(int idVehiculo, string descripcion);
        Task<(bool Exito, string Mensaje, int IdGenerado)> AgregarVehiculo(Vehiculos vehiculo);
        Task<(bool Exito, string Mensaje)> EditarVehiculo(Vehiculos vehiculo);
        Task<bool> GuardarRutaArchivo(int idVehiculo, string url, string tabla);
        Task<Usuarios?> Login(string nombre, string clave);
        Task<IEnumerable<string>> ObtenerDesperfectosVehiculo(int idVehiculo);
        Task<IEnumerable<string>> ObtenerDocumentosVehiculo(int idVehiculo);
        Task<IEnumerable<string>> ObtenerFotosVehiculo(int idVehiculo);
        Task<IEnumerable<GastosVehiculo>> ObtenerGastosVehiculo(int idVehiculo);
        Task<Vehiculos> ObtenerVehiculoPorId(int id);
        Task<IEnumerable<Vehiculos>> ObtenerVehiculos();
    }
}