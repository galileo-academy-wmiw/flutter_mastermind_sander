import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'variables.dart';
import 'theme.dart';

// The Codepin class build a single codepin. It has a parameter for the index position.
class Codepin extends StatefulWidget {
  final int index;

  Codepin(this.index);

  @override
  State<Codepin> createState() => _CodepinState();
}

class _CodepinState extends State<Codepin> {
  int i = 0;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GestureDetector(
          onTap: (){
            setState(() {
              audioPlayer.play(AssetSource(codePinClickSound));
              i++;
              if (i > 6) i = 1;
              codePinColorSequence[widget.index] = i;
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
        )
    );
  }
}
