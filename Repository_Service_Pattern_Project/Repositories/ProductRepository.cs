using WebApplication7.Models;
using System.Linq;

namespace WebApplication7.Repositories
{
    public class ProductRepository : IProductRepository
    {
        public SalesDbContext _context;

        public ProductRepository(SalesDbContext context)
        {
            _context = context;
        }
        public List<Product> GetAllProducts() {
            List<Product> Products = _context.Products.ToList();
            return Products;
        }

        public void CreateProduct(Product obj) {
            _context.Products.Add(obj);
            _context.SaveChanges();
        }
        public Product GetProductById(int id) {
            Product obj = _context.Products.Find(id);

            if (obj != null)
            {
                return obj;
            }
            else
            {
                return null;
            }
        }

        public List<Product> GetProductsByCategory(string category)
        {
            return _context.Products.Where(p => p.Category == category).ToList();
        }

        public List<Product> GetOutOfStockProducts() {
            return _context.Products.Where(p => p.Quantity <= 0).ToList();
        }

        public List<Product> GetProductsBetweenPriceRange(int lowerPriceLimit, int upperPriceLimit)
        {
            return _context.Products.Where(p => p.UnitPrice >= lowerPriceLimit && p.UnitPrice <= upperPriceLimit).ToList();
        }

        public List<string> GetProductsCategoryNames()
        {
            return _context.Products.Select(p => p.Category).Distinct().ToList();
        }
        public void EditProduct(Product obj) {
            _context.Products.Update(obj);
            _context.SaveChanges();
        }

        public string DeleteProductById(int id) {
            Product obj = _context.Products.Find(id);

            if (obj != null)
            {
                _context.Products.Remove(obj);
                _context.SaveChanges();
                return "Product details are deleted from server.";
            }
            else
            {
                return "Product details does not exists.";
            }
        }
    }
}
