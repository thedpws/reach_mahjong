
import '../models/mtile.dart';
import 'tile.dart';
import 'package:flutter/material.dart';
import 'glow.dart';


class Dora extends StatelessWidget {
  final List<MTile> dora;
  const Dora(this.dora);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        margin: const EdgeInsets.all(4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: new List.from(
            this.dora.map<Widget>((MTile mTile) => Glow(
                child: Tile(mTile, () {}, height: 32.0, width: 24.0),
                period: Duration(seconds: 2),
                color: Colors.yellow,
              )
            ).toList(),
          ),
        ),
      )
    );
  }
}
