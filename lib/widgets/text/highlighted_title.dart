import 'package:flutter/material.dart';

class HighlightedTitle extends StatelessWidget {
  final String _value;

  HighlightedTitle(this._value);

  @override
  Widget build(BuildContext context) {
    final TextStyle theme = Theme.of(context).textTheme.display1;
    final EdgeInsets padding = EdgeInsets.only(left: 8.0);
    final BorderSide borderSide =
        BorderSide(width: 3.0, color: Colors.blueAccent);
    final Border border = Border(left: borderSide);

    return Container(
      padding: padding,
      decoration: BoxDecoration(border: border),
      child: Text(_value, style: theme),
    );
  }
}
