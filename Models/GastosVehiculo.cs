namespace Dealer.Models
{
    public class GastosVehiculo
    {
        public int Id { get; set; }
        public int IdVehiculo { get; set; }
        public string? Descripcion { get; set; }
        public string? Tipo { get; set; }
        public decimal Monto { get; set; }
        public DateTime Fecha { get; set; }
        public string? Suplidor { get; set; }
    }
}
