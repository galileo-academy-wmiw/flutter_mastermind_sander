import 'package:flutter/material.dart';

class Scorepin extends StatelessWidget {
  const Scorepin({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          width: 5,
          color: Colors.black,
          style: BorderStyle.solid,
        ),
      ),
    );
  }
}
