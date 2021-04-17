import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:flame/palette.dart';
import 'package:flame/sprite.dart';
import 'package:flame/gestures.dart';
import 'dart:core';

void main() {
  runApp(MainApp());
}


class MainApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return CupertinoApp(
      routes: <String, WidgetBuilder>{
        '/': (context) => HomePage(),
        '/about': (context) => AboutPage(),
        '/game': (context) => GamePage(),
      },
      color: Colors.white,
    );
  }
}

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[

              Text('Riichi Mahjong'),

              CupertinoButton(
                child: Text('Start game'),
                onPressed: () => { Navigator.pushNamed(context, '/game') },
              ),

              CupertinoButton(
                child: Text('About us'),
                onPressed: () => { Navigator.pushNamed(context, '/about') },
              ),

            ]
          )
        )
      )
    );
  }
}

class AboutPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('About route'),
      ),
      child: Center(child: Icon(CupertinoIcons.share)),
    );
  }
}

class MGame extends Game with TapDetector {

  @override
  void onTapDown(TapDownDetails event) {
  }

  @override
  void onTapUp(TapUpDetails event) {
  }

  @override
  void onTapCancel() {
  }


  @override
  Future<void> onLoad() async {
  }

  @override
  void update(double dt) {
  }

  @override
  void render(Canvas canvas) {
  }

  @override
  Color backgroundColor() => const Color(0xff35654d);

}


class GamePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Stack(
      fit: StackFit.expand,
      children: <Widget>[

        GameWidget(game: MGame()),

        GameUI(),
      ],
    );
  }

}


class Tile extends StatelessWidget {

  final MTile mTile;
  final onTap;
  final bool isActive;

  Tile(this.mTile, this.onTap, this.isActive);

  @override
  Widget build(BuildContext context) {

    double fitMultiplier = 4/5;
    double tWidth = 60.0 * fitMultiplier;
    double tHeight = 80.0 * fitMultiplier;
    if (this.mTile.name == null) return SizedBox(width: tWidth, height: tHeight);
    return GestureDetector(
      child: SizedBox(
        width: tWidth,
        height: tHeight * (this.isActive ? 1.4 : 1.0),
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




class Hand extends StatefulWidget {

  final List<MTile> hand;
  Hand(this.hand, { Key? key }) : super(key: key);

  @override
  _HandState createState() => _HandState(hand);

}

class _HandState extends State<Hand> {

  final List<MTile> hand;

  _HandState(this.hand);


  MTile newTile = new MTile('Sou7');

  late MTile activeTile = newTile;


  @override
  Widget build(BuildContext context) {

    // Retrieve the OnTap event from the children and handle them here in the parent.
    dynamic onTap(MTile t) {
      return () => setState( (){
          activeTile = t;
      });
    }

    List<MTile> buildHandView(List<MTile> hand) {
      return new List.from(hand)..addAll([new EmptyMTile(), this.newTile]);
    }

    return Row(
      // Spacing
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

      // Align bottom
      crossAxisAlignment: CrossAxisAlignment.end,

      children: buildHandView(this.hand).map<Tile>((MTile mTile) => Tile(mTile, onTap(mTile), activeTile != null && mTile == activeTile)).toList()
    );
  }
}

class GameUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    List<MTile> hand = <MTile>[
        new MTile('Man1'),
        new MTile('Man2'),
        new MTile('Man3'),
        new MTile('Pin4'),
        new MTile('Pin4'),
        new MTile('Pin4'),
        new MTile('Sou4'),
        new MTile('Sou5'),
        new MTile('Sou6'),
        new MTile('Chun'),
    ];

    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(50.0),

            // hand
            child: Hand(hand),

          )
        ]
      ),
    );
  }
}


class MTile {
  const MTile(this.name);
  final String? name;
}

class EmptyMTile extends MTile {
  EmptyMTile() : super(null);
}
