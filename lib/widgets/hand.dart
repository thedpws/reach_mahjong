import 'package:flutter/material.dart';

import '../models.dart';
import 'tile.dart';


class Hand extends StatefulWidget {

  final List<MTile> hand;
  Hand(this.hand, { Key? key }) : super(key: key);

  @override
  _HandState createState() => _HandState(hand);

}

class _HandState extends State<Hand> {

  final List<MTile> hand;

  _HandState(this.hand);


  MTile newTile = MTile.random();

  late MTile activeTile = newTile;


  @override
  Widget build(BuildContext context) {

    // Retrieve the OnTap event from the children and handle them here in the parent.
    dynamic onTap(MTile t) {
      return () => setState( (){
          activeTile = t;
      });
    }

    List<MTile> buildHandView(List<MTile> hand, MTile draw) {
      return List.from(hand)..addAll([MTile.empty(), draw]);
    }

    return Row(
      // Spacing
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

      // Align bottom
      crossAxisAlignment: CrossAxisAlignment.end,

      children: buildHandView(this.hand, this.newTile).map<Widget>(
        (MTile mTile) => AnimatedContainer(
            height: mTile == activeTile ? 85 : 60,
            duration: const Duration(milliseconds: 50),
            child: Tile(
              mTile,
              onTap(mTile),
              height: 60,
            ),
          )).toList()
    );
  }
}
