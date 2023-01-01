import 'package:marketflow/models/product.dart';

abstract class ProductRepository {
  ProductRepository(void Function() readyNotify);
  Future<void> load();
  void save(Product product);
  Product findOne(int index);
  List<Product> findAll();
  void update(int index, Product newProduct);
  void remove(int index);
}