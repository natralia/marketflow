import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:marketflow/models/product.dart';
import 'package:marketflow/utils/custom_colors.dart';

import '../services/cart.dart';
import '../widgets/add_product_modal_widget.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  Product? _product;
  bool _update = false;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameInputController = TextEditingController();
  final _moneyInputController = MoneyMaskedTextController(
    initialValue: 0,
    leftSymbol: "\$",
    decimalSeparator: ".",
  );

  void clearFields() {
    _nameInputController.clear();
    _moneyInputController.updateValue(0);
  }

  void _loadProduct(int? index) {
    if (index != null) {
      _update = true;
      _product = Cart.instance.getProduct(index);
      _nameInputController.text = _product!.name;
      _moneyInputController.value = TextEditingValue(
        text: (_product!.price / 100).toStringAsFixed(2),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    int? index = ModalRoute.of(context)?.settings.arguments as int?;
    _loadProduct(index);

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
                      fontSize: 16.0),
                ),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.chevron_left,
                        color: CustomColors.primary,
                      ),
                    ),
                    IconButton(
                        icon: Icon(Icons.done, color: CustomColors.primary),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            if (_product != null) {
                              _product = Product(
                                name: _nameInputController.text,
                                price: (_moneyInputController.numberValue * 100)
                                    .toInt(),
                                quantity: _product!.quantity,
                              );
                            } else {
                              _product = Product(
                                name: _nameInputController.text,
                                price: (_moneyInputController.numberValue * 100)
                                    .toInt(),
                              );
                            }
                            showModalBottomSheet(
                              context: context,
                              constraints: const BoxConstraints(
                                minHeight: 0,
                              ),
                              builder: (BuildContext context) {
                                return AddProductModalWidget(
                                  currentIndex: index,
                                  product: _product!,
                                  clearFields: clearFields,
                                );
                              },
                            );
                          }
                        },
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
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 6,
                ),
                child: TextFormField(
                  controller: _nameInputController,
                  validator: (value) {
                    var products = Cart.instance.getProducts();

                    if (value!.isEmpty) {
                      return 'Invalid product';
                    } else if (!_update && products.any((product) =>
                        product.name.toLowerCase() == value.toLowerCase())) {
                      return "Existing product";
                    }

                    return null;
                  },
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
                  validator: (args) {
                    if (args!.isEmpty) {
                      return 'Invalid field';
                    } else if (args == "\$0.00") {
                      return 'Invalid price';
                    }
                    return null;
                  },
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
