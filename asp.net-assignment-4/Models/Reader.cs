using System.ComponentModel.DataAnnotations;

namespace asp.net_assignment_4.Models
{
    public class Reader
    {
        [Key]
        [Required(ErrorMessage = "{0} is required")]
        public int Id { get; set; }
        [Required(ErrorMessage = "{0} is required")]
        public string Name { get; set; }
        [Required(ErrorMessage = "{0} is required")]
        [EmailAddress(ErrorMessage = "{0} must be a valid email address.")]
        public string Email { get; set; }
        [Required(ErrorMessage = "{0} is required")]
        [Phone(ErrorMessage = "Invalid phone number format.")]
        public string PhoneNumber { get; set; }
        [Required(ErrorMessage = "{0} is required")]
        public string Address { get; set; }
        public ICollection<Borrowing> Borrowings { get; set; } = new List<Borrowing>();
    }
}
