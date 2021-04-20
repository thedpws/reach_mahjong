import 'package:flutter/material.dart';

class Score extends StatelessWidget {

  final String wind;
  final int points;
  const Score(this.wind, this.points);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(2.0),
      color: Colors.yellow,
      child: Text(
        '${wind}: ${points}',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
