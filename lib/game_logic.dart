import 'dart:math';

class Scorepin {
  int colorValue;
  Scorepin(this.colorValue);
  String get colorOfPin {
    switch (colorValue) {
      case 0:
        return 'No color';
      case 1:
        return 'White';
      case 2:
        return 'Black';
      default:
        return 'Error';
    }
  }
}

// Initialize empty list
List<int> secretCode = [];





/*void runGame() {
  secretCode = createNewCodeSnippet();
  print(secretCode);

  List<int> myCodeSnippet = [1, 2, 3, 4];
  print(checkCodes(myCodeSnippet));
}*/