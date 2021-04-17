import 'dart:core';
import 'dart:math' as math;
import 'package:flutter/material.dart';

import '../models/mdiscard.dart';
import '../models/mtile.dart';

class Discards extends StatefulWidget {

  _DiscardsState createState() => _DiscardsState();

}

// TODO set state when updating discards
class DiscardTile extends StatelessWidget {
  final MDiscard mDiscard;

  DiscardTile(this.mDiscard);

  @override
  Widget build(BuildContext context) {
    double fitMultiplier = 0.1;
    double tWidth = 60.0 * fitMultiplier;
    double tHeight = 80.0 * fitMultiplier;

    if (this.mDiscard.riichi) {
      tWidth = 80.0 * fitMultiplier;
      tHeight = 60.0 * fitMultiplier;
    }

    return SizedBox(
      width: tWidth,
      height: tHeight,
      child: Transform.rotate(
        angle: mDiscard.riichi ? (-math.pi / 2.0) : 0.0,
        child: Stack(
          children: <Widget> [
            Image.asset('assets/images/tiles/Front.png'),
            Image.asset('assets/images/tiles/${mDiscard.mTile.name}.png'),
          ],
        ),
      ),
    );
  }

}


class _DiscardsState extends State<Discards> {

  List<MDiscard> northDiscards = <MDiscard>[
    MDiscard(RandomMTile()),
    MDiscard(RandomMTile()),
    MDiscard(RandomMTile()),
    MDiscard(RandomMTile()),
    MDiscard(RandomMTile()),
    MDiscard(RandomMTile()),
    MDiscard(RandomMTile()),
    MDiscard(RandomMTile()),
  ];
  List<MDiscard> eastDiscards = <MDiscard>[
    MDiscard(RandomMTile()),
    MDiscard(RandomMTile()),
    MDiscard(RandomMTile()),
    MDiscard(RandomMTile()),
    MDiscard(RandomMTile()),
    MDiscard(RandomMTile()),
    MDiscard(RandomMTile()),
  ];
  List<MDiscard> southDiscards = <MDiscard>[
    MDiscard(RandomMTile()),
    MDiscard(RandomMTile()),
    MDiscard(RandomMTile()),
    MDiscard(RandomMTile()),
    MDiscard(RandomMTile()),
    MDiscard(RandomMTile()),
    MDiscard(RandomMTile()),
    MDiscard(RandomMTile()),
    MDiscard(RandomMTile()),
  ];
  List<MDiscard> westDiscards = <MDiscard>[
    MDiscard(RandomMTile()),
    MDiscard(RandomMTile()),
    MDiscard(RandomMTile()),
    MDiscard(RandomMTile()),
    MDiscard(RandomMTile()),
    MDiscard(RandomMTile()),
    MDiscard(RandomMTile()),
  ];

  @override
  Widget build(BuildContext context) {

    // cross is vertical
    Widget north = GridView.count(
      crossAxisSpacing: 0.0,
      mainAxisSpacing: 7.0,
      crossAxisCount: 6,
      children: northDiscards.map<DiscardTile>((MDiscard mDiscard) => DiscardTile(mDiscard)).toList(),
    );
    Widget east = GridView.count(
      crossAxisSpacing: 0.0,
      mainAxisSpacing: 7.0,
      crossAxisCount: 6,
      children: eastDiscards.map<DiscardTile>((MDiscard mDiscard) => DiscardTile(mDiscard)).toList(),
    );

    Widget south = GridView.count(
      crossAxisSpacing: 0.0,
      mainAxisSpacing: 7.0,
      crossAxisCount: 6,
      children: southDiscards.map<DiscardTile>((MDiscard mDiscard) => DiscardTile(mDiscard)).toList(),
    );

    Widget west = GridView.count(
      crossAxisSpacing: 0.0,
      mainAxisSpacing: 7.0,
      crossAxisCount: 6,
      children: westDiscards.map<DiscardTile>((MDiscard mDiscard) => DiscardTile(mDiscard)).toList(),
    );


    // Returns discards with North face up
    return Transform(
      transform: Matrix4.identity()..rotateX(-1.0),
      child: Transform.scale(scale: 0.8, child: Transform.translate(
        offset: Offset(0, -100),
        child: Table(
          //border: TableBorder.all(),
          children: <TableRow>[

            TableRow(
              children: <Widget>[
                Container(),
                AspectRatio(aspectRatio: 1.0, child: Transform.rotate(angle: math.pi, child: north)),
                Container(),
            ]),

            TableRow(children: <Widget>[
                AspectRatio(aspectRatio: 1.0, child: Transform.rotate(angle: math.pi/2, child: west)),
                Container(),
                AspectRatio(aspectRatio: 1.0, child: Transform.rotate(angle: -math.pi/2, child: east)),
            ]),

            TableRow(children: <Widget>[
                Container(),
                AspectRatio(aspectRatio: 1.0, child: Transform.rotate(angle: 0, child: south)),
                Container(),
            ]),
          ]
        )
      ),
    ));
  }

}
