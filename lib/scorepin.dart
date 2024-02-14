import 'package:flutter/material.dart';
import 'variables.dart';
import 'row_of_pins.dart';

class Scorepin extends StatelessWidget {
  final int index;
  final bool isActive;
  Scorepin({super.key, required this.index, required this.isActive});

  @override
  Widget build(BuildContext context) {
    if (isActive) {
      return Container(
        width: 25,
        height: 25,
      );
    } else {
      return Container(
        width: 25,
        height: 25,
        child: CustomPaint(
          painter: PainterTestCodePin(
              scorePinColorList[controlValues[index]],
              controlValues[index].toString(),
              scorePinTextStyle),
          size: Size(25, 25),
        ),
      );
    }
  }
}
