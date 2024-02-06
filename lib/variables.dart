import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

// VARIABLES
// Text styles
const TextStyle buttonTextStyle = TextStyle(
  fontFamily: 'DMMono',
  color: secondaryColor,
);
const TextStyle appBarTextStyle = TextStyle(
  fontFamily: 'DMMono',
  color: backgroundColor,
);
const TextStyle pTextStyle = TextStyle(
  fontFamily: 'DMMono',
  color: textColor,
);

// Colors
const primaryColor = Color.fromRGBO(196, 153, 243, 1);
const secondaryColor = Color.fromRGBO(115, 96, 223, 1);
const lightColor = Color.fromRGBO(242, 175, 239, 1);
const textColor = Color.fromRGBO(51, 24, 107, 1);
const backgroundColor = Color.fromRGBO(255, 255, 255, 1.0);

const codePinColor0 = backgroundColor;
const codePinColor1 = Color.fromRGBO(242, 153, 153, 1.0);
const codePinColor2 = Color.fromRGBO(153, 202, 242, 1.0);
const codePinColor3 = Color.fromRGBO(153, 242, 181, 1.0);
const codePinColor4 = Color.fromRGBO(239, 242, 153, 1.0);
const codePinColor5 = Color.fromRGBO(209, 153, 242, 1.0);
const codePinColor6 = Color.fromRGBO(242, 193, 153, 1.0);

const scorePinColor0 = Color.fromRGBO(242, 153, 153, 1.0);
const scorePinColor1 = Color.fromRGBO(242, 227, 153, 1.0);
const scorePinColor2 = Color.fromRGBO(153, 242, 181, 1);

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

// Codepin Color Sequence
List<int> codePinColorSequence = [0, 0, 0, 0];

// Initialize instance of AudioPlayer
final AudioPlayer audioPlayer = AudioPlayer();

const codePinClickSound = 'audio/punchy-taps-ui-9-183908.mp3';
const startUpSound = 'audio/90s-game-ui-6-185099.mp3';

// SETTINGS
// Number of tries
double numOfTries = 12;

//PainterClass
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