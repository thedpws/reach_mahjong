
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
  RandomMTile() : super('Blank');
}
