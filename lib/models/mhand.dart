import 'dart:core';
import 'mtile.dart';
import 'mmeld.dart';

class MHand {
  final List<MTile> concealedTiles;
  final List<MMeld> melds;

  MHand(this.concealedTiles, this.melds, this.drawTile);

  MTile? drawTile;


  List<MTile> tiles() {
    // TODO: Return all tiles
    return <MTile>[];
  }

  void discard(MTile t) {
    // TODO: Discard this tile from the concealed
  }

  void draw(MTile t) {
    this.drawTile = t;
  }
}
