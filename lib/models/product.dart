import 'package:intl/intl.dart';

class Product {
  String name;
  int price;
  int quantity;

  Product({required this.name, required this.price, this.quantity = 1});

  String total() {
    double totalPrice = (price * quantity) / 100;
    return NumberFormat.currency(locale: "en_US", symbol: "\$ ").format(totalPrice);
  }

  String unitPrice() {
    return NumberFormat.currency(locale: "en_US", symbol: "\$ ").format(price / 100);
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      name: map['name']!,
      price: map['price'],
      quantity: map['quantity'],
    );
  }


  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "price": price,
      "quantity": quantity,
    };
  }
}