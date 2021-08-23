import 'package:flutter/material.dart';

const kIconTextStyle = TextStyle(
  fontSize: 18.0,
  color: Color(0xFF8D8E98),
);

const kBmiTextStyle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.w900,
);

const kLargeButtonTextStyle = TextStyle(
  fontSize: 25.0,
  fontWeight: FontWeight.bold,
);

// this is a good use of a const, we won't be changing this
// we could not use a constant for something that required our app to be currently running
// eg something that needed to be calculated like a .toString() operation
// this is assigned at compile time, which is fine for a const
const kBottomContainerHeight = 80.0;
const kActiveCardColour = Color(0xFF1D1E33);
const kInactiveCardColour = Color(0XFF111328);
const kBottomContainerColour = Color(0xFFEB1555);
enum kGender { male, female }
