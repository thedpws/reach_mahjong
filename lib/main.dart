import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:flame/palette.dart';

void main() {
  runApp(GameWidget(game: MyGame()));
}


class MyGame extends Game {

  static const int SQUARE_SPEED = 20;

  static final SQUARE_PAINT = BasicPalette.white.paint();

  late Rect squarePos;

  int squareDirection = 1;

  @override
  Future<void> onLoad() async {
    squarePos = Rect.fromLTWH(0, 0, 100, 100);
  }

  @override
  void update(double dt) {
    squarePos = squarePos.translate(SQUARE_SPEED * squareDirection * dt, 0);

    if (squarePos.right > size.x || squarePos.left < 0)
      squareDirection *= -1;
  }


  @override
  void render(Canvas canvas) {
    canvas.drawRect(squarePos, SQUARE_PAINT);
  }
}
