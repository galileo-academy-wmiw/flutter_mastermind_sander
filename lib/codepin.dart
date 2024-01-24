import 'package:flutter/material.dart';
import 'package:flutter_mastermind_sander/theme.dart';

class Codepin extends StatelessWidget {
  const Codepin({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: backgroundColor,
            shape: BoxShape.circle,
            border: Border.all(
              width: 7.5,
              color: textColor,
              style: BorderStyle.solid,
            ),
        ),
    );
  }
}
