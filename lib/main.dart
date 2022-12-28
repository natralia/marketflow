import 'package:flutter/material.dart';
import 'package:marketflow/models/product.dart';
import 'package:marketflow/utils/custom_colors.dart';
import 'package:marketflow/widgets/app_bar_widget.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
   App({super.key});
  
  final List<Product> _products = [
    Product(name: "Rice", price: 299, quantity: 3),
    Product(name: "Bean", price: 199),
    Product(name: "Sweet Potato", price: 199),
  ];

  @override
  Widget build(BuildContext context) {
     
    return MaterialApp(
      home: Scaffold(
        backgroundColor: CustomColors.background,
        appBar: AppBarWidget(),
        floatingActionButton: FloatingActionButton(
            backgroundColor: CustomColors.primary,
            onPressed: () {
              // Navigator.of(context).pushNamed(Routes.form);
            },
            child: const Icon(
              Icons.add_shopping_cart,
              color: Colors.white,
            ),
          ),
        body: ListView.separated(
            padding: const EdgeInsets.symmetric(
              horizontal: 30.0,
            ),
            itemCount: _products.length,
            itemBuilder: (context, i) {
              return ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                // onTap: () {
                //   Navigator.of(context).pushNamed(Routes.form, arguments: i);
                // },
                title: Text(_products[i].name),
                subtitle: Row(
                  children: [
                    Text(
                      "\$ ${_products[i].price}",
                      style: const TextStyle(fontSize: 13.0),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: Text(
                        "x${_products[i].quantity}",
                        style: const TextStyle(fontSize: 13.0),
                      ),
                    )
                  ],
                ),
                trailing: Icon(
                  Icons.chevron_right,
                  color: CustomColors.textSecondary,
                ),
              );
            },
            separatorBuilder: (context, i) {
              return Divider(
                color: CustomColors.border,
              );
            },
          ),
      ),
    );
  }
}
