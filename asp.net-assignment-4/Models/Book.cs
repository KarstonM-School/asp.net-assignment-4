using System.ComponentModel.DataAnnotations;

namespace asp.net_assignment_4.Models
{
    public class Book
    {
        [Key]
        [Required(ErrorMessage = "{0} is required")]
        public int Id { get; set; }
        [Required(ErrorMessage = "{0} is required")]
        public string Name { get; set; }
        [Required(ErrorMessage = "{0} is required")]
        public string Author { get; set; }
        [Required(ErrorMessage = "{0} is required")]
        public int YearPublished { get; set; }
        [Required(ErrorMessage = "{0} is required")]
        public string Genre { get; set; }
        public ICollection<Borrowing> Borrowings { get; set; } = new List<Borrowing>();
    }
}
