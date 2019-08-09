import 'package:flutter/material.dart';

class MiniFloatingActionButton extends StatelessWidget {
  final IconData _icon;
  final Function _onTap;

  MiniFloatingActionButton(this._icon, this._onTap);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 32.0,
        height: 32.0,
        child: FloatingActionButton(
          onPressed: _onTap,
          child: Icon(_icon),
        ));
  }
}
