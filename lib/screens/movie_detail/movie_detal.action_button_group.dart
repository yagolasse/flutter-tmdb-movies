import 'package:flutter/material.dart';
import 'package:movies_flutter/widgets/button/floating_action_button_mini.dart';

class ActionButtonGroup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const mainMargin = EdgeInsets.only(left: 16.0, right: 16.0, bottom: 32.0);
    return Container(
      margin: mainMargin,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _leftSideButtonGroup(),
          _rightSideButtonGroup(),
        ],
      ),
    );
  }

  Widget _leftSideButtonGroup() {
    return MiniFloatingActionButton(Icons.arrow_back, () {});
  }

  Widget _rightSideButtonGroup() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 16.0),
          child: MiniFloatingActionButton(Icons.edit, () {}),
        ),
        MiniFloatingActionButton(Icons.share, () {}),
      ],
    );
  }
}
