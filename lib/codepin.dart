import 'package:flutter/material.dart';
import 'package:flutter_mastermind_sander/theme.dart';

class Codepin extends StatefulWidget {
  const Codepin({super.key});

  @override
  State<Codepin> createState() => _CodepinState();
}

class _CodepinState extends State<Codepin> {

  // Color List
  List<Color> colorList = [
    codePinColor0,
    codePinColor1,
    codePinColor2,
    codePinColor3,
    codePinColor4,
    codePinColor5,
    codePinColor6
  ];

  int i = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          i++;
          if (i > 6) i = 1;
        });
      },
      child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: colorList[i],
              shape: BoxShape.circle,
              border: Border.all(
                width: 7.5,
                color: textColor,
                style: BorderStyle.solid,
              ),
          ),
      ),
    );
  }
}
