import 'package:marketflow/models/product.dart';

abstract class ProductRepository {
  void save(Product product);
  Product findOne(int index);
  List<Product> findAll();
  void update(int index, Product newProduct);
  void remove(int index);
}