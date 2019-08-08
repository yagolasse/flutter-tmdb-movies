import 'package:flutter/material.dart';

class HighlightedTitle extends StatelessWidget {
  final String _value;

  HighlightedTitle(this._value);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.fromLTRB(8.0, 0.0, 0.0, 0.0),
      decoration: BoxDecoration(
        border: Border(left: BorderSide(width: 3.0, color: Colors.blueAccent)),
      ),
      child: Text(_value,
          style: Theme.of(context)
              .textTheme
              .body1
              .copyWith(color: Colors.black, fontSize: 18.0)),
    );
  }
}
