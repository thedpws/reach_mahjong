import 'package:test/test.dart';
import 'package:reach_mahjong/models/mhand.dart';
import 'package:reach_mahjong/models/mtile.dart';
import 'package:reach_mahjong/models/mmeld.dart';

void main() {
  test('loads params', () {
    MHand([], []);
  });

  test('discards', () {
    List<MTile> concealed = [
        MTile('Man1'),
        MTile('Man2'),
        MTile('Man3'),
        MTile('Pin1'),
        MTile('Pin2'),
        MTile('Pin3'),
        MTile('Sou1'),
        MTile('Sou2'),
        MTile('Sou3'),
        MTile('Nan'),
        MTile('Nan'),
        MTile('Nan'),
        MTile('Chun'),
    ];

    MHand hand = MHand(concealed, []);
    expect(true, hand.contains(MTile('Pin3')));
    hand.discard(MTile('Pin3'));
    expect(false, hand.contains(MTile('Pin3')));
  });

  test('contains checks melds too', () {
    List<MTile> concealed = [
        MTile('Man1'),
        MTile('Man1'),
        MTile('Man1'),
        MTile('Man1'),
        MTile('Man1'),
        MTile('Man1'),
        MTile('Man1'),
        MTile('Man1'),
        MTile('Man1'),
        MTile('Man1'),
        MTile('Man1'),
    ];

    List<MMeld> melds = [
      MMeld([
          MTile('Man3'),
          MTile('Man3'),
          MTile('Man3'),
      ])
    ];

    MHand hand = MHand(concealed, melds);
    expect(true, hand.contains(MTile('Man3')));
  });
}
