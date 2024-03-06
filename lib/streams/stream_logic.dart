import 'dart:async';

class StreamLogic {

  static String feedbackMessage = '';
  static final StreamController<String> streamControllerFBMessage = StreamController.broadcast();

  StreamLogic.constructor();

  static void errorMessage() {
    feedbackMessage = 'That input wasn\u0027t correct. Make sure you have chosen a color for all your pins.';
    streamControllerFBMessage.add(feedbackMessage);
  }

  static Stream<String> getStreamFBMessage() => streamControllerFBMessage.stream;

  static bool scoreScreenVisibility = false;
  static final StreamController<bool> streamControllerVisibility = StreamController.broadcast();

  static void visibilityToggle() {
    scoreScreenVisibility = !scoreScreenVisibility;
    streamControllerVisibility.add(scoreScreenVisibility);
  }

  static Stream<bool> getStreamVisibility() => streamControllerVisibility.stream;
}