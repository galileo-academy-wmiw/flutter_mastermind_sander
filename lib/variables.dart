import 'package:flutter/material.dart';
import 'theme.dart';
import 'package:audioplayers/audioplayers.dart';

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

// Number of tries
double numOfTries = 12;
