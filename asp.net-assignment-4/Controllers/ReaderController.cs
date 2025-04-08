using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using asp.net_assignment_4.Models;
using asp.net_assignment_4.Data;

namespace asp.net_assignment_4.Controllers
{
    public class ReaderController : Controller
    {
        private readonly AppDbContext appDbContext;

        public ReaderController(AppDbContext appDbContext)
        {
            this.appDbContext = appDbContext;
        }

        // Get all readers
        [HttpGet]
        [Route("readers")]
        public async Task<IActionResult> Index(string search)
        {
            var readers = from r in appDbContext.Reader
                          select r;

            if (!string.IsNullOrEmpty(search))
            {
                readers = readers.Where(r => r.Name.Contains(search) ||
                                             r.Email.Contains(search));
            }

            return View(await readers.ToListAsync());
        }

        // Get certain reader
        [HttpGet]
        [Route("readers/{id}")]
        public async Task<IActionResult> Details(int id)
        {
            return View(await appDbContext.Reader
                .Include(r => r.Borrowings)
                .ThenInclude(br => br.Book)
                .FirstOrDefaultAsync(r => r.Id == id));
        }

        // Get reader add page
        [HttpGet]
        [Route("readers/add")]
        public IActionResult Add()
        {
            return View();
        }

        [HttpPost]
        [Route("readers/add")]
        public async Task<IActionResult> Add(Reader reader)
        {
            if (ModelState.IsValid)
            {
                var newReader = new Reader()
                {
                    Name = reader.Name,
                    Email = reader.Email,
                    PhoneNumber = reader.PhoneNumber,
                    Address = reader.Address
                };
                await appDbContext.AddAsync(newReader);
                await appDbContext.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            return View(reader);
        }

        // Get reader edit page
        [HttpGet]
        [Route("readers/edit/{id}")]
        public async Task<IActionResult> Edit(int id)
        {
            return View(await appDbContext.Reader.FirstOrDefaultAsync(r => r.Id == id));
        }

        // edit reader
        [HttpPost]
        [Route("readers/edit/{id}")]
        public async Task<IActionResult> Edit(Reader newReader)
        {
            if (ModelState.IsValid)
            {
                var reader = await appDbContext.Reader.FindAsync(newReader.Id);
                if (reader != null)
                {
                    reader.Name = newReader.Name;
                    reader.Email = newReader.Email;
                    reader.PhoneNumber = newReader.PhoneNumber;
                    reader.Address = newReader.Address;
                    await appDbContext.SaveChangesAsync();
                    return RedirectToAction("Index");
                }
            }
            return View(newReader);
        }

        // Delete reader
        [HttpGet]
        [Route("readers/delete/{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            var reader = await appDbContext.Reader.FindAsync(id);
            if (reader != null)
            {
                appDbContext.Reader.Remove(reader);
                await appDbContext.SaveChangesAsync();
            }
            return RedirectToAction("Index");
        }
    }
}
