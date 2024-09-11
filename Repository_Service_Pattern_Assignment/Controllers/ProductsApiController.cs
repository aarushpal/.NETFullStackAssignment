
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

using WebApplication7.Models;
using WebApplication7.Services;
using static System.Net.Mime.MediaTypeNames;

namespace WebApplication7.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductsApiController : ControllerBase
    {

        SalesDbContext _context;
        public IProductService _service;


        public ProductsApiController(IProductService service)
        {
            _service = service;
        }


        [HttpGet]
        public IActionResult GetAllProducts()
        {
            return Ok(_service.GetAllProducts());
        }

        [HttpGet("{id}")]
        public IActionResult GetStudentById(int id)
        {
            return Ok(_service.GetProductById(id));
        }

        [HttpPost]
        public IActionResult CreateStudent(Product obj)
        {
            _service.CreateProduct(obj);
            return Ok(new { status = "New product details added in server." });
        }

        [HttpPut]
        public IActionResult EditStudent(Product obj)
        {
            _service.EditProduct(obj);
            return Ok(new { status = "Product details updated in server." });
        }


        [HttpDelete("{id}")]
        public IActionResult DeleteStudentById(int id)
        {
            return Ok(_service.DeleteProductById(id));
            //Product obj = _context.Products.Find(id);

            //if (obj != null)
            //{
            //    _context.Products.Remove(obj);
            //    _context.SaveChanges();
            //    return Ok(new { status = "Product details are deleted from server." });
            //}
            //else
            //{
            //    return NotFound(new { status = "Product student details does not exists." });
            //}
        }
    }
}
