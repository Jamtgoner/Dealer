using Dealer.Components.Pages;
using Dealer.Models;

namespace Dealer.Repositories
{
    public interface IRepGeneral
    {
        Task<Usuarios?> Login(string nombre, string clave);
        Task<IEnumerable<string>> ObtenerFotosVehiculo(int idVehiculo);
        Task<IEnumerable<Vehiculos>> ObtenerVehiculos();
    }
}