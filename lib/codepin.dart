import 'package:flutter/material.dart';

class Codepin extends StatelessWidget {
  const Codepin({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(
              width: 15,
              color: Colors.black,
              style: BorderStyle.solid,
            ),
        ),
    );
  }
}
