import 'package:flutter/material.dart';
import 'input_page.dart';

void main() => runApp(BMICalculator());

// the main.dart file should contain most of the theming, then direct towards the first screen
// for every subsequent screen, we'll have a separate dart file
class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // .copyWith() allows us to use a default theme while overriding certain aspects
      // you can also wrap individual widgets with a Theme widget and provide the 'data' property to change them specifically
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      home: InputPage(),
    );
  }
}
