import 'package:flutter/material.dart';
import 'package:marketflow/utils/custom_colors.dart';


class AppBarWidget extends PreferredSize {
  final String totalPrice;
  AppBarWidget({super.key, required this.totalPrice})
  : super(
    preferredSize: const Size.fromHeight(160),
    child: Stack(
      children: [
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          bottom: 39,
          child: Container(
            decoration: BoxDecoration(
              gradient: CustomColors.linearPrimary,
            ),
            child: const Center(
              child: Text(
                'MARKETFLOW',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16.0,
                  letterSpacing: 2.0,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: CustomColors.border,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(4.0),
                color: Colors.white,
              ),
              height: 78.0,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 12.0,
                  horizontal: 20.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Amount",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        color: CustomColors.textPrimary
                      ),
                    ),
                    Text(
                      totalPrice,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: CustomColors.textPrimary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}