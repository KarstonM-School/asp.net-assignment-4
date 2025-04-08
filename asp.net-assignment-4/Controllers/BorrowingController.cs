using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using asp.net_assignment_4.Models;
using asp.net_assignment_4.Data;

namespace asp.net_assignment_4.Controllers
{
    public class BorrowingController : Controller
    {
        private readonly AppDbContext appDbContext;

        public BorrowingController(AppDbContext appDbContext)
        {
            this.appDbContext = appDbContext;
        }

        // Get all borrowings
        [HttpGet]
        [Route("borrowings")]
        public async Task<IActionResult> Index(string search)
        {
            var borrowings = appDbContext.Borrowing
                .Include(b => b.Book)
                .Include(b => b.Reader)
                .AsQueryable();

            if (!string.IsNullOrEmpty(search))
            {
                borrowings = borrowings.Where(b =>  
                    b.Book.Name.Contains(search) ||
                    b.Reader.Name.Contains(search));
            }

            return View(await borrowings.ToListAsync());
        }

        // Get certain borrowing
        [HttpGet]
        [Route("borrowings/{id}")]
        public async Task<IActionResult> Details(int id)
        {
               return View(await appDbContext.Borrowing
                .Include(b => b.Book)
                .Include(b => b.Reader)
                .FirstOrDefaultAsync(b => b.Id == id));
        }

        // Get borrowing add page 
        [HttpGet]
        [Route("borrowings/add")]
        public IActionResult Add()
        {
            return View();
        }

        //Add a borrowing
        [HttpPost]
        [Route("borrowings/add")]
        public async Task<IActionResult> Add(Borrowing borrowing)
        {
            if (ModelState.IsValid)
            {
                var book = await appDbContext.Book.FindAsync(borrowing.BookId);
                var reader = await appDbContext.Reader.FindAsync(borrowing.BorrowerId);
                var newBorrowing = new Borrowing()
                {
                    BookId = borrowing.BookId,
                    BorrowerId = borrowing.BorrowerId,
                    IsReturned = borrowing.IsReturned,
                    Book = book,
                    Reader = reader,
                };
                await appDbContext.Borrowing.AddAsync(newBorrowing);
                await appDbContext.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            return View(borrowing);
        }

        // Get borrowing edit page
        [HttpGet]
        [Route("borrowings/edit/{id}")]
        public async Task<IActionResult> Edit(int id)
        {
            return View(await appDbContext.Borrowing.FirstOrDefaultAsync(b => b.Id == id));
        }

        // Edit borrowing
        [HttpPost]
        [Route("borrowings/edit/{id}")]
        public async Task<IActionResult> Edit(Borrowing newBorrowing)
        {
            if (ModelState.IsValid)
            {
                var borrowing = await appDbContext.Borrowing.FindAsync(newBorrowing.Id);
                var newBook = await appDbContext.Book.FindAsync(newBorrowing.BookId);
                var newReader = await appDbContext.Reader.FindAsync(newBorrowing.BorrowerId);
                if (borrowing != null)
                {
                    borrowing.BookId = newBorrowing.BookId;
                    borrowing.BorrowerId = newBorrowing.BorrowerId;
                    borrowing.IsReturned = newBorrowing.IsReturned;
                    borrowing.Book = newBook;
                    borrowing.Reader = newReader;
                    await appDbContext.SaveChangesAsync();
                    return RedirectToAction("Index");
                }
            }
            return View(newBorrowing);
        }


        // Delete borrowing
        [Route("borrowings/delete/{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            var borrowing = await appDbContext.Borrowing.FindAsync(id);
            if (borrowing != null)
            {
                appDbContext.Borrowing.Remove(borrowing);
                await appDbContext.SaveChangesAsync();
            }
            return RedirectToAction("Index");
        }
    }
}
