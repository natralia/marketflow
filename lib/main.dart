import 'package:flutter/material.dart';
import 'package:marketflow/pages/form_page.dart';
import 'package:marketflow/pages/home_page.dart';
import 'package:marketflow/pages/splash_screen_page.dart';
import 'package:marketflow/routes.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splash,
      routes: {
        Routes.home: (context) => HomePage(),
        Routes.form: (context) => FormPage(),
        Routes.splash: (context) => SplashScreenPage(),
      },
    );
  }
}
