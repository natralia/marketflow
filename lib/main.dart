import 'package:flutter/material.dart';
import 'package:marketflow/pages/form_page.dart';
import 'package:marketflow/pages/home_page.dart';
import 'package:marketflow/utils/custom_colors.dart';

void main() {
  runApp(const App());
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
      theme: ThemeData(
        colorScheme: ColorScheme.light(primary: CustomColors.primary),
      ),
      initialRoute: "home",
    );
    
  }
}
