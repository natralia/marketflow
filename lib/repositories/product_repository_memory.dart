import 'package:marketflow/models/product.dart';
import 'package:marketflow/repositories/product_repository.dart';

class ProductRepositoryMemory implements ProductRepository {
  List<Product> _products = [];

  @override
  void save(Product product) {
    _products.add(product);
  }

  @override
  Product findOne(int index) {
    return _products.elementAt(index);
  }

  @override
  List<Product> findAll() {
    return _products;
  }

  @override
  void update(int index, Product newProduct) {
    _products[index] = newProduct;
  }

  @override
  void remove(int index) {
    _products.removeAt(index);
  }
}