import 'package:flutter/material.dart';
import 'variables.dart';

class Scorepin extends StatelessWidget {
  const Scorepin({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 25,
      height: 25,
      child: CustomPaint(
        painter: PainterTest(backgroundColor),
        size: Size(25, 25),
      ),
    );
  }
}
