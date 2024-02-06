import 'package:flutter/material.dart';
import 'codepin.dart';
import 'scorepin.dart';
import 'variables.dart';
import 'package:audioplayers/audioplayers.dart';

// Constructor for the widget of a row of pins that will make up the stages of the game
class RowOfPins extends StatefulWidget {
  final bool active;
  const RowOfPins({super.key, this.active = false,});



  @override
  State<RowOfPins> createState() => _RowOfPinsState();
}

class _RowOfPinsState extends State<RowOfPins> with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: widget.active ? 1.0 : 0.2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          color: widget.active ? primaryColor : backgroundColor,
          shape: StadiumBorder(
            side: BorderSide(
              color: textColor,
              width: widget.active ? 2.5 : 2.0,
            )
          ),
          child: Container(
            height: 120,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Codepin(0, widget.active),
                Codepin(1, widget.active),
                Codepin(2, widget.active),
                Codepin(3, widget.active),
                Expanded(
                  child: Center(
                    child: IgnorePointer(
                      ignoring: widget.active ? false : true,
                      child: IconButton(
                        onPressed: (){
                          setState(() {
                            if (isSoundOn) {
                              audioPlayer.play(AssetSource(startUpSound));
                            }
                            print(codePinColorSequence);
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
                                Scorepin(),
                                Scorepin(),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Scorepin(),
                                Scorepin(),
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
}
