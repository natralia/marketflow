import 'package:flutter/widgets.dart';
import 'package:marketflow/models/product.dart';

class Cart extends ChangeNotifier {
  static final instance = Cart();

  final List<Product> _products = [];

  void addProduct(Product product) {
    _products.add(product);
    notifyListeners();
  }

  List<Product> listProduct() {
    return _products;
  }

  Product getProduct(index) {
    return _products[index];
  }

  double totalPrice() {
    int total = 0;
    for (var product in _products) {
      total += (product.price * product.quantity);
    }

    return total / 100;
  }
}
