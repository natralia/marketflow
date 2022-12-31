import 'package:flutter/widgets.dart';
import 'package:marketflow/models/product.dart';
import 'package:marketflow/repositories/product_repository.dart';
import 'package:marketflow/repositories/product_repository_file.dart';

class Cart extends ChangeNotifier {
  static final instance = Cart(productRepository: ProductRepositoryFile());

  late ProductRepository productRepository;

  Cart({required this.productRepository});

  void addProduct(Product product) {
    productRepository.save(product);

    notifyListeners();
  }

  List<Product> getProducts() => productRepository.findAll();

  Product getProduct(int index) => productRepository.findOne(index);
  
  void updateProduct(int index, Product newProduct) {
    productRepository.update(index, newProduct);

    notifyListeners();
  }

  void removeProduct(int index) {
    productRepository.remove(index);

    notifyListeners();
  }

  double totalPrice() {
    int total = 0;
    for (var product in productRepository.findAll()) {
      total += (product.price * product.quantity);
    }

    return total / 100;
  }
}
