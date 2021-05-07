import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Glow extends StatefulWidget {


  final Widget child;
  final Duration period;
  final Color color;

  Glow({
      required this.child,
      this.period = const Duration(seconds: 1),
      this.color = Colors.red
  });
  //Glow(this.child);
  @override
  //_GlowState createState() => _GlowState(period, child, color);
    _GlowState createState() => _GlowState(child);
}

class _GlowState extends State<Glow> {
  //final Duration period;
  final Widget child;
  //final Color color;

  _GlowState(this.child);

  @override
  Widget build(BuildContext context) {
    return this.child;
  }

}
