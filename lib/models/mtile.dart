import 'dart:math' as math;

class MTile {
  const MTile(this.name);
  final String? name;
}

class EmptyMTile extends MTile {
  EmptyMTile() : super(null);
}

class BlankMTile extends MTile {
  BlankMTile() : super('Blank');
}

class RandomMTile extends MTile {

  static const ALL_TILE_NAMES = [
    'Chun',
    'Front',
    'Haku',
    'Hatsu',
    'Man1',
    'Man2',
    'Man3',
    'Man4',
    'Man5',
    'Man5-Dora',
    'Man6',
    'Man7',
    'Man8',
    'Man9',
    'Pin1',
    'Pin2',
    'Pin3',
    'Pin4',
    'Pin5',
    'Pin5-Dora',
    'Pin6',
    'Pin7',
    'Pin8',
    'Pin9',
    'Sou1',
    'Sou2',
    'Sou3',
    'Sou4',
    'Sou5',
    'Sou5-Dora',
    'Sou6',
    'Sou7',
    'Sou8',
    'Sou9',
    'Nan',
    'Pei',
    'Ton',
  ];

  RandomMTile() : super(ALL_TILE_NAMES[math.Random().nextInt(ALL_TILE_NAMES.length)]);
}
