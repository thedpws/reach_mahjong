import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:flame/gestures.dart';

import 'widgets.dart';
import 'models.dart';


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

    return SafeArea(
      child: Center(
        child: Stack(
          children: <Widget>[

            // table
            Padding(
              padding: EdgeInsets.all(4.0),
              child: MahjongTable(
                List<MDiscard>.generate(13, (int index) => MDiscard(RandomMTile())),
                List<MDiscard>.generate(13, (int index) => MDiscard(RandomMTile())),
                List<MDiscard>.generate(13, (int index) => MDiscard(RandomMTile())),
                List<MDiscard>.generate(13, (int index) => MDiscard(RandomMTile())),
              )
            ),

            // dora
            Padding(
              padding: EdgeInsets.all(4.0),
              child: Dora([MTile('Pin5-Dora')]),
            ),


            // hand
            Column(
              children: <Widget>[
                Expanded(child: Container()),
                Hand(hand),
                SizedBox(height: 20),
              ],
            ),

            Align(
              alignment: Alignment.topRight,
              child: Column(
                children: List<Score>.generate(4, (int i) => Score("Wind ${i}", 5000)),
              ),
            ),

            Center(
              child: Align(
                alignment: Alignment.centerLeft,
                child: SettingsMenu(),
              ),
            ),

          ]
        ),
      )
    );
  }
}


