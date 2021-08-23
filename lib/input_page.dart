import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'reusable_icon.dart';
import 'constants.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  kGender selectedGender;
  int height = 180;

  void setGender(kGender myGender) {
    setState(() {
      selectedGender = myGender;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: selectedGender == kGender.male
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    cardChild: ReusableIcon(
                      myIcon: FontAwesomeIcons.mars,
                      textData: 'MALE',
                    ),
                    gestureDetector: () {
                      setState(() {
                        selectedGender = kGender.male;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardChild: ReusableIcon(
                      myIcon: FontAwesomeIcons.venus,
                      textData: 'FEMALE',
                    ),
                    colour: selectedGender == kGender.female
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    gestureDetector: () {
                      setState(() {
                        selectedGender = kGender.female;
                      });
                    },
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
                    colour: kInactiveCardColour,
                    cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'HEIGHT',
                            style: kIconTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            // this needs to be set when we have text being affected by the crossAxisAlignment
                            textBaseline: TextBaseline.alphabetic,
                            children: <Widget>[
                              Text(
                                height.toString(),
                                style: kBmiTextStyle,
                              ),
                              Text(
                                ' cm',
                                style: kIconTextStyle,
                              ),
                            ],
                          ),
                          // We can embed widgets within other widgets like this to customise their theme
                          Slider(
                            value: height.toDouble(),
                            min: 120.0,
                            max: 220.0,
                            onChanged: (double newValue) {
                              // newValue is the value the slider is passing to us
                              // we need setState so we can update the state of our parent
                              setState(() {
                                height = newValue.round();
                              });
                            },
                          ),
                        ]),
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
                    colour: kInactiveCardColour,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kInactiveCardColour,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: kBottomContainerColour,
            margin: EdgeInsets.only(top: 10.0),
            // easiest way to expand to full width of the screen
            width: double.infinity,
            height: kBottomContainerHeight,
          ),
        ],
      ),
    );
  }
}
