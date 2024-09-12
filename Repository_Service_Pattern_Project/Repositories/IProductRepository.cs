using WebApplication7.Models;

namespace WebApplication7.Repositories
{
    public interface IProductRepository
    {
        List<Product> GetAllProducts();
        void CreateProduct(Product obj);
        Product GetProductById(int id);

        List<Product> GetProductsByCategory(string category);
        List<Product> GetOutOfStockProducts();
        List<Product> GetProductsBetweenPriceRange(int lowerPriceLimit, int upperPriceLimit);

        List<string> GetProductsCategoryNames();

        void EditProduct(Product obj);
        string DeleteProductById(int id);
    }
}
