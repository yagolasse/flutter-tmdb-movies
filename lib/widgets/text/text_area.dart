import 'package:flutter/material.dart';

class TextArea extends StatelessWidget {
  final String _value;

  TextArea(this._value);

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    final Text text =
        Text(_value, textAlign: TextAlign.justify, style: textStyle);
    return Center(
        child: Row(children: [
      Flexible(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [text],
        ),
      ),
    ]));
  }
}
