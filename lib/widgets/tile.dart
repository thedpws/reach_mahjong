import 'package:flutter/material.dart';

import '../models/mtile.dart';


class Tile extends StatelessWidget {

  final MTile mTile;
  final onTap;

  final double width;
  final double height;

  const Tile(this.mTile, this.onTap, {this.width=48.0, this.height=80.0*4/5});

  @override
  Widget build(BuildContext context) {

    if (this.mTile.name == null) return SizedBox(width: this.width, height: this.height);
    return GestureDetector(
      child: SizedBox(
        width: this.width,
        height: this.height,
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
