namespace Dealer.Models;

public class Cliente
{
    public int Id { get; set; }

    public string PrimerNombre { get; set; }

    public string SegundoNombre { get; set; }

    public string PrimerApellido { get; set; }

    public string SegundoApellido { get; set; }

    public string Telefono { get; set; }

    public string Correo { get; set; }

    public string DocumentoIdentidad { get; set; }

    public string Direccion { get; set; }

    public string Notas { get; set; }

    public bool IsDeleted { get; set; }
}