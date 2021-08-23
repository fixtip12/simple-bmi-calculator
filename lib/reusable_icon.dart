import 'package:flutter/material.dart';

const iconTextStyle = TextStyle(
  fontSize: 18.0,
  color: Color(0xFF8D8E98),
);

class ReusableIcon extends StatelessWidget {
  final IconData myIcon;
  final String textData;

  const ReusableIcon({@required this.myIcon, @required this.textData});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          myIcon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          textData,
          style: iconTextStyle,
        ),
      ],
    );
  }
}
