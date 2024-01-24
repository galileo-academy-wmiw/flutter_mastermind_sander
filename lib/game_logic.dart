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

// Function that creates and returns a list of 4 unique integers between 1 and 6
List<int> createNewCodeSnippet() {
  List<int> newCodeSnippet = [];
  while (newCodeSnippet.length < 4) {
    int nextValue = Random().nextInt(6) + 1;
    if (newCodeSnippet.contains(nextValue) == false) {
      newCodeSnippet.add(nextValue);
    }

  }
  return newCodeSnippet;
}

// Function that checks a list against the list stored in secretCode and returns a list with feedback
List<int> checkCodes(inputCode) {
  List<int> controlFeedback = [];
  for (int i = 0; i < 4; i++) {
    if (inputCode[i] == secretCode[i]) {
      controlFeedback.add(2);
    } else if (secretCode.contains(inputCode[i])) {
      controlFeedback.add(1);
    } else {
      controlFeedback.add(0);
    }
  }
  return controlFeedback;
}

void runGame() {
  secretCode = createNewCodeSnippet();
  print(secretCode);

  List<int> myCodeSnippet = [1, 2, 3, 4];
  print(checkCodes(myCodeSnippet));
}