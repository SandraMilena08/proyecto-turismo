// Librerías
using Entidades.Oferta;
using Entidades.Recomendacion;
using Entidades.Seguridad;
using Entidades.Usuarios;
using Microsoft.EntityFrameworkCore;

namespace Datos
{

    // Contexto de base de datos PostgreSQL
    public class PostgreSQLContext : DbContext
    {

        // Constructor
        public PostgreSQLContext(DbContextOptions<PostgreSQLContext> opt) : base(opt) { }

        // Mapeo de entidades

        // Usuario
        public DbSet<Turista> Turista { get; set; }
        public DbSet<Proveedor> Proveedor { get; set; }
        public DbSet<PreRegistro> PreRegistro { get; set; }
        public DbSet<Administrador> Administrador { get; set; }

        // Seguridad
        public DbSet<RecuperarCuenta> RecuperarCuenta { get; set; }
        public DbSet<SupervisionUsuario> SupervisionUsuario { get; set; }

        // Oferta turística
        public DbSet<Plan> Plan { get; set; }
        public DbSet<Servicio> Servicio { get; set; }

        // Recomendación
        public DbSet<PuntuacionPlan> PuntuacionPlan { get; set; }
        public DbSet<PuntuacionServicio> PuntuacionServicio { get; set; }

    }
}
