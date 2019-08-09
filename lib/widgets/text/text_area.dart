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
          children: [Text(_value, textAlign: TextAlign.justify, style: Theme.of(context)
              .textTheme
              .body1
              .copyWith(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 14.0))],
        ),
      ),
    ]));
  }
}
