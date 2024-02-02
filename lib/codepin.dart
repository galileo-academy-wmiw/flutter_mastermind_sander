import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'variables.dart';
import 'theme.dart';
import 'game_screen.dart';
import 'row_of_pins.dart';

// The Codepin class build a single codepin. It has a parameter for the index position.
class Codepin extends StatefulWidget {
  final int index;
  final bool isActive;

  Codepin(this.index, this.isActive);

  @override
  State<Codepin> createState() => _CodepinState();
}

class _CodepinState extends State<Codepin> {
  int i = 0;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: IgnorePointer(
          ignoring: widget.isActive ? false : true,
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
          ),
        )
    );
  }
}
