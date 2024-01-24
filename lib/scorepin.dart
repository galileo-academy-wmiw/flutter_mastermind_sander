import 'package:flutter/material.dart';
import 'package:flutter_mastermind_sander/theme.dart';

class Scorepin extends StatelessWidget {
  const Scorepin({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 25,
      height: 25,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
        border: Border.all(
          width: 4,
          color: textColor,
          style: BorderStyle.solid,
        ),
      ),
    );
  }
}
