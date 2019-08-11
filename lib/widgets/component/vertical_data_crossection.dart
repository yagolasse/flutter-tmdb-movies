import 'package:flutter/material.dart';

class VerticalDataCrossSection extends StatelessWidget {
  final List<Widget> _children;
  final EdgeInsets _margin;
  VerticalDataCrossSection(this._margin, this._children);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: _margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _children,
      ),
    );
  }
}
