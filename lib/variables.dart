import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'widgets/row_of_pins.dart';
import 'screens/game_screen.dart';

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
const TextStyle codePinTextStyle = TextStyle(
  fontFamily: 'DMMono',
  color: textColor,
  fontSize: 20
);
const TextStyle scorePinTextStyle = TextStyle(
    fontFamily: 'DMMono',
    color: textColor,
    fontSize: 12
);

// Colors
const primaryColor = Color.fromRGBO(196, 153, 243, 1);
const secondaryColor = Color.fromRGBO(115, 96, 223, 1);
const lightColor = Color.fromRGBO(242, 175, 239, 1);
const textColor = Color.fromRGBO(51, 24, 107, 1);
const backgroundColor = Color.fromRGBO(255, 255, 255, 1.0);
const winStateColor = Color.fromRGBO(74, 236, 127, 1.0);

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
List<Color> codePinColorList = [
  codePinColor0,
  codePinColor1,
  codePinColor2,
  codePinColor3,
  codePinColor4,
  codePinColor5,
  codePinColor6
];

List<Color> scorePinColorList = [
  scorePinColor0,
  scorePinColor1,
  scorePinColor2
];

// Codepin Color Sequence
List<int> codePinColorSequence = [0, 0, 0, 0];

// Initialize secret code
List<int> secretCode = [];

// Initialize control values list
List<int> controlValues = [];

// High Score Table
List<TableRow> highScores = [];

var tableRowHighScore = (highScore) {
  return TableRow(
      children: <Widget>[
        Container(
            alignment: Alignment.center,
            height: 20,
            child: Text(highScore[0].toString())),
        Container(
            alignment: Alignment.center,
            height: 20,
            child: Text(highScore[1].toString()))
      ]
  );
};

List<List<String>> highScoresValues = [];
List<String> highScoresStringList = [];

String formattedDate = '';
String highScoreNumValue = '';

Future<dynamic> saveList(String name, List<String> list) async {
  final prefs = await SharedPreferences.getInstance();
  for(final s in list) print(s);
  prefs.setStringList(name, list);
}

Future<List<String>?> readList<T>(String name) async {
  final prefs = await SharedPreferences.getInstance();
  final list = prefs.getStringList(name);
  return list;
}

// Initialize instance of AudioPlayer
final AudioPlayer audioPlayer = AudioPlayer();

const codePinClickSound = 'audio/punchy-taps-ui-9-183908.mp3';
const startUpSound = 'audio/90s-game-ui-6-185099.mp3';


List<Widget> allRows = [];

// Global functions
void makeNewRowOfPins() {
  allRows.add(RowOfPins());
  print('Row Added. Total Rows:${allRows.length}. Tries left: ${numOfTries - (allRows.length - 1)}');
}

void resetGameState() {
  winStateAchieved = false;
  secretCode = createNewCodeSnippet();
  allRows.clear();
  allRows.add(RowOfPins());
}

bool winStateAchieved = false;

// SETTINGS
// Number of tries
double numOfTries = 12;
// Sound on/off
bool isSoundOn = true;
// Colorblind mode on/off
bool isColorBlindModeOn = false;
// Dev Mode
bool isDevModeOn = false;

// Store settings with Shared Preferences
Future<dynamic> saveBool(String name, var value) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setBool(name, value);
}

Future<dynamic> saveDouble(String name, var value) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setDouble(name, value);
}

Future<bool> readBool(String name, bool initBool) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getBool(name) ?? initBool;
}

Future<double> readDouble(String name, double initDouble) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getDouble(name) ?? initDouble;
}

//PainterClass
class PainterTestCodePin extends CustomPainter{
  final Color pinColor;
  final String pinNum;
  final TextStyle textStyle;
  PainterTestCodePin(this.pinColor, this.pinNum, this.textStyle);

  void paint (Canvas canvas, Size size){
    final paint = Paint();
    final textPainter = TextPainter(
      text: TextSpan(
        text: isColorBlindModeOn ? pinNum : '',
        style: textStyle
      ),
      textDirection: TextDirection.ltr
    );
    paint.color = textColor;
    var c = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(c, size.width / 2, paint);
    paint.color = pinColor;
    canvas.drawCircle(c, size.width / 2.3, paint);
    textPainter.layout();
    textPainter.paint(canvas, Offset((size.width - textPainter.width) / 2, (size.height - textPainter.height) / 2));

  }
  bool shouldRepaint (CustomPainter oldDelegate) {
    return true;
  }
}
