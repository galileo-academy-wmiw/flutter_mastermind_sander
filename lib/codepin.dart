import 'package:flutter/material.dart';

class Codepin extends StatelessWidget {
  const Codepin({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(
              width: 10,
              color: const Color.fromRGBO(3, 6, 55, 1),
              style: BorderStyle.solid,
            ),
        ),
    );
  }
}
