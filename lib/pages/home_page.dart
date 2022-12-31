import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/product.dart';
import '../services/cart.dart';
import '../utils/custom_colors.dart';
import '../widgets/app_bar_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: Cart.instance, 
        builder: (context, child) {
          return Scaffold(
          backgroundColor: CustomColors.background,
          appBar: AppBarWidget(
            totalPrice: NumberFormat.currency(locale: "en_US", symbol: "\$ ").format(Cart.instance.totalPrice()),
          ),
          floatingActionButton: FloatingActionButton(
              backgroundColor: CustomColors.primary,
              onPressed: () {
                Navigator.of(context).pushNamed("form");
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
              itemCount: Cart.instance.getProducts().length,
              itemBuilder: (context, i) {
                return ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                  onTap: () {
                    Navigator.of(context).pushNamed("form", arguments: i);
                  },
                  title: Text(Cart.instance.getProduct(i).name),
                  subtitle: Row(
                    children: [
                      Text(
                        Cart.instance.getProduct(i).unitPrice(),
                        style: const TextStyle(fontSize: 13.0),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: Text(
                          "x${Cart.instance.getProduct(i).quantity}",
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
        );
        },
    );
  }
}