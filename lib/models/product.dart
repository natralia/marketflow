import 'package:intl/intl.dart';

class Product {
  String name;
  int price;
  int quantity;

  Product({required this.name, required this.price, this.quantity = 1});

  String totalPrice() {
    double totalPrice = price * quantity / 100;
    return NumberFormat.currency(locale: "pt_BR", symbol: "R\$")
        .format(totalPrice);
  }

  String unitPrice() {
    return NumberFormat.currency(locale: "pt_BR", symbol: "R\$")
        .format(price / 100);
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
      "name": this.name,
      "price": this.price,
      "quantity": this.quantity,
    };
  }
}
