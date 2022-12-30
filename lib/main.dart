import 'package:flutter/material.dart';
import 'package:marketflow/models/product.dart';
import 'package:marketflow/pages/form_page.dart';
import 'package:marketflow/pages/home_page.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
   const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "home": (context) => const HomePage(),
        "form":  (context) => const FormPage(),
      },
      initialRoute: "home",
    );
    
  }
}
