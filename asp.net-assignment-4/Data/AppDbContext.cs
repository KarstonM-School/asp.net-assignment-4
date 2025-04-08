using Microsoft.EntityFrameworkCore;
using asp.net_assignment_4.Models;
namespace asp.net_assignment_4.Data
{
    public class AppDbContext : DbContext
    {
        public AppDbContext(DbContextOptions options) : base(options)
        {
            
        }
        public DbSet<Book> Book { get; set; }
        public DbSet<Borrowing> Borrowing { get; set; }
        public DbSet<Reader> Reader { get; set; }
    }
}
