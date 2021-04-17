import 'package:flutter/material.dart';

import '../models/mtile.dart';


class Tile extends StatelessWidget {

  final MTile mTile;
  final onTap;
  final bool isActive;


  const Tile(this.mTile, this.onTap, this.isActive);

  @override
  Widget build(BuildContext context) {

    double fitMultiplier = 4/5;
    double tWidth = 60.0 * fitMultiplier;
    double tHeight = 80.0 * fitMultiplier;
    if (this.mTile.name == null) return SizedBox(width: tWidth, height: tHeight);
    return GestureDetector(
      child: SizedBox(
        width: tWidth,
        height: tHeight * (this.isActive ? 1.4 : 1.0),
        child: Stack(
          children: <Widget> [
            Image.asset('assets/images/tiles/Front.png'),
            Image.asset('assets/images/tiles/${mTile.name}.png'),
          ]
        ),
      ),
      onTap: this.onTap,
    );
  }
}
