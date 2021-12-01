import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:marketflow/models/product.dart';
import 'package:marketflow/repositories/Product_repository.dart';
import 'package:marketflow/repositories/product_repository_file.dart';

class CartService extends ChangeNotifier {
  static final instance =
      CartService(productRepository: ProductRepositoryFile());

  ProductRepository productRepository;

  CartService({required this.productRepository});

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

  String totalPrice() {
    int totalPrice = 0;
    for (Product product in productRepository.findAll()) {
      totalPrice += (product.price * product.quantity);
    }
    return NumberFormat.currency(locale: "pt_BR", symbol: "R\$")
        .format(totalPrice / 100);
  }
}
