import 'package:flutter/material.dart';
import 'package:movies_flutter/models/credits.dart';
import 'package:movies_flutter/widgets/text/meta_display.dart';

class MetaDisplayGroup extends StatelessWidget {
  final Credits _credits;

  MetaDisplayGroup(this._credits);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MetaDisplay("Directors", _credits.getDirectorsNames()),
          Container(
            margin: EdgeInsets.only(left: 48.0),
            child: MetaDisplay("Screenwriters", _credits.getWritersNames()),
          ),
        ],
      ),
    );
  }
}
