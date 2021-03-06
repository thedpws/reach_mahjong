import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


// Will keep track of expanded or not expanded.
class SettingsMenu extends StatefulWidget {
  @override
  _SettingsMenuState createState() => _SettingsMenuState();
}


class _SettingsMenuState extends State<SettingsMenu> {

  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () {
        setState((){ _isExpanded = !_isExpanded; });
      },
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: SizedBox(
          width: 50.0,
          height: 50.0,
          child: _isExpanded ? null: Center(child: Icon(CupertinoIcons.bars)),
        ),
      )
    );
    /*
    return !_isExpanded ? CupertinoButton(
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Icon(CupertinoIcons.gear),
      ),
      onPressed: () {
        setState(() {
            _isExpanded = true;
        });
      },
    ) : Container(
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            children: <Widget> [

              CupertinoButton(
                child: Text('Quit game'),
                onPressed: () => { Navigator.pushNamed(context, '/') },
              ),

              CupertinoButton(
                child: Text('Settings'),
                onPressed: () => { Navigator.pushNamed(context, '/settings') },
              )

            ]
          ),
    );
    */

  }
}
