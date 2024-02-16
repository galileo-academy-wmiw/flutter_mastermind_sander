import 'package:flutter/material.dart';
import 'package:flutter_mastermind_sander/game_screen.dart';
import 'package:flutter_mastermind_sander/score_screen.dart';
import 'codepin.dart';
import 'scorepin.dart';
import 'variables.dart';
import 'package:audioplayers/audioplayers.dart';


// Constructor for the widget of a row of pins that will make up the stages of the game
class RowOfPins extends StatefulWidget {
  RowOfPins({super.key});

  @override
  State<RowOfPins> createState() => _RowOfPinsState();
}

class _RowOfPinsState extends State<RowOfPins> with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {

  bool _active = true;

  Color colorOfCard () {
    if (_active && winStateAchieved) {
      return winStateColor;
    } else if (_active) {
      return primaryColor;
    } else {
      return backgroundColor;
    }
  }

  late Animation<double> animation;
  late AnimationController animationController;

  void initState() {
    animationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 1500)
    );
    animation = Tween<double>(begin: 0, end: 10).animate(animationController);
    animation.addListener(() {
      setState(() {

      });
    });
    animationController.forward();
    super.initState();
  }

  // This function describes what happens after the submit button is clicked
  void endTurn() {
    print(codePinColorSequence);
    // If-statement to check if input is correct (4 non-zero values):
    if (codePinColorSequence.contains(0)) {// Code to execute if input is incorrect:
      // Plays sound
      if (isSoundOn) {
        audioPlayer.play(AssetSource(startUpSound));
        // TODO: Change sound to something that indicates an error
      }
      // TODO: Add feedback to convey to user that the input is incorrect
    } else {// Perform next checks
      // Plays sound
      if (isSoundOn) {
        audioPlayer.play(AssetSource(startUpSound));
      }
      // Checks input against secret code and creates list with feedback values
      controlValues = checkCodes(codePinColorSequence);
      print('Control values: $controlValues');
      // Only if all 4 values are '2', the code is correct. This if-statement checks if the control values add up to 4 * 2 = 8
      if (controlValues.reduce((a, b) => a + b) < 8) {// If true, win condition not achieved yet
        // Check if user has tries left
        if (numOfTries - allRows.length > 0) {// If true, allow user to try again
          _active = false;
          makeNewRowOfPins();
          codePinColorSequence = [0, 0, 0, 0];

          GameScreen.notifier.add(true);
        } else {// If false, lose condition achieved
          print('You lost! You fool!');
          // TODO: Implement UI for losing the game
        }
      } else {// If false, win condition achieved
        winStateAchieved = true;
        Navigator.push(context,
        MaterialPageRoute(builder: (context) => ScoreScreen()));
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Opacity(
      opacity: _active ? animation.value / 10 : 0.9,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          color: colorOfCard(),
          shape: StadiumBorder(
            side: BorderSide(
              color: textColor,
              width: _active ? 2.5 : 2.0,
            )
          ),
          child: Container(
            height: 120,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Codepin(0, _active),
                Codepin(1, _active),
                Codepin(2, _active),
                Codepin(3, _active),
                Expanded(
                  child: Center(
                    child: IgnorePointer(
                      ignoring: _active ? false : true,
                      child: IconButton(
                        onPressed: (){
                          setState(() {
                            endTurn();
                          });
                        },
                        iconSize: 40,
                        color: textColor,
                        icon: const Icon(
                            Icons.play_arrow
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 80,
                    width: 120,
                    child: Center(
                      child: Container(
                        width: 80,
                        height: 80,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Scorepin(index: 0, isActive: _active,),
                                Scorepin(index: 1, isActive: _active,),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Scorepin(index: 2, isActive: _active,),
                                Scorepin(index: 3, isActive: _active,),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
