import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'reusable_icon.dart';

// this is a good use of a const, we won't be changing this
// we could not use a constant for something that required our app to be currently running
// eg something that needed to be calculated like a .toString() operation
// this is assigned at compile time, which is fine for a const
const bottomContainerHeight = 80.0;
const reusableCardColour = Color(0xFF1D1E33);
const bottomContainerColour = Color(0xFFEB1555);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: reusableCardColour,
                    cardChild: ReusableIcon(
                      myIcon: FontAwesomeIcons.mars,
                      textData: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardChild: ReusableIcon(
                      myIcon: FontAwesomeIcons.venus,
                      textData: 'FEMALE',
                    ),
                    colour: reusableCardColour,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: reusableCardColour,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: reusableCardColour,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: reusableCardColour,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: bottomContainerColour,
            margin: EdgeInsets.only(top: 10.0),
            // easiest way to expand to full width of the screen
            width: double.infinity,
            height: bottomContainerHeight,
          ),
        ],
      ),
    );
  }
}
