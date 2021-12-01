import 'package:flutter/material.dart';
import 'package:marketflow/routes.dart';
import 'package:marketflow/services/cart_service.dart';
import 'package:marketflow/utils/custom_colors.dart';
import 'package:marketflow/widgets/app_bar_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: CartService.instance,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: CustomColors.background,
          appBar: AppBarWidget(
            totalPrice: CartService.instance.totalPrice(),
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(
              Icons.add_shopping_cart,
              color: Colors.white,
            ),
            backgroundColor: CustomColors.primary,
            onPressed: () {
              Navigator.of(context).pushNamed(Routes.form);
            },
          ),
          body: ListView.separated(
            padding: EdgeInsets.symmetric(
              horizontal: 30.0,
            ),
            itemCount: CartService.instance.getProducts().length,
            itemBuilder: (context, i) {
              return ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 0),
                onTap: () {
                  Navigator.of(context).pushNamed(Routes.form, arguments: i);
                },
                title: Text(CartService.instance.getProduct(i).name),
                subtitle: Text(
                  "${CartService.instance.getProduct(i).unitPrice()} "
                  "x${CartService.instance.getProduct(i).quantity}",
                  style: TextStyle(fontSize: 13.0),
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
