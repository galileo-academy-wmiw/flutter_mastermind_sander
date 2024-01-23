import 'package:flutter/material.dart';

class Scorepin extends StatelessWidget {
  const Scorepin({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 25,
      height: 25,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          width: 5,
          color: const Color.fromRGBO(3, 6, 55, 1),
          style: BorderStyle.solid,
        ),
      ),
    );
  }
}
