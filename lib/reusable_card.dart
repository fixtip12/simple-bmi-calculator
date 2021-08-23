import 'package:flutter/material.dart';
import 'constants.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.colour, this.cardChild, this.gestureDetector});

  // the value of a const or final can't be changed after it's created, they are immutable
  // a const can't be assigned to anything that would be created or changed after compile time
  // eg our 'Color' variable below could not be a const, because a new reusableCard could be created after compile time
  // we specify 'final' because a StatelessWidget is immutable
  // when an immutable widget's property changes, the object is destroyed and remade

  final Color colour;
  final Widget cardChild;
  final Function gestureDetector;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: gestureDetector,
      child: Container(
        child: cardChild,
        // this is shorthand for using color within decoration: BoxDecoration
        // can't have both
        // -- color: Color(0xFF1D1E33), --
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
