using Microsoft.AspNetCore.Mvc.ModelBinding.Validation;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace asp.net_assignment_4.Models
{
    public class Borrowing
    {
        [Key]
        [Required(ErrorMessage = "{0} is required")]
        public int Id { get; set; }
        [ForeignKey("Book")]
        [Required(ErrorMessage = "{0} is required")]
        public int BookId { get; set; }
        [ForeignKey("Reader")]
        [Required(ErrorMessage = "{0} is required")]
        public int BorrowerId { get; set; }
        [Required(ErrorMessage = "{0} is required")]
        public bool IsReturned { get; set; }

        [ValidateNever]
        public Book Book { get; set; }
        [ValidateNever]
        public Reader Reader { get; set; }
    }
}
