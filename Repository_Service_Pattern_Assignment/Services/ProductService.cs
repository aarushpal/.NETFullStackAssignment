using WebApplication7.Models;
using WebApplication7.Repositories;

namespace WebApplication7.Services
{
    public class ProductService : IProductService
    {
        public IProductRepository _repository;
        public ProductService(IProductRepository repository)
        {
            _repository = repository;
        }

        public List<Product> GetAllProducts()
        {
            return _repository.GetAllProducts();
        }

        public void CreateProduct(Product obj) {
            _repository.CreateProduct(obj);
        }
        public Product GetProductById(int id) {
            Product product = _repository.GetProductById(id);
            return product;
        }
        public void EditProduct(Product obj) {
            _repository.EditProduct(obj);
        }
        public string DeleteProductById(int id) {
            return _repository.DeleteProductById(id);
        }

    }
}
