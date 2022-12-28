import 'package:flutter/material.dart';
import 'package:marketflow/utils/custom_colors.dart';
import 'package:marketflow/widgets/app_bar_widget.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: CustomColors.background,
        appBar: AppBarWidget(),
        
        // body: Container(
        //   child: Center(child: Text("Hello World")),
        // ),
      ),
    );
  }
}
