namespace Dealer.Models
{
    public class Vehiculos
    {
        public int Id { get; set; }
        public string Marca { get; set; } = string.Empty;
        public string Modelo { get; set; } = string.Empty;
        public int Anio { get; set; }
        public string Color { get; set; } = string.Empty;
        public string Vin { get; set; } = string.Empty;
        public string Placa { get; set; } = string.Empty;
        public float Millaje { get; set; }
        public int Llaves { get; set; }
        public string Combustible { get; set; } = string.Empty;
        public string Transmision { get; set; } = string.Empty;
        public string Estado { get; set; } = string.Empty;
        public string Ubicacion { get; set; } = string.Empty;
        public DateTime FechaCompra { get; set; }
        public decimal PrecioCompra { get; set; }
        public string CompradoA { get; set; } = string.Empty;
        public decimal MargenGanancia { get; set; }
        public string? Descripcion { get; set; }
        public bool IsDeleted { get; set; }
    }
}
