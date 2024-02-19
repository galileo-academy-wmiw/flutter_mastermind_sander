import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'variables.dart';
import 'game_screen.dart';


// The Codepin class build a single codepin. It has a parameter for the index position.
class Codepin extends StatefulWidget {
  final int index;
  final bool isActive;
  final int startValue;

  Codepin({this.index = 0, this.isActive = true, this.startValue = 0});

  @override
  State<Codepin> createState() => _CodepinState();
}

class _CodepinState extends State<Codepin> {
  int i = 0;

  @override
  Widget build(BuildContext context) {
    if (widget.startValue != 0) i = widget.startValue;
    return Expanded(
        child: Center(
          child: IgnorePointer(
            ignoring: widget.isActive ? false : true,
            child: GestureDetector(
              onTap: (){
                setState(() {
                  if (isSoundOn) {
                    audioPlayer.play(AssetSource(codePinClickSound));
                  }
                  i++;
                  if (i > 6) i = 1;
                  codePinColorSequence[widget.index] = i;
                });
              },
              child: Container(
                height: 80,
                width: 80,
                child: CustomPaint(
                  painter: PainterTestCodePin(codePinColorList[i], i.toString(), codePinTextStyle),
                  size: Size(50, 50),
                ),
              )
            ),
          ),
        )
    );
  }
}

