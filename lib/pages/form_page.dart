import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:marketflow/models/product.dart';
import 'package:marketflow/utils/custom_colors.dart';

import '../services/cart.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();
  final _moneyInputController = MoneyMaskedTextController(
    leftSymbol: "\$",
    decimalSeparator: ".",
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: SafeArea(
          child: Stack(
            children: [
              Center(
                child: Text(
                  "Add product",
                  style: TextStyle(
                    color: CustomColors.textPrimary,
                    fontWeight: FontWeight.w400,
                    fontSize: 16.0
                  ),
                ),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: (){
                        Navigator.of(context).pop();
                      }, 
                      icon: Icon(
                        Icons.chevron_left,
                        color: CustomColors.primary,
                      ),
                    ),
                    IconButton(
                      onPressed: (){
                        Cart.instance.addProduct(Product(name: _controller.text, price: _moneyInputController.numberValue.toInt()));
                      }, 
                      icon: Icon(
                        Icons.done,
                        color: CustomColors.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children:  [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 6,
                  ),
                  child: TextFormField(
                    controller: _controller,
                  decoration: InputDecoration(
                    labelText: "Name",
                    helperText: "Product name",
                    border: const OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: CustomColors.primary,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.name,
                  textCapitalization: TextCapitalization.words,
                  ),
                ),
                 Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 6,
                  ),
                  child: TextFormField(
                      controller: _moneyInputController,
                    decoration: InputDecoration(
                      labelText: "Price",
                      helperText: "Product price",
                      border: const OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: CustomColors.primary,
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}