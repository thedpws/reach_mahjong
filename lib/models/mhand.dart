import 'dart:core';
import 'mtile.dart';
import 'mmeld.dart';

class MHand {
  final List<MTile> concealedTiles;
  final List<MMeld> melds;
  MTile? drawnTile;

  MHand(this.concealedTiles, this.melds);

  bool contains(MTile t) {
    if (concealedTiles.contains(t)) {
      return true;
    }

    return melds.where((m) => m.tiles.contains(t)).length > 0;

  }

  void discard(MTile toDiscard) {
    // TODO: Discard this tile from the concealed
    concealedTiles.remove(toDiscard);
  }

}
