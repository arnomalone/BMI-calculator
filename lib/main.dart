import 'package:flutter/material.dart';
import 'input_page.dart';
import 'package:flutter/services.dart';
import 'constance.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: ColorClass.kBottomContainerColor, // navigation bar color
      statusBarColor: ColorClass.kBackgroundColor, // status bar color
    ));
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          primaryColor: ColorClass.kBackgroundColor,
          scaffoldBackgroundColor: ColorClass.kBackgroundColor,
      ),
      home: InputPage(),
    );
  }
}

