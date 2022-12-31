import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:marketflow/models/product.dart';
import 'package:marketflow/widgets/quantity_widget.dart';

import '../services/cart.dart';
import '../utils/custom_colors.dart';

class AddProductModalWidget extends StatefulWidget {
  const AddProductModalWidget({super.key, required this.product, required this.clearFields});

  final Product product;
  final void Function() clearFields;

  @override
  State<AddProductModalWidget> createState() => _AddProductModalWidgetState();
}

class _AddProductModalWidgetState extends State<AddProductModalWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 10,
          left: 0,
          right: 0,
          child: Center(
            child: Container(
              height: 4,
              width: 50,
              color: CustomColors.border,
            ),
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 28.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 14.0,
                  ),
                  Text(
                    widget.product.name,
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    widget.product.unitPrice(),
                    style: TextStyle(
                      fontSize: 16.0,
                      color: CustomColors.textSecondary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 1,
              color: CustomColors.border,
            ),
            Container(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  QuantityWidget(
                    initialValue: widget.product.quantity,
                    onChange: (int value) {
                      setState(() {
                        widget.product.quantity = value;
                      });
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Cart.instance.addProduct(widget.product);
                      widget.clearFields();
                      Navigator.of(context).pushNamed("home");
                    },
                    child: Text(
                        widget.product.total(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
