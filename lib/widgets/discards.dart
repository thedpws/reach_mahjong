import 'dart:core';
import 'dart:math' as math;
import 'package:flutter/material.dart';

import '../models/mdiscard.dart';
import '../models/mtile.dart';

import 'tile.dart';


// TODO set state when updating discards
class DiscardTile extends StatelessWidget {
  final MDiscard mDiscard;

  DiscardTile(this.mDiscard);

  @override
  Widget build(BuildContext context) {
    double fitMultiplier = 0.1;
    double tWidth = 60.0 * fitMultiplier;
    double tHeight = 80.0 * fitMultiplier;

    void onTap() {
    }

    // rotate
    if (this.mDiscard.riichi) {
      return Transform.rotate(
        angle: (-math.pi / 2.0),
        child: Tile(this.mDiscard.mTile, onTap, width: tHeight, height: tWidth),
      );
    }

    return Tile(this.mDiscard.mTile, onTap, width: tWidth, height: tHeight);
  }

}


class Discards extends StatelessWidget {

  final List<MDiscard> discards;

  const Discards(this.discards);

  @override
  Widget build(BuildContext context) {
    // cross is vertical
    return GridView.count(
      crossAxisSpacing: 0.0,
      mainAxisSpacing: 7.0,
      crossAxisCount: 6,
      children: this.discards.map<DiscardTile>((MDiscard mDiscard) => DiscardTile(mDiscard)).toList(),
    );
  }
}
