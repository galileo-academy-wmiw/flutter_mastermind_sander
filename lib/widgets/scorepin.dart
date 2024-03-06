import 'package:flutter/material.dart';
import '../variables.dart';
import 'dart:async';



class Scorepin extends StatefulWidget {
  final int index;
  final bool isActive;
  Scorepin({super.key, required this.index, required this.isActive});

  @override
  State<Scorepin> createState() => _ScorepinState();
}

class _ScorepinState extends State<Scorepin> {

  @override
  Widget build(BuildContext context) {
    Future<Widget> scorePinAppear = Future.delayed(Duration(milliseconds: widget.isActive ? 0 : 1500 - (controlValues[widget.index] * 500)), () {
      if (!widget.isActive) {
        return Container(
          width: 25,
          height: 25,
          child: CustomPaint(
            painter: PainterTestCodePin(
                scorePinColorList[controlValues[widget.index]],
                controlValues[widget.index].toString(),
                scorePinTextStyle),
            size: Size(25, 25),
          ),
        );
      } else {
        return Container(
          width: 25,
          height: 25,
        );
      }
    });
    return FutureBuilder(
        initialData: Container(
          width: 25,
          height: 25,
        ),
        future: scorePinAppear,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return snapshot.data;
        }
    );

  }
}
