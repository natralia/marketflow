import 'package:flutter/widgets.dart';
import 'package:marketflow/models/product.dart';

class Cart extends ChangeNotifier {
  static final instance = Cart();

  final List<Product> _products = [];

  void addProduct(Product product){
    _products.add(product);
  }

  List<Product> listProduct(){
    return _products;
  }

  Product getProduct(index){
    return _products[index];
  }
}