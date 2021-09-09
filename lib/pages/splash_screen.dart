import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
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
                  color: Color(0xff767676),
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
