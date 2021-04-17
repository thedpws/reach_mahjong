
import '../models/mtile.dart';
import 'tile.dart';
import 'package:flutter/material.dart';


class Dora extends StatelessWidget {
  final List<MTile> dora;
  const Dora(this.dora);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: new List.from(
          [Padding(
              child: Text('Dora'),
              padding: EdgeInsets.all(4.0),
          )]
        )..addAll(
          this.dora.map<Widget>((MTile mTile) => Tile(mTile, () {}, false)).toList()
        ),
      ),
    );
  }
}
