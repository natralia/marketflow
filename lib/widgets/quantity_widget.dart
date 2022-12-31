import 'package:flutter/material.dart';

import '../utils/custom_colors.dart';

class QuantityWidget extends StatefulWidget {
  final int? initialValue;
  final void Function(int value)? onChange;
  const QuantityWidget({super.key, this.initialValue, this.onChange});

  @override
  State<QuantityWidget> createState() => _QuantityWidgetState();
}

class _QuantityWidgetState extends State<QuantityWidget> {
    int _value = 1;

  set value(int value) {
    if (value >= 1) {
      setState(() {
        _value = value;
        widget.onChange!(_value);
      });
    }
  }

  @override
  void initState() {
    if (widget.initialValue != null) {
      _value = widget.initialValue!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120.0,
      decoration: BoxDecoration(
        border: Border.all(color: CustomColors.border, width: 1),
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            top: 0,
            right: 0,
            left: 0,
            child: Center(
              child: Text(
                "$_value",
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                splashRadius: 20.0,
                disabledColor: CustomColors.border,
                onPressed: _value == 1
                    ? null
                    : () {
                        value = _value - 1;
                      },
                icon: Icon(
                  Icons.remove,
                  color: _value == 1
                      ? CustomColors.disabled
                      : CustomColors.primary,
                ),
              ),
              IconButton(
                splashRadius: 20.0,
                onPressed: () {
                  value = _value + 1;
                },
                icon: Icon(
                  Icons.add,
                  color: CustomColors.primary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}