import 'package:flutter/material.dart';
import 'codepin.dart';
import 'scorepin.dart';

class GameScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      height: 2200,
      color: Colors.purple,
      child: Expanded(
        child: Column(
          children: [
            Container(
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(child: Codepin()),
                  Expanded(child: Codepin()),
                  Expanded(child: Codepin()),
                  Expanded(child: Codepin()),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Scorepin(),
                            Scorepin(),
                          ],
                        ),
                        Row(
                          children: [
                            Scorepin(),
                            Scorepin(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      )
    );
  }
}