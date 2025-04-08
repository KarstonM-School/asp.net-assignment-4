using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using asp.net_assignment_4.Models;
using asp.net_assignment_4.Data;

namespace asp.net_assignment_4.Controllers
{
    public class BookController : Controller
    {
        private readonly AppDbContext appDbContext;

        public BookController(AppDbContext appDbContext)
        {
            this.appDbContext = appDbContext;
        }

        [HttpGet]
        [Route("books")]
        public async Task<IActionResult> Index(string search)
        {
            var books = from b in appDbContext.Book
                        select b;

            if (!string.IsNullOrEmpty(search))
            {
                books = books.Where(b => b.Name.Contains(search) ||
                                         b.Author.Contains(search) ||
                                         b.Genre.Contains(search));
            }

            return View(await books.ToListAsync());
        }

        // Get certain book
        [HttpGet]
        [Route("books/{id}")]
        public async Task<IActionResult> Details(int id)
        {
            return View(await appDbContext.Book
                .Include(b => b.Borrowings)
                .ThenInclude(br => br.Reader)
                .FirstOrDefaultAsync(b => b.Id == id));
        }

        // Get Book add page
        [HttpGet]
        [Route("books/add")]
        public IActionResult Add()
        {
            return View();
        }

        // Add a book
        [HttpPost]
        [Route("books/add")]
        public async Task<IActionResult> Add(Book book)
        {
            if (ModelState.IsValid)
            {
                var newBook = new Book()
                {
                    Name = book.Name,
                    Author = book.Author,
                    YearPublished = book.YearPublished,
                    Genre = book.Genre
                };
                await appDbContext.Book.AddAsync(newBook);
                await appDbContext.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            return View(book);
        }

        // Get book edit page
        [HttpGet]
        [Route("books/edit/{id}")]
        public async Task<IActionResult> Edit(int id)
        {
            return View(await appDbContext.Book
               .Include(b => b.Borrowings)
               .ThenInclude(br => br.Reader)
               .FirstOrDefaultAsync(b => b.Id == id));
        }

        // edit book
        [HttpPost]
        [Route("books/edit/{id}")]
        public async Task<IActionResult> Edit(Book newBook)
        {
            if (ModelState.IsValid)
            {
                var book = await appDbContext.Book.FindAsync(newBook.Id);
                if (book != null)
                {
                    book.Name = newBook.Name;
                    book.Author = newBook.Author;
                    book.YearPublished = newBook.YearPublished;
                    book.Genre = newBook.Genre;
                    await appDbContext.SaveChangesAsync();
                    return RedirectToAction("Index");
                }   
            }
            return View(newBook);
        }

        // Delete book
        [HttpGet]
        [Route("books/delete/{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            var book = await appDbContext.Book.FindAsync(id);
            if (book != null)
            {
                appDbContext.Book.Remove(book);
                await appDbContext.SaveChangesAsync();
            }
            return RedirectToAction("Index");
        }
    }
}
