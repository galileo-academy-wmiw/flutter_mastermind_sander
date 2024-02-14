import 'package:flutter/material.dart';
import 'variables.dart';
import 'row_of_pins.dart';
import 'dart:async';

class Scorepin extends StatefulWidget {
  final int index;
  final bool isActive;
  Scorepin({super.key, required this.index, required this.isActive});

  @override
  State<Scorepin> createState() => _ScorepinState();
}

class _ScorepinState extends State<Scorepin> {

  @override
  Widget build(BuildContext context) {
    if (!widget.isActive) {
      return Container(
        width: 25,
        height: 25,
        child: CustomPaint(
          painter: PainterTestCodePin(
              scorePinColorList[controlValues[widget.index]],
              controlValues[widget.index].toString(),
              scorePinTextStyle),
          size: Size(25, 25),
        ),
      );
    } else {
      return Container(
        width: 25,
        height: 25,
      );
    }
  }
}
