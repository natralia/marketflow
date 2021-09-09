import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:marketflow/routes.dart';
import 'package:marketflow/utils/custom_colors.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    Timer(Duration(seconds: 4), () {
      Navigator.of(context).pushNamed(Routes.home);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Center(
            child: Container(
              child: Lottie.asset('assets/cart_animation.json'),
            ),
          ),
          Positioned(
            right: 0,
            left: 0,
            bottom: 40,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                'MARKETFLOW',
                style: TextStyle(
                  color: CustomColors.textPrimary,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  letterSpacing: 2,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
