import 'package:flutter/material.dart';

class TextArea extends StatelessWidget {
  final String _value;

  TextArea(this._value);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Row(children: [
      Flexible(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text(_value)],
        ),
      ),
    ]));
  }
}
