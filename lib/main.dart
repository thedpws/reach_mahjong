import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:flame/palette.dart';
import 'package:flame/sprite.dart';
import 'package:flame/gestures.dart';

void main() {
  runApp(GameWidget(game: SpriteGame()));
}


class SquareGame extends Game {

  static const int SQUARE_SPEED = 200;

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


class SpriteGame extends Game with TapDetector {

  late SpriteAnimation runningRobot;
  late Sprite pressedButton;
  late Sprite unpressedButton;
  late Sprite tile;


  final buttonPosition = Vector2(175-32, 425);
  final buttonSize = Vector2(120, 30);
  bool isPressed = false;

  final robotPosition = Vector2(175, 350);
  final robotSize = Vector2(48, 60);

  final tilePosition = Vector2(175, 350);
  final tileSize = Vector2(40, 50);

  @override
  void onTapDown(TapDownDetails event) {
    final buttonArea = buttonPosition & buttonSize;
    isPressed = buttonArea.contains(event.globalPosition);
  }

  @override
  void onTapUp(TapUpDetails event) {
    isPressed = false;
  }

  @override
  void onTapCancel() {
    isPressed = false;
  }


  @override
  Future<void> onLoad() async {
    runningRobot = await loadSpriteAnimation(
      'robot.png',
      SpriteAnimationData.sequenced(
        amount: 8,
        textureSize: Vector2(16, 18),
        stepTime: 0.1,
      )
    );

    unpressedButton = await loadSprite(
      'buttons.png',
      srcPosition: Vector2.zero(),
      srcSize: Vector2(60, 20),
    );

    pressedButton = await loadSprite(
      'buttons.png',
      srcPosition: Vector2(0, 20),
      srcSize: Vector2(60, 20),
    );

    tile = await loadSprite('tiles/Chun.png');
  }

  @override
  void update(double dt) {
    if (isPressed)
      runningRobot.update(dt);
  }

  @override
  void render(Canvas canvas) {
    runningRobot
      .getSprite()
      .render(canvas, position: robotPosition, size: robotSize);

    final Sprite button = isPressed ? pressedButton : unpressedButton;

    button.render(canvas, position: buttonPosition, size: buttonSize);

    tile.render(canvas, position: tilePosition, size: tileSize);
  }

  @override
  Color backgroundColor() => const Color(0xFF222222);

}
