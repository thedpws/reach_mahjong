
import 'package:flutter/material.dart';
import 'discards.dart';
import '../models.dart';
import 'dart:core';
import 'dart:math' as math;


class MahjongTable extends StatelessWidget {

  List<MDiscard> mNorthDiscards;
  List<MDiscard> mEastDiscards;
  List<MDiscard> mSouthDiscards;
  List<MDiscard> mWestDiscards;

  MahjongTable(this.mNorthDiscards, this.mEastDiscards, this.mSouthDiscards, this.mWestDiscards);


  @override
  Widget build(BuildContext context) {
    Discards northDiscards = Discards(mNorthDiscards);
    Discards eastDiscards = Discards(mEastDiscards);
    Discards southDiscards = Discards(mSouthDiscards);
    Discards westDiscards = Discards(mWestDiscards);

    return Transform(
      transform: Matrix4.identity()..rotateX(-1.0),
      child: Transform.scale(scale: 0.8, child: Transform.translate(
        offset: Offset(0, -100),
        child: Table(
          border: TableBorder.all(),
          children: <TableRow>[

            TableRow(
              children: <Widget>[
                Container(),
                AspectRatio(aspectRatio: 1.0, child: Transform.rotate(angle: math.pi, child: northDiscards)),
                Container(),
            ]),

            TableRow(children: <Widget>[
                AspectRatio(aspectRatio: 1.0, child: Transform.rotate(angle: math.pi/2, child: westDiscards)),
                Container(),
                AspectRatio(aspectRatio: 1.0, child: Transform.rotate(angle: -math.pi/2, child: eastDiscards)),
            ]),

            TableRow(children: <Widget>[
                Container(),
                AspectRatio(aspectRatio: 1.0, child: Transform.rotate(angle: 0, child: southDiscards)),
                Container(),
            ]),
          ]
        )
      ),
    ));
  }

}
