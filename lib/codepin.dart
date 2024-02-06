import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'variables.dart';
import 'theme.dart';


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
        child: Center(
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
                height: 80,
                width: 80,
                child: CustomPaint(
                  painter: PainterTest(colorList[i]),
                  size: Size(50, 50),
                ),
              )
            ),
          ),
        )
    );
  }
}

class PainterTest extends CustomPainter{
  final Color pinColor;
  PainterTest(this.pinColor);

  void paint (Canvas canvas, Size size){
    final paint = Paint();
    paint.color = textColor;
    var c = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(c, size.width / 2, paint);
    paint.color = pinColor;
    canvas.drawCircle(c, size.width / 2.4, paint);

  }
  bool shouldRepaint (CustomPainter oldDelegate) {
    return true;
  }
}