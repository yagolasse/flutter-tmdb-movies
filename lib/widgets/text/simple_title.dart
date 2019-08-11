import 'package:flutter/material.dart';

class SimpleTitle extends StatelessWidget {
  final String _value;
  SimpleTitle(this._value);

  @override
  Widget build(BuildContext context) {
    final TextStyle titleTextStyle = Theme.of(context).textTheme.title;
    return Container(
      margin: const EdgeInsets.only(
        top: 48.0,
      ),
      child: Text(
        _value,
        textAlign: TextAlign.start,
        style: titleTextStyle,
      ),
    );
  }
}
