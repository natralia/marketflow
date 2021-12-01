import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:marketflow/models/product.dart';

import 'package:marketflow/services/cart_service.dart';
import 'package:marketflow/utils/custom_colors.dart';
import 'package:marketflow/widgets/add_product_modal_widget.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  Product? _product;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();
  final _moneyInputController = MoneyMaskedTextController(
    leftSymbol: "R\$",
    decimalSeparator: ",",
  );

  void _loadProduct(int? index) {
    if (index != null) {
      _product = CartService.instance.getProduct(index);
      _controller.text = _product!.name;
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
        preferredSize: Size.fromHeight(60),
        child: Container(
          child: SafeArea(
            child: Stack(
              children: [
                Center(
                  child: Text(
                    'Adicionar produto',
                    style: TextStyle(
                      color: CustomColors.textPrimary,
                      fontWeight: FontWeight.w400,
                      fontSize: 16.0,
                    ),
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
                                name: _controller.text,
                                price: (_moneyInputController.numberValue * 100)
                                    .toInt(),
                                quantity: _product!.quantity,
                              );
                            } else {
                              _product = Product(
                                name: _controller.text,
                                price: (_moneyInputController.numberValue * 100)
                                    .toInt(),
                              );
                            }
                            showModalBottomSheet(
                              context: context,
                              constraints: BoxConstraints(
                                minHeight: 0,
                              ),
                              builder: (BuildContext context) {
                                return AddProductModalWidget(
                                  currentIndex: index,
                                  product: _product!,
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
                  controller: _controller,
                  validator: (value) {
                    var products = CartService.instance.getProducts();

                    if (value!.isEmpty) {
                      return 'Produto inválido';
                    } else if (products.any((product) =>
                        product.name.toLowerCase() == value.toLowerCase())) {
                      return "Produto já existente";
                    }

                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Nome',
                    helperText: 'Nome do produto',
                    border: OutlineInputBorder(),
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
                      return 'Campo inválido';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Preço',
                    helperText: 'Preço do produto',
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: CustomColors.primary,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              //
            ],
          ),
        ),
      ),
      floatingActionButton: index != null
          ? FloatingActionButton(
              child: Icon(
                Icons.delete,
                color: Colors.white,
              ),
              backgroundColor: Color(0xFFFF6C6C),
              onPressed: () {
                CartService.instance.removeProduct(index);
                Navigator.of(context).pop();
              },
            )
          : null,
    );
  }
}
