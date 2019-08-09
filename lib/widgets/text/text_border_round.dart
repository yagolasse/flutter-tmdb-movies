import 'package:flutter/material.dart';

class TextBorderRound extends StatelessWidget {
  final List<String> _value;
  final bool _hasBorder;

  TextBorderRound(this._value, [this._hasBorder = false]);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0.0, 0.0, 16.0, 0.0),
      padding: const EdgeInsets.all(8.0),
      decoration: _hasBorder
          ? BoxDecoration(
              border: Border.all(color: Colors.blueAccent),
              borderRadius: BorderRadius.all(const Radius.circular(4.0)))
          : null,
      child: Text(_value.join(", "),
          style: Theme.of(context)
              .textTheme
              .body1
              .copyWith(color: Colors.blueAccent, fontSize: 12.0)),
    );
  }
}
