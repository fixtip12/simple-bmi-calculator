import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'reusable_icon.dart';
import 'constants.dart';
import 'calculator_brain.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  kGender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 18;

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
                    colour: kActiveCardColour,
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
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    cardChild: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'WEIGHT',
                            style: kIconTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kBmiTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                changeWeight: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                              SizedBox(width: 15.0),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                changeWeight: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('AGE', style: kIconTextStyle),
                        Text(age.toString(), style: kBmiTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              changeWeight: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(width: 15.0),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              changeWeight: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmiResult: calc.calculateBMI(),
                    resultText: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                  ),
                ),
              );
            },
            child: Container(
              color: kBottomContainerColour,
              margin: EdgeInsets.only(top: 10.0),
              // easiest way to expand to full width of the screen
              width: double.infinity,
              height: kBottomContainerHeight,
              padding: EdgeInsets.only(bottom: 10.0),
              child: Center(
                  child: Text('CALCULATE', style: kLargeButtonTextStyle)),
            ),
          ),
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({this.icon, this.changeWeight});
  final IconData icon;
  final Function changeWeight;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: changeWeight,
      child: Icon(icon),
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
